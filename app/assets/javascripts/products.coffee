# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

number = 1

addclick = () ->
  $('#addField').click ->
    formgroup = document.createElement("div")
    formgroup.className="form-group"
    row = document.createElement("div")
    row.className="row"
    col = document.createElement("div")
    col.className="col-sm-6"
    col2 = document.createElement("div")
    col2.className="col-sm-6"
    formgroup.appendChild(row)
    row.appendChild(col)
    row.appendChild(col2)

    $('<input>').attr({
      type: 'text',
      class: 'form-control'
      name: 'Fieldname'+number,
      id: 'Fieldname'+number,
      placeholder: 'Field Name'
    }).appendTo(col)

    $('<input>').attr({
      type: 'text',
      class: 'form-control'
      name: 'Fieldcontent'+number,
      id: 'Fieldcontent'+number,
      placeholder: 'Field Content'
    }).appendTo(col2)

    moredetails = document.getElementById("fields")
    moredetails.appendChild(formgroup)

    $('#moredetailsno').val(number+"");
    number=number + 1

    true
  true

ready = () ->
  fileDiv = document.getElementById("upload");
  if(fileDiv == null)
  else
    setUpPictures("product_pictures_image","upload","upload")
    setUpPictures("product_pictures_image1","upload1","upload1")
    setUpPictures("product_pictures_image2","upload2","upload2")
  true
setUpPictures=(fileinputname,fileDivname,thumbname) ->
  fileDiv = document.getElementById(fileDivname);
  fileInput = document.getElementById(fileinputname);
  fileInput.addEventListener("change",(e)->
    files = this.files
    showThumbnail(files)
  ,false)

  fileDiv.addEventListener("click",(e)->
    $(fileInput).show().focus().click().hide();
    e.preventDefault();
  ,false)

  fileDiv.addEventListener("dragenter",(e)->
    e.stopPropagation();
    e.preventDefault();
  ,false);

  fileDiv.addEventListener("dragover",(e)->
    e.stopPropagation();
    e.preventDefault();
  ,false);

  fileDiv.addEventListener("drop",(e)->
    e.stopPropagation();
    e.preventDefault();

    dt = e.dataTransfer;
    files = dt.files;

    showThumbnail(files)
  ,false);

  showThumbnail=(files)->
  	for file in files
      imageType = /image.*/
      if(!file.type.match(imageType))
        continue
    image = document.createElement("img");
    thumbnail = document.getElementById(thumbname);
    thumbnail.removeChild(thumbnail.firstChild);
    $('#'+fileDivname).empty();
    image.file = file;
    

    reader = new FileReader()
    reader.onload = (e)->
        image.src = e.target.result;
        true
    ret = reader.readAsDataURL(file);
    canvas = document.createElement("canvas");
    ctx = canvas.getContext("2d");
    
    fitImageOn = (canvas,imageObj)->
      imgsize=200
      imageAspectRatio = imageObj.width / imageObj.height;
      canvasAspectRatio = imgsize / imgsize;

      if imageAspectRatio < canvasAspectRatio
      	renderableHeight = imgsize;
      	renderableWidth = imageObj.width * (renderableHeight / imageObj.height);
      	xStart = (imgsize - renderableWidth) / 2;
      	yStart = 0;
      else if imageAspectRatio > canvasAspectRatio
        renderableWidth = imgsize;
        renderableHeight = imageObj.height * (renderableWidth / imageObj.width);
        xStart = 0;
        yStart = (imgsize - renderableHeight) / 2;
      else
        renderableHeight = imgsize;
        renderableWidth = imgsize;
        xStart = 0;
        yStart = 0;

      ctx.drawImage(imageObj, xStart, yStart, renderableWidth, renderableHeight);
      image.width=renderableWidth;
      image.height=renderableHeight;
      $('#'+fileDivname).css('background-color','#fff');
      thumbnail.appendChild(image)


    image.onload = ()->
      fitImageOn(canvas, image)
      true
    true
  true

currentCategory = null
currentSubCategory = null
currentSubSubCategory = null

catclick = () ->
  $('.category_option').click ->
    cat=this.innerText.toLowerCase();
    catTitle = this.innerText
    catDiv = this
    
    if(currentCategory!=null)
      currentCategory.className = ''
      currentCategory.className = 'category_option'
    currentCategory = catDiv
    catDiv.className += ' active'
    $('#category').val(catTitle)
    $('#subcatLoading').show()
    div = document.getElementById('subcategorybox')
    div.innerHTML =''
    divSubCat = document.getElementById('subsubcategorybox')
    divSubCat.innerHTML =''
    $('#btnProductBasic').prop('disabled',true)

    $.ajax '/categories/'+cat+'/subcategories',
      type: 'GET'
      dataType: 'json'
      contentType: 'application/json'
      data: {}
      error: (jqXHR, textStatus, errorThrown) ->
        $('#subcatLoading').hide()
        alert 'Please check network Connection'
      success: (data, textStatus, jqXHR) ->
        for i in data
          li = document.createElement('li')
          li.innerHTML = i
          li.className='subcategory_option'
          div.appendChild(li)
        $('#subcatLoading').hide()
        subcatclick()
    true
  true

