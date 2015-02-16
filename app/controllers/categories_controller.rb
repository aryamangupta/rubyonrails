class CategoriesController < ApplicationController
  include Redis::Objects
  respond_to :json, only: [:subcategories,:subsubcategories,:formvalues]

  def index
  end

  def new
  end

  def show
  
  end

  def subcategories
    category_name = params[:category_name]

    subcategory = Category.where(category: category_name.titleize).uniq.pluck(:subcategory)
    respond_with subcategory.to_json
  end

  def subsubcategories
    subcategory_name = params[:subcategory_name]
    category_name = params[:category_name]

    subsubcategory = Category.where(category: category_name.titleize,subcategory: subcategory_name.titleize).pluck(:subsubcategory)
    respond_with subsubcategory.to_json
  end

  def formvalues
    subsubcategory_name = params[:subsubcategory_name]
    subcategory_name = params[:subcategory_name]
    category_name = params[:category_name]

    category = Category.where(category: category_name.titleize,subcategory: subcategory_name.titleize,subsubcategory: subsubcategory_name)
    cat = category[0]
    

    json_response = Hash.new

    json_response["text_fields"]= Array.new

    i = 0

    cat.text_fields.each do |textfield|
      option = textfield.split(":")
      json_response["text_fields"][i]=Array.new
      json_response["text_fields"][i][0] = option.first
      json_response["text_fields"][i][1] = option.last
      i = i+1      
    end

    json_response["drop_fields"]= Array.new
    i=0
    cat.dropdown_fields.each do |dropdown|
      option = dropdown.split(":")
      json_response["drop_fields"][i] = Array.new
      json_response["drop_fields"][i][0]=option[0]
      json_response["drop_fields"][i][1]=option[1]
      json_response["drop_fields"][i][2]=option[2].split(";")
      i=i+1
    end

    json_response["choice_fields"]= Array.new
    i=0
    cat.checkbox_fields.each do |checkbox|
      option = checkbox.split(":")
      json_response["choice_fields"][i] = Array.new
      json_response["choice_fields"][i][0] = option[0]
      json_response["choice_fields"][i][1] = option[1]
      json_response["choice_fields"][i][2] = option[2].split(";")
      i=i+1
    end      
    
    respond_with json_response.to_json
  end

  def create
    @category = Category.new(
      :category => params[:category][:Category],
      :subcategory => params[:category][:SubCategory],
      :subsubcategory => params[:category][:Clasification])

    @category.save

    i = 1
    num = params[:addtextfieldno].to_i


    while i <= num  do
      tempname = params["textfieldname"+i.to_s]

      if(tempname!=nil)
        optional = params["textfieldnameoptional"+i.to_s]
        text_temp = tempname;
        if(optional != nil)
          text_tem=text_temp + ":true"
        else
          text_tem=text_temp + ":false"
        end
        @category.text_fields << text_tem
      end
      i = i + 1
    end

    i = 1
    num = params[:addchoicefieldno].to_i


    while i <= num  do
      tempname = params["choicefieldname"+i.to_s]

      if(tempname!=nil)
        tempoptions= params["choicefieldnameop"+i.to_s].split(';')
        choice_tem = tempname
        optional = params["choicefieldnameoptional"+i.to_s]
        if(optional != nil)
          choice_tem = choice_tem + ":true"
        else
          choice_tem = choice_tem + ":false"
        end
        choice_tem=choice_tem + ":"
        tempoptions.each do |tempoption|
          choice_tem=choice_tem + tempoption + ";"
        end
        @category.checkbox_fields << choice_tem
      end
      i = i + 1
    end

    i = 1
    num = params[:adddropdownfieldno].to_i


    while i <= num  do
      tempname = params["dropfieldname"+i.to_s]

      if(tempname!=nil)
        tempoptions= params["dropfieldnameop"+i.to_s].split(';')
        drop_tem = tempname
        optional = params["dropfieldnameoptional"+i.to_s]
        if(optional != nil)
          drop_tem=drop_tem + ":true"
        else
          drop_tem=drop_tem + ":false"
        end
        drop_tem=drop_tem + ":"
        tempoptions.each do |tempoption|
          drop_tem=drop_tem + tempoption + ";"
        end
        @category.dropdown_fields << drop_tem
      end
      i = i + 1
    end

    redirect_to @category
  end
end
