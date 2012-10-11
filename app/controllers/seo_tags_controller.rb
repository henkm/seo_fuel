class SeoTagsController < ApplicationController

  # POST
  # creates the seo tags for given path (params[:seo_tag][:path])
  def create
    @tag = SeoTag.find_or_create_by_path(params[:seo_tag][:path])
    @tag.update_attributes(params[:seo_tag])
    respond_to do |format|
      format.js
      format.html {redirect_to params[:path]}
    end
  end
  
  # PUT
  # updates the seo tags for given path (params[:seo_tag][:path])
  def update
    @tag = SeoTag.find_or_create_by_path(params[:seo_tag][:path])
    @tag.update_attributes(params[:seo_tag])
    respond_to do |format|
      format.js
      format.html {redirect_to params[:path]}
    end
  end
    
end