subcatclick = () ->
  $('.subcategory_option').click ->
    subcat=this.innerText;
    subcatTitle = this.innerText
    subcatDiv = this
    cat=$('#category').val()
    $('#subsubcatLoading').show()

    if(currentSubCategory!=null)
      currentSubCategory.className = ''
      currentSubCategory.className = 'subcategory_option'
    currentSubCategory = subcatDiv

    subcatDiv.className += ' active'
    $('#subcategory').val(subcatTitle)
    div = document.getElementById('subsubcategorybox')
    divSubCat = document.getElementById('subsubcategorybox')
    divSubCat.innerHTML =''
    $('#btnProductBasic').prop('disabled',true)
    $.ajax '/categories/'+cat+'/'+subcat+'/subsubcategories',
      type: 'GET'
      dataType: 'json'
      contentType: 'application/json'
      data: {}
      error: (jqXHR, textStatus, errorThrown) ->
        $('#subsubcatLoading').hide()
        alert 'Please check network Connection'
      success: (data, textStatus, jqXHR) ->
        
        for i in data
          li = document.createElement('li')
          li.innerHTML = i
          li.className='subsubcategory_option'
          div.appendChild(li)
        $('#subsubcatLoading').hide()
        subsubcatclick()
        true
    true
  true


subsubcatclick = () ->
  $('.subsubcategory_option').click ->
    

    if(currentSubSubCategory!=null)
      currentSubSubCategory.className = ''
      currentSubSubCategory.className = 'subcategory_option'
    
    currentSubSubCategory = this

    this.className += ' active'
    $('#subsubcategory').val(this.innerText)
    $('#btnProductBasic').prop('disabled',false)
    true
  true


btnProductBasic = () ->
  $('#btnProductBasic').click ->
    $('#categorySection').hide(200)
    $('#productBasicSection').show(200)
    
    cat=$('#category').val()
    subcat=$('#subcategory').val()
    subsubcat=$('#subsubcategory').val()
    $.ajax '/categories/'+cat+'/'+subcat+'/'+subsubcat+'/formvalues',
      type: 'GET'
      dataType: 'json'
      contentType: 'application/json'
      data: {}
      error: (jqXHR, textStatus, errorThrown) ->
        alert 'Please check network Connection'
      success: (data, textStatus, jqXHR) ->
        text_fields= data['text_fields']
        checkbox_fields = data['choice_fields']
        dropdown_fields = data['drop_fields']
        specdiv = document.getElementById("productSpecFields")
        for i in text_fields
          formgroup = document.createElement("div")
          formgroup.className="form-group"
          specdiv.appendChild(formgroup)
          $('<input>').attr({
          type: 'text',
          class: 'form-control'
          name: 'textspec['+i[0]+']',
          id: 'textspec_'+i[0],
          placeholder: i[0]
          }).appendTo(formgroup)
        
        for i in checkbox_fields
          outerDiv = document.createElement("div")
          outerDiv.className='marginBottom'
          label=document.createElement("div")
          label.className='checkboxmargin'
          label.innerHTML=('<strong>'+i[0]+':'+'</strong>')
          $('<input>').attr({
            type: 'hidden',
            name: 'checkboxspec_name['+i[0]+']',
            id: 'checkboxspec_name_'+i[0]
            value: i[0]
          }).appendTo(outerDiv)
          outerDiv.appendChild(label)
          for j in i[2]
            label= document.createElement("label")
            label.className = 'checkbox-inline'
            description = document.createTextNode(j)
            checkbox = document.createElement("input")

            checkbox.type = "checkbox"
            checkbox.name = i[0]+'['+j+']'     
            checkbox.value = j

            label.appendChild(checkbox); 
            label.appendChild(description)
            outerDiv.appendChild(label)
          specdiv.appendChild(outerDiv)
        for i in dropdown_fields
          gradeSelect=document.createElement('Select');
          gradeSelect.id='dropdownspec_'+i[0];
          gradeSelect.name='dropdownspec['+i[0]+']';
          gradeSelect.className='form-control'
          formgroup = document.createElement("div")
          formgroup.className='form-group'
          specdiv.appendChild(formgroup)
          for j in i[2]
            opt=document.createElement('option');
            opt.value=j;
            opt.textContent=j;

            gradeSelect.appendChild(opt);

          formgroup.appendChild(gradeSelect)
        true
    true
  true

btnProductSpec = () ->
  $('#btnProductSpec').click ->
    $('#productBasicSection').hide(200)
    $('#productSpecSection').show(200)
    true
  true

btnLogistics = () ->
  $('#btnLogistics').click ->
    $('#productSpecSection').hide(200)
    $('#logisticsSection').show(200)
    true
  true

btnDetailed = () ->
  $('#btnDetailedDesc').click ->
    $('#logisticsSection').hide(200)
    $('#detailedDescriptionSection').show(200)
    true
  true


$(document).ready(ready);
$(document).on('page:load', ready);
$(document).ready(addclick);
$(document).on('page:load', addclick);
$(document).ready(catclick);
$(document).on('page:load', catclick);
$(document).ready(btnProductBasic);
$(document).on('page:load', btnProductBasic);
$(document).ready(btnProductSpec);
$(document).on('page:load', btnProductSpec);
$(document).ready(btnLogistics);
$(document).on('page:load', btnLogistics);
$(document).ready(btnDetailed);
$(document).on('page:load', btnDetailed);
