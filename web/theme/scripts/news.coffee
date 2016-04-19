jQuery ($) ->
  $("#newsMore").click (e) ->
    offset = $ "#newsOffset"
    side = $ "#newsSide"
    e.preventDefault()
    e.stopPropagation()
    $.getJSON '/news/more', offset: offset.val(), side: side.val(), (resp) =>
      $(resp.more).appendTo($("#newsContainer")).slideDown()
      offset.val parseInt(offset.val()) + 1
      side.val -> if side.val() is '0' then 1 else 0
      $(@).hide() unless resp.larger
      $(".nav-pager").find(".news-numbers.active").last().next().addClass('active')

  $(".nav-pager").on "click", ".active", (e) ->
    e.preventDefault()

  newsHiddenLinks = $('.news-hidden-links')
  newsHiddenHoverSub = $('.news-hidden-hover-sub')
  newsHiddenSubIcon = $('.news-hidden-subIcon')

  $('.news-hidden-hover .news-hidden-hover-sub').click ->
    newsHiddenLinks.hide()
    newsHiddenHoverSub.removeClass "prevDiv"
    newsHiddenSubIcon.removeClass "prev"
    $(@).parent().find('.news-hidden-links').show()
    $(@).parent().find('.news-hidden-hover-sub').addClass "prevDiv"
    $(@).parent().find('.news-hidden-subIcon').addClass "prev"