jQuery ($) ->
  getHiddenLang = $('.getHiddenLang').val()

  form = $ "#form-inspection"
  form.submit (e) ->
    e.preventDefault()
    styleSelected = $('#form-inspection .styledSelect')
    $('#direction-form-name-2').val styleSelected.text()
    $.post(
      form.attr('action')
      form.serialize()
      (resp) ->
        if resp.type is 'success'
          form.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            1500
          )
        else
          for error in resp.errors
            $(".form-inspection-#{error}").addClass 'error'
      'json'
    )

  form.on 'focus', '.error', ->
    $(@).removeClass 'error'


  formFree = $ "#form-free-consult"
  formFree.submit (e) ->
    e.preventDefault()
    styleSelected = $('#form-free-consult .styledSelect')
    $('#direction-form-name-4').val styleSelected.text()
    $.post(
      formFree.attr('action')
      formFree.serialize()
      (resp) ->
        if resp.type is 'success'
          formFree.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            1500
          )
        else
          for error in resp.errors
            $(".form-free-consult-#{error}").addClass 'error'
      'json'
    )

  formFree.on 'focus', '.error', ->
    $(@).removeClass 'error'


  formFreeHover = $ "#form-index-consult"
  formFreeHover.submit (e) ->
    e.preventDefault()
    styleSelected = $('#form-index-consult .styledSelect')
    $('#direction-form-name-3').val styleSelected.text()
    $.post(
      formFreeHover.attr('action')
      formFreeHover.serialize()
      (resp) ->
        if resp.type is 'success'
          formFreeHover.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            1500
          )
        else
          for error in resp.errors
            $(".form-hover-add-#{error}").addClass 'error'
      'json'
    )

  formFreeHover.on 'focus', '.error', ->
    $(@).removeClass 'error'


  formFooterQuestion = $ "#form-hover-footer-question"
  formFooterQuestion.submit (e) ->
    e.preventDefault()
    $.post(
      formFooterQuestion.attr('action')
      formFooterQuestion.serialize()
      (resp) ->
        if resp.type is 'success'
          formFooterQuestion.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            1500
          )
        else
          for error in resp.errors
            $(".form-hover-footer-#{error}").addClass 'error'
      'json'
    )

  formFooterQuestion.on 'focus', '.error', ->
    $(@).removeClass 'error'


  formAddBlog = $ "#form-hover-addDoctor-blog"
  formAddBlog.submit (e) ->
    e.preventDefault()
    styleSelected = $('#form-hover-addDoctor-blog .styledSelect')
    $('#direction-form-name-5').val styleSelected.text()
    $.post(
      formAddBlog.attr('action')
      formAddBlog.serialize()
      (resp) ->
        if resp.type is 'success'
          formAddBlog.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            1500
          )
        else
          for error in resp.errors
            $(".form-hover-blog-add-#{error}").addClass 'error'
      'json'
    )

  formAddBlog.on 'focus', '.error', ->
    $(@).removeClass 'error'

  formHoverContact = $ "#form-contacts"
  formHoverContact.submit (e) ->
    e.preventDefault()
    $.post(
      formHoverContact.attr('action')
      formHoverContact.serialize()
      (resp) ->
        if resp.type is 'success'
          formHoverContact.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            1500
          )
        else
          for error in resp.errors
            $(".form-hover-add-contact-#{error}").addClass 'error'
      'json'
    )

  formHoverContact.on 'focus', '.error', ->
    $(@).removeClass 'error'


  formSignHeader = $ "#form-inspection-header"
  formSignHeader.submit (e) ->
    e.preventDefault()
    styleSelected = $('#form-inspection-header .styledSelect')
    $('#direction-form-name').val styleSelected.text()
    $.post(
      formSignHeader.attr('action')
      formSignHeader.serialize()
      (resp) ->
        if resp.type is 'success'
          formSignHeader.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            console.log("/#{getHiddenLang}/thanks")
            1500
          )
        else
          for error in resp.errors
            $(".form-inspection-header-#{error}").addClass 'error'
      'json'
    )


  formSignHeader.on 'focus', '.error', ->
    $(@).removeClass 'error'

  formComplexDiscount = $ "#form-hover-add"
  formComplexDiscount.submit (e) ->
    e.preventDefault()
    $.post(
      formComplexDiscount.attr('action')
      formComplexDiscount.serialize()
      (resp) ->
        if resp.type is 'success'
          formComplexDiscount.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            1500
          )
        else
          for error in resp.errors
            $(".form-complex-discount-#{error}").addClass 'error'
      'json'
    )

  formComplexDiscount.on 'focus', '.error', ->
    $(@).removeClass 'error'


  formSignDirection = $ "#form-hover-add-diagnostic"
  formSignDirection.submit (e) ->
    e.preventDefault()
    $.post(
      formSignDirection.attr('action')
      formSignDirection.serialize()
      (resp) ->
        if resp.type is 'success'
          formSignDirection.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            1500
          )
        else
          for error in resp.errors
            $(".form-sign-direction-#{error}").addClass 'error'
      'json'
    )

  formSignDirection.on 'focus', '.error', ->
    $(@).removeClass 'error'

  formSignDirectionSympt = $ "#form-hover-add-symptoms"
  formSignDirectionSympt.submit (e) ->
    e.preventDefault()
    $.post(
      formSignDirectionSympt.attr('action')
      formSignDirectionSympt.serialize()
      (resp) ->
        if resp.type is 'success'
          formSignDirectionSympt.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            1500
          )
        else
          for error in resp.errors
            $(".form-sign-direction-#{error}").addClass 'error'
      'json'
    )

  formSignDirectionSympt.on 'focus', '.error', ->
    $(@).removeClass 'error'


  formSignDirectionDoctor = $ "#form-hover-add-doctor"
  formSignDirectionDoctor.submit (e) ->
    e.preventDefault()
    $.post(
      formSignDirectionDoctor.attr('action')
      formSignDirectionDoctor.serialize()
      (resp) ->
        if resp.type is 'success'
          formSignDirectionDoctor.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            1500
          )
        else
          for error in resp.errors
            $(".form-sign-direction-#{error}").addClass 'error'
      'json'
    )

  formSignDirectionDoctor.on 'focus', '.error', ->
    $(@).removeClass 'error'


  formDoctorAnonim = $ "#form-hover-add-question"
  formDoctorAnonim.submit (e) ->
    e.preventDefault()
    $.post(
      formDoctorAnonim.attr('action')
      formDoctorAnonim.serialize()
      (resp) ->
        if resp.type is 'success'
          formDoctorAnonim.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            1500
          )
        else
          for error in resp.errors
            $(".form-hover-question-dir-#{error}").addClass 'error'
      'json'
    )

  formDoctorAnonim.on 'focus', '.error', ->
    $(@).removeClass 'error'


  formSpecialOffer = $ "#form-discount-add-doctor"
  formSpecialOffer.submit (e) ->
    offerNameInput = $("#slick-special-wrapper .slick-active .special-content-get-discount").find(".getDiscountVal")
    offerInput = $(".form-hover-offer-val")
    offerInput.val offerNameInput.val()
    e.preventDefault()
    $.post(
      formSpecialOffer.attr('action')
      formSpecialOffer.serialize()
      (resp) ->
        if resp.type is 'success'
          formSpecialOffer.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            1500
          )
        else
          for error in resp.errors
            $(".form-direction-discount-offer-#{error}").addClass 'error'
      'json'
    )

  formSpecialOffer.on 'focus', '.error', ->
    $(@).removeClass 'error'

  formStaticQuestion = $ "#form-static-add-question"
  formStaticQuestion.submit (e) ->
    e.preventDefault()
    $.post(
      formStaticQuestion.attr('action')
      formStaticQuestion.serialize()
      (resp) ->
        if resp.type is 'success'
          formStaticQuestion.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            1500
          )
        else
          for error in resp.errors
            $(".form-hover-question-dir-#{error}").addClass 'error'
      'json'
    )

  formStaticQuestion.on 'focus', '.error', ->
    $(@).removeClass 'error'


  formStaticCall = $ "#form-call-static"
  formStaticCall.submit (e) ->
    e.preventDefault()
    $.post(
      formStaticCall.attr('action')
      formStaticCall.serialize()
      (resp) ->
        if resp.type is 'success'
          formStaticCall.get(0).reset()
          setTimeout(
            -> window.location.href = "/#{getHiddenLang}/thanks"
            1500
          )
        else
          for error in resp.errors
            $(".form-hover-add-contact-#{error}").addClass 'error'
      'json'
    )

  formStaticCall.on 'focus', '.error', ->
    $(@).removeClass 'error'

  $(".form-inspection-doctor").find(".styledSelect").click (e) ->
    e.stopPropagation()
    $(".form-inspection-doctor").removeClass 'error'


  $(".mask-phone-input").mask("+38(999) 999-99-99")
