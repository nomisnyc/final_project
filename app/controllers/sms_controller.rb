class SmsController < ApplicationController
  def create
    Sms.create(:incoming_number => params['From'], :content_received => params['Body'])
    user = User.find_or_create_by_phone(params['From'])

    session["counter"] ||= 0
    sms_count = session["counter"]
    if sms_count == 0
      message = "Hello, thanks for the new message."
    else
      message = "Hello, thanks for message number #{sms_count + 1}"
    end

    session["counter"] += 1
    Text.send_text_to(user, message)
  end
end