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
  show_results: ->
    # d3.select("svg[data-question-id='44']").selectAll("rect").data(data)
    # col_a = ['matty', 'stephen', 'jill', 'brian']
    # col_b = ['joe', 'nicky', 'jill']
    # col_c = ['adi']
    # rects = d3.select('svg').selectAll('rect').data(col_a)

    # d3.select("svg[data-question-id='44']").selectAll("rect").data(col_a).enter().append("rect").attr("x", function(d, i) { return i * 20; }).attr("width", 20).attr("height", 20)

    # $("svg[data-question-id='44']")

  ready: ->
    x = d3.scale.linear().domain([0, d3.max(app.people)]).range([0, 420])
    y = d3.scale.ordinal().domain(app.people).rangeBands([0, 120])
    chart = d3.select('svg').attr('class', 'chart')
    chart.selectAll('rect').data(app.people).enter().append('rect').attr("x", (d, i) -> i * 51 ).attr("width", 50).attr("height", 25 )
    chart.selectAll("text").data(app.people).enter().append("text").attr("x", (d, i) -> i * 51 ).attr("y", 10 ).text(String)

$(document).ready(app.ready)
