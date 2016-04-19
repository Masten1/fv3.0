jQuery ($) ->
  questionButton = $("#nav-footer-question")
  questionAddWrapper = $(".question-wrapper-add")
  hoverAddContainer = ".hover-add-container"

  questionButton.click ->
    questionAddWrapper.show()
    questionButton.toggleClass "nav-footer-question-active"

  questionAddWrapper.click (e) ->
    $(@).hide() if not $(e.target).parents().is hoverAddContainer
    questionButton.toggleClass "nav-footer-question-active"