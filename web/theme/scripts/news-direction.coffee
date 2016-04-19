jQuery ($) ->
  $("#newsMore").click (e) ->
    offset = $ "#newsOffset"
    side = $ "#newsSide"
    direction = $ "#newsDirection"
    directionUrl = $(@).data 'href'
    e.preventDefault()
    e.stopPropagation()
    $.getJSON directionUrl, offset: offset.val(), side: side.val(), (resp) =>
      $(resp.mores).appendTo($("#newsContainer")).slideDown()
      offset.val parseInt(offset.val()) + 3
      side.val -> if side.val() is '0' then 1 else 0
      $(@).hide() unless resp.larger

  AddBlogInnerButton = $(".header-blog-inner-button")
  doctorAddBlogWrapper = $(".addDoctor-blog-hover-wrapper")
  hoverAddContainer = ".hover-add-container"

  AddBlogInnerButton.click ->
    doctorAddBlogWrapper.show()
    AddBlogInnerButton.toggleClass "activeBlogInner"

  doctorAddBlogWrapper.click (e) ->
    $(@).hide() if not $(e.target).parents().is hoverAddContainer
    AddBlogInnerButton.toggleClass "activeBlogInner"