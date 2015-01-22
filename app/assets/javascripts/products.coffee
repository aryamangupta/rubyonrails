# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

number = 1

$ ->
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

$ ->
  setUpPictures("product_pictures_image","upload","upload")
  setUpPictures("product_pictures_image1","upload1","upload1")
  setUpPictures("product_pictures_image2","upload2","upload2")
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
      imageAspectRatio = imageObj.width / imageObj.height;
      canvasAspectRatio = 200 / 200;

      if imageAspectRatio < canvasAspectRatio
      	renderableHeight = 200;
      	renderableWidth = imageObj.width * (renderableHeight / imageObj.height);
      	xStart = (200 - renderableWidth) / 2;
      	yStart = 0;
      else if imageAspectRatio > canvasAspectRatio
        renderableWidth = 200;
        renderableHeight = imageObj.height * (renderableWidth / imageObj.width);
        xStart = 0;
        yStart = (200 - renderableHeight) / 2;
      else
        renderableHeight = 200;
        renderableWidth = 200;
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