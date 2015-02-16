# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
textfieldnumber=1;
choicefieldnumber=1;
dropdownfieldnumber=1;

addtextclick = () ->
  $("#addtextField").click ->
    formgroup = document.createElement("div")
    formgroup.className="form-group"
    row = document.createElement("div")
    row.className="row"
    col = document.createElement("div")
    col.className="col-sm-6"
    formgroup.appendChild(row)
    row.appendChild(col)
    $('<input>').attr({
      type: 'text',
      class: 'form-control'
      name: 'textfieldname'+textfieldnumber,
      id: 'textfieldname'+textfieldnumber,
      placeholder: 'Field Name'
    }).appendTo(col)
    $('<input>').attr({
      type: 'checkbox',
      name: 'textfieldnameoptional'+textfieldnumber,
      id: 'textfieldnameoptional'+textfieldnumber,
    }).appendTo(col)
    datespan = document.createElement('span')
    datespan.innerHTML = "optional";
    col.appendChild(datespan)
    moredetails = document.getElementById("fieldstext")
    moredetails.appendChild(formgroup)
    $('#addtextfieldno').val(textfieldnumber+"");
    textfieldnumber=textfieldnumber + 1
    true
  true

addchoiceclick = () ->
  $("#addChoiceField").click ->
    formgroup = document.createElement("div")
    formgroup.className="form-group"
    row = document.createElement("div")
    row.className="row"
    col = document.createElement("div")
    col.className="col-sm-6"
    formgroup.appendChild(row)
    row.appendChild(col)
    $('<input>').attr({
      type: 'text',
      class: 'form-control'
      name: 'choicefieldname'+choicefieldnumber,
      id: 'choicefieldname'+choicefieldnumber,
      placeholder: 'Choice Name'
    }).appendTo(col)
    $('<input>').attr({
      type: 'text',
      class: 'form-control'
      name: 'choicefieldnameop'+choicefieldnumber,
      id: 'choicefieldnameop'+choicefieldnumber,
      style: 'margin-top:10px',
      placeholder: 'Choices separated by semicolon'
    }).appendTo(col)
    $('<input>').attr({
      type: 'checkbox',
      name: 'choicefieldnameoptional'+choicefieldnumber,
      id: 'choicefieldnameoptional'+choicefieldnumber,
    }).appendTo(col)
    datespan = document.createElement('span')
    datespan.innerHTML = "optional";
    col.appendChild(datespan)
    moredetails = document.getElementById("fieldsChoice")
    moredetails.appendChild(formgroup)
    $('#addchoicefieldno').val(choicefieldnumber+"");
    choicefieldnumber=choicefieldnumber + 1
    true
  true

adddropclick = () ->
  $("#addDropField").click ->
    formgroup = document.createElement("div")
    formgroup.className="form-group"
    row = document.createElement("div")
    row.className="row"
    col = document.createElement("div")
    col.className="col-sm-6"
    formgroup.appendChild(row)
    row.appendChild(col)
    $('<input>').attr({
      type: 'text',
      class: 'form-control'
      name: 'dropfieldname'+dropdownfieldnumber,
      id: 'dropfieldname'+dropdownfieldnumber,
      placeholder: 'Drop Down Name'
    }).appendTo(col)
    $('<input>').attr({
      type: 'text',
      class: 'form-control'
      name: 'dropfieldnameop'+dropdownfieldnumber,
      id: 'dropfieldnameop'+dropdownfieldnumber,
      style: 'margin-top:10px',
      placeholder: 'Drop down Choices separated by semicolon'
    }).appendTo(col)
    $('<input>').attr({
      type: 'checkbox',
      name: 'dropfieldnameoptional'+dropdownfieldnumber,
      id: 'dropfieldnameoptional'+dropdownfieldnumber,
    }).appendTo(col)
    datespan = document.createElement('span')
    datespan.innerHTML = "optional";
    col.appendChild(datespan)
    moredetails = document.getElementById("fieldsDropDown")
    moredetails.appendChild(formgroup)
    $('#adddropdownfieldno').val(dropdownfieldnumber+"");
    dropdownfieldnumber=dropdownfieldnumber + 1
    true
  true

$(document).ready(addtextclick);
$(document).on('page:load', addtextclick);

$(document).ready(addchoiceclick);
$(document).on('page:load', addchoiceclick);

$(document).ready(adddropclick);
$(document).on('page:load', adddropclick);