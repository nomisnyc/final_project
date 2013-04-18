class SmsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @sms = Sms.create(:incoming_number => params['From'], :content_received => params['Body'])
    user = User.where(phone: params['From']).first
    user = User.create(phone: params['From'], password: "a", password_confirmation: "a") if user.nil?
    if user.name == nil
      user.register(@sms.content_received)
    elsif @sms.content_received.match(/class/)
      random = @sms.content_received.downcase.split(/class/).delete_if(&:empty?).strip
      Classroom.find_by_random(random)
    elsif @sms.content_received.match(/projects/)
      user.text_homeworks
      session[:state] = "choosing hw"
    elsif session[:state] == "choosing hw"
      chosen_hw = @sms.content_received.match(/\d/).to_s[0].to_i
      homework = user.homeworks[chosen_hw - 1]
      session[:homework_id] = homework.id
      session[:question_id] = homework.questions.first.id
      question = Question.find(session[:question_id])
      question.send_question(user)
      session[:state] = "doing hw"
    elsif session[:state] == "doing hw"
      homework = Homework.find(session[:homework_id])
      session[:hw_q_index] ||= 0
      question = homework.questions[session[:hw_q_index]]
      num_qs = homework.questions.count

      answer = @sms.content_received.match(/[a]{1}/).to_s.upcase
      response = Response.create(homework_id: homework.id, question_id: question.id, answer: answer)
      response.is_correct?

      session[:hw_q_index] += 1
      if session[:hw_q_index] < num_qs
        question.send_question(user)
        session[:question_id] = question.next.id if question.next.present?
        binding.pry
      else
        session[:state] = nil
        session[:homework_id] = nil
        session[:hw_q_index] = nil
        message = "You have no more questions!"
        Text.send_text_to(user, message)
      end

    end
    render :nothing => true
  end
end