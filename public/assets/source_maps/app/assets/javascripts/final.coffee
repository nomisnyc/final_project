window.app =
  clear_questions_answers: (e) ->
    e.preventDefault()
    $('#answer_form').empty()
    $('#question_form').empty()
    $('#question_form_btn form').submit()
    $('#finish_question').toggle()
