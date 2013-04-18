window.app =
  people : ['a', 'b', 'c', 'd']
  assign_now: ->
    assignment_id = $('#assignment_id').data('assignment-id')
    classroom_id = $('#classroom_id').data('classroom-id')
    settings =
      dataType: 'script'
      type: "post"
      url: "/start_quiz"
      data: {classroom_id: classroom_id, assignment_id: assignment_id}
    $.ajax(settings)
  clear_questions_answers: (e) ->
    e.preventDefault()
    $('#answer_form').empty()
    $('#question_form').empty()
    $('#question_form_btn form').submit()
    $('#finish_question').toggle()
  clear_form: (e) ->
    e.preventDefault()
    $('#form').slideUp "slow", ->
    $('#form').empty()
  ready: ->
    $('body').on('click', 'a[data-clear-form]', app.clear_form)
    x = d3.scale.linear().domain([0, d3.max(app.people)]).range([0, 420])
    y = d3.scale.ordinal().domain(app.people).rangeBands([0, 120])
    chart = d3.select('svg').attr('class', 'chart')
    chart.selectAll('rect').data(app.people).enter().append('rect').attr("x", (d, i) -> i * 51 ).attr("width", 50).attr("height", 25 )
    chart.selectAll("text").data(app.people).enter().append("text").attr("x", (d, i) -> i * 51 + 22 ).attr("y", 10 ).attr("dx", -3).attr("dy", ".35em").attr("text-anchor", "end").text(String)

$(document).ready(app.ready)