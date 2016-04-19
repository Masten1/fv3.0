jQuery ($) ->
  contactInnerButton = $(".contacts-submit")
  contactAddWrapper = $(".contacts-hover-wrapper-add")
  hoverAddContainer = ".hover-add-container"

  contactInnerButton.click ->
    contactAddWrapper.show()
    contactInnerButton.toggleClass "activeContactAdd"

  contactAddWrapper.click (e) ->
    $(@).hide() if not $(e.target).parents().is hoverAddContainer
    contactInnerButton.toggleClass "activeContactAdd"