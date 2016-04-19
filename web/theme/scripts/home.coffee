jQuery ($) ->
  unless (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent))

      $('.wp1').waypoint ->
        $('.wp1').addClass 'animated fadeInRight'

      , offset: '85%'

      $('.wp2').waypoint ->
        $('.wp2').addClass 'animated zoomIn'

      , offset: '85%'

      $('.wp3').waypoint ->
        $('.wp3').addClass 'animated pulse'

      , offset: '85%'

      $('.wp4').waypoint ->
        $('.wp4').addClass 'animated rollIn'

      , offset: '85%'

      $("#blog-inner-inspection").parallaxify()
  else
    $('.wp1, .wp2, .wp3, .wp4').css('visibility', 'visible');


  tabs = $(".index-direction-image-wrapper").find "div"
  tabsContent = $("#direction-change-block").children "section"

  tabs.first().addClass 'active'
  tabsContent.first().addClass 'active'

  tabs.bind 'click touchstart', ->
    clicked = $ @
    content = $ "." + clicked.children("section").data "href"
    tabs.removeClass "active"
    tabsContent.removeClass "active"
    clicked.addClass "active"
    content.addClass "active"
    tabsContent.parent().scrollTop 0


  newHash = window.location.hash
  if newHash
    subOriginalHash = newHash.substring(1)
    directionId = document.getElementById(subOriginalHash)
    directionClass = document.getElementsByClassName(subOriginalHash)
    activeChildrenDiv = $('.index-direction-image-wrapper').children("div")
    activeChildrenSection = $('#direction-change-block').children("section")
    activeChildrenDiv.removeClass "active"
    activeChildrenSection.removeClass "active"
    $(directionId).addClass "active"
    $(directionClass).addClass "active"


  consultButton = $("#consult-phone")
  consultMediaButton = $("#consult-phone-media")
  consultAddWrapper = $(".consult-wrapper-add")
  hoverAddContainer = ".hover-add-container"
  directionIndexWrapper = $('.index-directions-left-sub-wrapper')
  contentDirectionWrapper = $('.index-directions-left-sub-description')
  directionMobileIndexWrapper = $('.index-directions-hidden-sub-wrapper')
  contentMobileDirectionWrapper = $('.index-directions-hidden-sub-description')
  directionRemove = $('.index-direction-remove')
  headerAddMenuWrapper = $('.headerAddMenu-wrapper')
  questionStaticWrapperAdd = $('.question-static-wrapper-add')
  staticCallWrapperAdd = $('.static-call-wrapper-add')
  questionWrapperAdd = $('.question-wrapper-add')
  hoverWrapperAdd = $('.hover-wrapper-add')
  diagnosticHoverWrapperAdd = $('.diagnostic-hover-wrapper-add')
  symptomsHoverWrapperAdd = $('.symptoms-hover-wrapper-add')
  questionHoverWrapperAdd = $('.question-hover-wrapper-add')
  doctorAddHoverWrapperAdd = $('.doctor-add-hover-wrapper-add')
  doctorHoverWrapper = $('.doctor-hover-wrapper')
  discountAddHoverWrapperAdd = $('.discount-add-hover-wrapper-add')
  contactsHoverWrapperAdd = $('.contacts-hover-wrapper-add')
  addDoctorBlogHoverWrapper = $('.addDoctor-blog-hover-wrapper')

  consultButton.click ->
    consultAddWrapper.show()
    consultButton.toggleClass "activeContactAdd"

  consultMediaButton.click ->
    consultAddWrapper.show()
    consultButton.toggleClass "activeContactAdd"

  consultAddWrapper.click (e) ->
    $(@).hide() if not $(e.target).parents().is hoverAddContainer
    consultButton.toggleClass "activeContactAdd"

  directionIndexWrapper.click (e) ->
    $(@).hide() if not $(e.target).parents().is contentDirectionWrapper

  directionMobileIndexWrapper.click (e) ->
    $(@).hide() if not $(e.target).parents().is contentMobileDirectionWrapper

  directionRemove.click (e) ->
    e.stopPropagation()
    e.preventDefault()
    directionMobileIndexWrapper.hide()
    consultAddWrapper.hide()
    headerAddMenuWrapper.hide()
    questionStaticWrapperAdd.hide()
    consultAddWrapper.hide()
    staticCallWrapperAdd.hide()
    questionWrapperAdd.hide()
    hoverWrapperAdd.hide()
    diagnosticHoverWrapperAdd.hide()
    symptomsHoverWrapperAdd.hide()
    questionHoverWrapperAdd.hide()
    doctorAddHoverWrapperAdd.hide()
    doctorHoverWrapper.hide()
    discountAddHoverWrapperAdd.hide()
    contactsHoverWrapperAdd.hide()
    addDoctorBlogHoverWrapper.hide()


  $('.item-slider-license').magnificPopup
    delegate: 'a'
    type: 'image'
    gallery: {
      enabled: true
    }

  unless typeof $.backgroundVideo is 'undefined'
    $("#home-bg").backgroundVideo
      $outerWrap: $("#video-container")

  $('.block-direction-short li .block-index-direction-open').click ->
    $(@).parent().find('.block-index-direction-hidden').slideToggle 200
    $(@).parent().siblings().find('.block-index-direction-hidden').hide()
    $(@).parent().find('.block-index-direction-open').toggleClass "prevDiv"
    $(@).parent().find('.direction-show-more').toggleClass "prev"
    $(@).parent().siblings().find('.block-index-direction-open').removeClass "prevDiv"
    $(@).parent().siblings().find('.direction-show-more').removeClass "prev"



jQuery(document).ready ->
  offset = 1500
  duration = 500
  jQuery(window).scroll ->
    if jQuery(this).scrollTop() > offset
      jQuery('.static-up').fadeIn duration
    else
      jQuery('.static-up').fadeOut duration
  jQuery('.back-to-top').click (event) ->
    event.preventDefault()
    jQuery('html, body').animate { scrollTop: 0 }, duration
    false


  offsetHeader = 40
  durationHeader = 100
  jQuery(window).scroll ->
    if jQuery(this).scrollTop() > offsetHeader
      jQuery('#header-static-hide').fadeIn durationHeader
      $('#hamburgNav').addClass "activeStaticNav"
    else
      jQuery('#header-static-hide').fadeOut durationHeader
      $('#hamburgNav').removeClass "activeStaticNav"

  domDirectionHome = $('.index-directions-left-sub-hover .index-directions-left-sub p')
  domDirectionMediaHome = $('.index-directions-hidden-sub-hover .index-directions-hidden-sub p')

  domDirectionHome.click (e) ->
    e.stopPropagation()
    e.preventDefault()
    $(@).parent().parent().find('.index-directions-left-sub-wrapper').show()

  domDirectionMediaHome.click (e) ->
    e.stopPropagation()
    e.preventDefault()
    $(@).parent().parent().find('.index-directions-hidden-sub-wrapper').show()
