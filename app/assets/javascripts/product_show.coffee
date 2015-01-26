# Product javascript for show product

$ ->
  $("#product").click ->
    $("#product").addClass("active")
    $("#company").removeClass("active")
    $("#descriptionContent").show(300);
    $("#descriptionCompanyProfile").hide(300)
    return true

$ ->
  $("#company").click ->
    $("#product").removeClass("active")
    $("#company").addClass("active")
    $("#descriptionContent").hide(300)
    $("#descriptionCompanyProfile").show(300)
    return true