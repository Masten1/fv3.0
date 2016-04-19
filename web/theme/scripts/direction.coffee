jQuery ($) ->

  tabsDir = $(".diagnostic-wrapper").find "div"
  tabsContentDir = $(".diagnostic-tabs").children "section"

  tabsDirSub = $(".diagnostic-sub-tabs").find "li"
  tabsContentDirSub = $(".diagnostic-tabs-sub-content").children "div"

  tabsDirSub2 = $(".diagnostic-sub-tabs-2").find "li"
  tabsContentDirSub2 = $(".diagnostic-tabs-sub-content-2").children "div"


  tabsPrice = $(".direction-price-left").find "div"
  tabsContentPrice = $(".direction-price-right").children "section"

  tabsPrice.first().addClass 'active-price'
  tabsContentPrice.first().addClass 'active-content-price'

  tabsPrice.click (e) ->
    clicked = $ @
    content = $ "." + clicked.find("section").data "href"
    e.stopPropagation()
    e.preventDefault()
    tabsPrice.removeClass "active-price"
    tabsContentPrice.removeClass "active-content-price"
    clicked.addClass "active-price"
    content.addClass "active-content-price"
    tabsContentPrice.parent().scrollTop 0


  tabsDir.first().addClass 'active'
  tabsContentDir.first().addClass 'activeFirstList'

  $('div#mySliderTabs').sliderTabs(
    autoplay: false
    mousewheel: false
    position: 'top',
    indicators: true,
    tabSlideLength: 300)

  $('div#mySliderTabs2').sliderTabs(
    autoplay: false
    mousewheel: false
    position: 'top',
    indicators: true,
    tabSlideLength: 300)

  diagnosticHeight = $('.diagnostic #diagnostic-1').height()


  tabsDir.click (e) ->
    clicked = $ @
    content = $ "." + clicked.find("section").data "href"
    e.stopPropagation()
    e.preventDefault()
    tabsDir.removeClass "active"
    tabsContentDir.removeClass "activeFirstList"
    clicked.addClass "active"
    content.addClass "activeFirstList"
    tabsContentDir.parent().scrollTop 0
    $('.diagnostic #diagnostic-1').height diagnosticHeight
    $("#mySliderTabs2 .diagnostic-button-add").click ->
      $(".diagnostic-hover-wrapper-add").show()
      $(".diagnostic-button-add").toggleClass "activeDiagnostic"

  $(".diagnostika").click ->
    $('.diagnostic #diagnostic-1').height diagnosticHeight

  $(".lechenie").click ->
    setTimeout(
      -> therapyHeight = $('#therapy-1').height(); $('.therapy .ui-slider-tabs-content-container').height therapyHeight
      500
    )

  tabsDirSub.first().addClass 'active'
  tabsContentDirSub.first().addClass 'active'

  tabsDirSub.click (e) ->
    clicked = $ @
    content = $ "." + clicked.children("a").data "href"
    e.stopPropagation()
    e.preventDefault()
    tabsDirSub.removeClass "active"
    tabsContentDirSub.removeClass "active"
    clicked.addClass "active"
    content.addClass "active"
    tabsContentDirSub.parent().scrollTop 0


  tabsDirSub2.first().addClass 'active'
  tabsContentDirSub2.first().addClass 'active'

  tabsDirSub2.click (e) ->
    clicked = $ @
    content = $ "." + clicked.children("a").data "href"
    e.stopPropagation()
    e.preventDefault()
    tabsDirSub2.removeClass "active"
    tabsContentDirSub2.removeClass "active"
    clicked.addClass "active"
    content.addClass "active"
    tabsContentDirSub2.parent().scrollTop 0

  $('.price-list-li').each ->
    definition = $(this).find('.definition')
    definitionBorder = $(this).find('.definition-border')
    priceValute = $(this).find('.price-valute')
    widthDefinition = definition.width()
    thisWidth = $(this).width() - 10
    widthPriceValute = priceValute.width()
    definitionBorder.width(thisWidth - (widthDefinition + widthPriceValute))

  $('.direction-price-left-item').click ->
    $('.price-list-li').each ->
      definition = $(this).find('.definition')
      definitionBorder = $(this).find('.definition-border')
      priceValute = $(this).find('.price-valute')
      widthDefinition = definition.width()
      thisWidth = $(this).width() - 12
      widthPriceValute = priceValute.width()
      definitionBorder.width(thisWidth - (widthDefinition + widthPriceValute))


  complexInspectionButton = $("#add-complex-inspection")
  complexInspectionButtonMedia = $("#add-complex-inspection-media")
  diagnosticButton = $(".diagnostic-button-add")
  symptomButton = $(".symptom-button")
  doctorQuestionButton = $(".direction-doctor-question")
  doctorAddButton = $(".direction-doctor-add")
  showResumeButton = $(".direction-doctor-show-resume")
  getDiscountButton = $(".special-content-get-discount")
  howTherapiesButton = $(".how-therapies-button")


  hoverAddContainer = ".hover-add-container"
  hoverWrapper = $(".hover-wrapper-add")
  diagnosticWrapper = $(".diagnostic-hover-wrapper-add")
  symptomsWrapper = $(".symptoms-hover-wrapper-add")
  doctorQuestionWrapper = $(".question-hover-wrapper-add")
  doctorAddWrapper = $(".doctor-add-hover-wrapper-add")
  showResumeWrapper = $(".doctor-hover-wrapper")
  getDiscountWrapper = $(".discount-add-hover-wrapper-add")


  complexInspectionButton.click ->
    hoverWrapper.show()
    complexInspectionButton.toggleClass "activeInspection"

  complexInspectionButtonMedia.click ->
    hoverWrapper.show()
    complexInspectionButtonMedia.toggleClass "activeInspection"

  $(".diagnostic-tabs").on "click", '.diagnostic-button-add', ->
    diagnosticWrapper.show()
    diagnosticButton.toggleClass "activeDiagnostic"

  $(".mySliderTabsMobile").on "click", '.diagnostic-button-add', ->
    diagnosticWrapper.show()
    diagnosticButton.toggleClass "activeDiagnostic"

  symptomButton.click ->
    symptomsWrapper.show()
    symptomButton.toggleClass "activeSymptom"

  doctorQuestionButton.click ->
    doctorQuestionWrapper.show()

  doctorAddButton.click ->
    doctorAddWrapper.show()
    doctorAddButton.toggleClass "activeDoctorAdd"

  showResumeButton.click ->
    showResumeWrapper.show()

  getDiscountButton.click ->
    getDiscountWrapper.show()
    getDiscountButton.toggleClass "activeDiscountAdd"

  howTherapiesButton.click ->
    doctorAddWrapper.show()
    howTherapiesButton.toggleClass "activeTherapies"


  $(".hover-wrapper-add, .diagnostic-hover-wrapper-add, .symptoms-hover-wrapper-add, .question-hover-wrapper-add, .doctor-add-hover-wrapper-add, .doctor-hover-wrapper, .discount-add-hover-wrapper-add").click (e) ->
    $(@).hide() if not $(e.target).parents().is hoverAddContainer
    complexInspectionButton.toggleClass "activeInspection"
    diagnosticButton.toggleClass "activeDiagnostic"
    symptomButton.toggleClass "activeSymptom"
    doctorAddButton.toggleClass "activeDoctorAdd"
    getDiscountButton.toggleClass "activeDiscountAdd"
    howTherapiesButton.toggleClass "activeTherapies"


  $('.price-direction-short li .block-price-direction-open').click ->
    $(@).parent().find('.block-price-direction-hidden').slideToggle 200
    $(@).parent().siblings().find('.block-price-direction-hidden').hide()
    $(@).parent().find('.block-price-direction-open').toggleClass "prevDivDirection"
    $(@).parent().find('.direction-price-show-more').toggleClass "prevDir"
    $(@).parent().siblings().find('.block-price-direction-open').removeClass "prevDivDirection"
    $(@).parent().siblings().find('.direction-price-show-more').removeClass "prevDir"

  tabsDirMobile = $(".diagnostic-wrapper-mobile").find "div"
  tabsContentDirMobile = $(".diagnostic-tabs-mobile").children "section"

  tabsDirMobile.first().addClass 'active-mobile'
  tabsContentDirMobile.first().addClass 'activeFirstList-mobile'

  tabsDirMobile.click (e) ->
    clicked = $ @
    content = $ "." + clicked.find("section").data "href"
    e.stopPropagation()
    e.preventDefault()
    $('.mobile-description-tabs-hidden').hide()
    $('.mobile-cat-tabs-show').removeClass "prevDiv"
    $('.mobile-cat-tabs-arrow').removeClass "prev"
    tabsDirMobile.removeClass "active-mobile"
    tabsContentDirMobile.removeClass "activeFirstList-mobile"
    clicked.addClass "active-mobile"
    content.addClass "activeFirstList-mobile"
    tabsContentDirMobile.parent().scrollTop 0



  newHash = window.location.hash
  if newHash
    window.scrollTo 0, $("#diagnostic").offset().top + 70
    subSub = newHash.split('/')[0]
    subOriginalHash = subSub.split('#')[1]
    innerSubHash = newHash.split('/')[1]
    mobInnerHidden = document.getElementsByClassName('mobile' + '-' + subOriginalHash)
    directionId = document.getElementsByClassName(subOriginalHash)
    directionClass = document.getElementsByClassName(subOriginalHash)
    $('div#mySliderTabs2').sliderTabs(
      autoplay: false
      mousewheel: false
      position: 'top',
      indicators: true,
      tabSlideLength: 300)
    diagnosticWrap = $(".diagnostic-wrapper").find "div"
    diagnTabs = $(".diagnostic-tabs").find "section"
    diagnosticWrap.removeClass "active"
    diagnTabs.removeClass "activeFirstList"
    diagnMobTabs = $('.diagnostic-wrapper-mobile').find "div"
    diagnTabsMobile = $('.diagnostic-tabs-mobile').find "section"
    diagnTabsMobile.removeClass "activeFirstList-mobile"
    $(mobInnerHidden).addClass "activeFirstList-mobile"
    diagnMobTabs.removeClass "active-mobile"
    diagnMobTabs.removeClass "active"
    diagnMobTabs.removeClass "activeFirstList"
    $(directionId).addClass "active-mobile"
    $(directionId).addClass "active"
    $(directionClass).addClass "activeFirstList"
    innerDirClass = document.getElementsByClassName(innerSubHash)
    thisTabsClicked = $(innerDirClass).find "a"
    setTimeout(
      -> thisTabsClicked.trigger "click"
      1500
    )
    setTimeout(
      -> $(innerDirClass).trigger "click"
      1500
    )


  $("#slick-special-wrapper .slick-arrow, #slick-special-wrapper .slick-dots").click ->
    heightActive = $(".slick-track").find('.slick-active').height()
    if (heightActive < 320)
      heightActive = 320
    $("#slick-special-wrapper").css 'height': heightActive + 115

  $('.mySliderTabsMobile li').click ->
    $(@).find('.mobile-description-tabs-hidden').slideToggle 200
    $(@).siblings().find('.mobile-description-tabs-hidden').hide()
    $(@).find('.mobile-cat-tabs-show').toggleClass "prevDiv"
    $(@).find('.mobile-cat-tabs-arrow').toggleClass "prev"
    $(@).siblings().find('.mobile-cat-tabs-show').removeClass "prevDiv"
    $(@).siblings().find('.mobile-cat-tabs-arrow').removeClass "prev"
    window.scrollTo 0, $(".mySliderTabsMobile .prevDiv").offset().top - 100

  do ->
    directionLeftBlock = $('.direction-price-left')
    directionRightBlock = $('.direction-price-right')
    directionRightBlock.css 'height': directionLeftBlock.height()+22

$(document).ready ->
  faqOpen = $('.block-faq-short ul').find "li"
  faqOpen.first().find('.block-faq-open').toggleClass "prevDiv"
  faqOpen.first().find('.faq-show-more').toggleClass "prev"
  faqOpen.first().find('.block-faq-hidden').slideToggle 200

  $('.block-faq-short li .block-faq-open').click ->
    $(@).parent().find('.block-faq-hidden').slideToggle 200
    $(@).parent().siblings().find('.block-faq-hidden').hide()
    $(@).parent().find('.block-faq-open').toggleClass "prevDiv"
    $(@).parent().find('.faq-show-more').toggleClass "prev"
    $(@).parent().siblings().find('.block-faq-open').removeClass "prevDiv"
    $(@).parent().siblings().find('.faq-show-more').removeClass "prev"