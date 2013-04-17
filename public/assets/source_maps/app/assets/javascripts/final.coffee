window.app =
  assign_now: ->
    assignment_id = $('#assignment_id').data('assignment-id')
    classroom_id = $('#classroom_id').data('classroom-id')
    settings =
      dataType: 'script'
      type: "get"
      url: "/start_quiz"
      data: {classroom_id: classroom_id, assignment_id: assignment_id}
    $.ajax(settings)
