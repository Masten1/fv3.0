jQuery ($) ->
  $("#excelUploader").change ->
    data = new FormData
    data.append $(@).attr('name'), @files[0]
    data.append 'directionId', $("#directionId").val()

    $.ajax
      url: '/backend/parser/process'
      type: 'POST'
      data: data
      cache: false
      processData: false
      contentType: false
      context: @
      dataType: 'json'
      success: (data) ->
        $("#parse-result").html data.map (item) ->
          $("<tr></tr>").append [
            $("<td></td>").text item.direction
            $("<td></td>").text item.name
            $("<td></td>").text item.price
            $("<td></td>").text item.status
          ]
