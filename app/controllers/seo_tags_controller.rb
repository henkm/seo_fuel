class SeoTagsController < ApplicationController

  def create
    @tag = SeoTag.find_or_create_by_path(params[:path])
    @tag.update_attributes(params[:seo_tag])
    respond_to do |format|
      format.js
      format.html {redirect_to params[:path]}
    end
  end
  
  def update
    @tag = SeoTag.find_by_path(params[:path])
    @tag.update_attributes(params[:seo_tag])
    respond_to do |format|
      format.js
      format.html {redirect_to params[:path]}
    end
  end
  
end