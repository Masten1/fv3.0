$(document).ready ->
  commentTabs = $(".doctor-buttons").find "div"

  commentTabs.click (e) ->
    clicked = $ @
    content = $ "." + clicked.find("section").data "href"
    clicked.find(".doctor-show-resume").toggleClass "active-show-resume"
    e.stopPropagation()
    e.preventDefault()
    content.parent().slideToggle 200
    comment = content.find(".doctor-comments-wrapper")
    parentContent = clicked.parent().closest("section")
    parentContent.toggleClass("parent-active")
    if !comment.hasClass("slick-slide")
      content.find(".doctor-comments-wrapper").slick
        dots: false
        infinite: false
        speed: 300
        slidesToShow: 1
        slidesToScroll: 1
        responsive: [
          {
            breakpoint: 1024
            settings:
              slidesToShow: 1
              slidesToScroll: 1
              infinite: true
              dots: true
          }
          {
            breakpoint: 600
            settings:
              slidesToShow: 1
              slidesToScroll: 2
          }
          {
            breakpoint: 480
            settings:
              slidesToShow: 1
              slidesToScroll: 1
          }
        ]

jQuery ($) ->
  doctorInnerButton = $(".doctor-add")
  doctorAddWrapper = $(".doctor-add-hover-wrapper-add")
  hoverAddContainer = ".hover-add-container"
  successMessasge = $(".success-message")
  doctorCommentsForm = $(".form-doctor-comment")

  doctorInnerButton.click ->
    clicked = $ @
    doctorAddWrapper.show()
    doctorInnerButton.toggleClass "activeDoctorAdd"
    parentContent = clicked.parent().closest("section")
    $('.doctor-one').removeClass "parent-active-button"
    parentContent.addClass "parent-active-button"
    doctorNameInput = $("#doctors .parent-active-button .doctor-add").find(".getDoctorVal")
    doctorDirectionInput = $("#doctors .parent-active-button .doctor-add").find(".getDirectionVal")
    doctorInput = $(".form-hover-doctor-val")
    directionInput = $(".form-hover-direction-val")
    doctorInput.val doctorNameInput.val()
    directionInput.val doctorDirectionInput.val()

  doctorAddWrapper.click (e) ->
    $(@).hide() if not $(e.target).parents().is hoverAddContainer
    doctorInnerButton.toggleClass "activeDoctorAdd"

  $(".form-doctor-rating")
  .on 'mouseover mouseout', '.doctor-star', ->
    $(@).prevAll(".doctor-star").toggleClass "active"
  .on 'click', '.doctor-star', ->
    $(".fixed").removeClass "fixed"
    $(".input-doctor-rating").val $(@).data "value"
    $(@).addClass("fixed").prevAll(".doctor-star").addClass "fixed"

  doctorCommentsForm.submit (e) ->
    e.preventDefault()
    form = $ @
    $.post @action, form.serialize(), (response) ->
      data = JSON.parse response

      if data.type is 'success'

        successMessasge.show()
        setTimeout(
          ->
            doctorCommentsForm[0].reset()
            successMessasge.hide()
          4000
        )
      else
        for error in data.errors
          $(".comment-#{error}").addClass "error"

  doctorCommentsForm.on 'focus', '.error', ->
    $(@).removeClass 'error'
