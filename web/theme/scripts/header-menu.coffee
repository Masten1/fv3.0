$(document).ready ->
  subNavDom = $('.header-nav-item .header-subNav-item-hidden .header-subNavChildren-item p')
  subNavDom2 = $('.header-subNavChildren-hidden a')
  staticHeader = $("#header-static-hide")
  homeSubNavItem = $(".only-home-subNav")

  $('.header-nav-item .header-subNav-item').click ->
    $(@).toggleClass "colorWhite"
    $(@).parent().toggleClass "borderNone"
    $(@).parent().find('.header-subNavChildren-item').slideToggle 200
    $('.header-subNavChildren-hidden').hide()

  subNavDom.click ->
    subParent = $(@).parent().closest("div")
    parent = subParent.parent().closest("div")
    parent.find('.header-subNavChildren-hidden').slideToggle 200

  subNavDom2.click ->
    staticHeader.toggleClass "click-active-static-header"

  $('.header-nav-item .header-subNav-item-hidden .header-subNavChildren-hidden a').click (e) ->
    e.stopPropagation()
    $('#hamburgNav').toggleClass "active-hamburg-menu"
    $('.wrapper-content').toggleClass "hidden-wrapper"

  homeSubNavItem.click (e) ->
    e.stopPropagation()
    $('#hamburgNav').toggleClass "active-hamburg-menu"
    $('.wrapper-content').toggleClass "hidden-wrapper"

  $('.header-menu-icon, #close-header-menu').click (e) ->
    e.stopPropagation()
    $('#hamburgNav').toggleClass "active-hamburg-menu"
    $('.wrapper-content').toggleClass "hidden-wrapper"
    subParent = subNavDom.parent().closest("div")
    parent = subParent.parent().closest("div")
    parentItem = parent.parent().closest("div")
    parentItem.addClass "active-subNav-children"
    parent.addClass "active-subNavChild"
    section = parent.find('.header-subNavChildren-hidden')
    sectionHref = section.find('a')
    staticHeader.toggleClass "click-active-static-header"

    sectionHref.click ->
      sectionHref.removeClass "sectionHref"
      $(@).addClass "sectionHref"

  $('.wrapper').on "click", ".hidden-wrapper", ->
    $('#hamburgNav').toggleClass "active-hamburg-menu"
    $('.wrapper-content').toggleClass "hidden-wrapper"
    staticHeader.toggleClass "click-active-static-header"

  addHoverButton = $(".header-blog-inner-button")
  addHoverWrapper = $(".addDoctor-blog-hover-wrapper")
  questionStaticButton = $(".static-question")
  questionWrapper = $(".question-static-wrapper-add")
  callStaticButton = $(".static-call")
  callStaticWrapper = $(".static-call-wrapper-add")
  hoverAddContainer = ".hover-add-container"

  addHoverButton.click ->
    addHoverWrapper.show()
    addHoverButton.toggleClass "activeBlogInner"

  addHoverWrapper.click (e) ->
    $(@).hide() if not $(e.target).parents().is hoverAddContainer
    addHoverButton.toggleClass "activeBlogInner"

  questionStaticButton.click ->
    questionWrapper.show()
    questionStaticButton.toggleClass "activeBlogInner"

  questionWrapper.click (e) ->
    $(@).hide() if not $(e.target).parents().is hoverAddContainer
    questionStaticButton.toggleClass "activeBlogInner"
    staticHeader.removeClass 'not-show-header-static'

  callStaticButton.click ->
    callStaticWrapper.show()
    callStaticButton.toggleClass "activeBlogInner"

  callStaticWrapper.click (e) ->
    $(@).hide() if not $(e.target).parents().is hoverAddContainer
    callStaticButton.toggleClass "activeBlogInner"
    staticHeader.removeClass 'not-show-header-static'

  addSignButton = $(".header-menu-button-add")
  addSignWrapper = $(".headerAddMenu-wrapper")
  addStatic = $(".static-add")
  containerStatic = $(".container-static-buttons")
  staticButtons = $(".static-add, .static-question, .static-call")

  addSignButton.click ->
    addSignWrapper.show()
    addSignButton.toggleClass "activeHeaderAdd"

  addStatic.click ->
    addSignWrapper.show()
    addSignButton.toggleClass "activeBlogInner"

  staticButtons.click ->
    staticButtons.addClass 'active-static-click'
    staticHeader.addClass 'not-show-header-static'

  addSignWrapper.click (e) ->
    $(@).hide() if not $(e.target).parents().is hoverAddContainer
    addSignButton.toggleClass "activeHeaderAdd"
    staticButtons.removeClass 'active-static-click'
    staticHeader.removeClass 'not-show-header-static'