window.app =
  # clear_questions_answers: (e) ->
  #   e.preventDefault()
  #   $('#answer_form').empty()
  #   $('#question_form').empty()
  #   $('#question_form_btn form').submit()
    # $('#finish_question').toggle()

  document_ready: ->
    $('body').on('click', 'a[data-clear-form]', app.clear_form)

  clear_form: (e) ->
    e.preventDefault()
    $('#form').slideUp "slow", ->
      $('#form').empty()

$(document).ready(app.document_ready)
