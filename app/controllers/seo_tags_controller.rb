class SeoTagsController < ApplicationController

  # POST
  # creates the seo tags for given path (params[:seo_tag][:path])
  def create
    if params[:key] && params[:key] == authentication_key
      @tag = SeoTag.find_or_create_by(path: seo_tag_params[:path])
      @tag.update_attributes(seo_tag_params)
      respond_to do |format|
        format.js
        format.html {redirect_to params[:path]}
      end
    end
  end
  
  # PUT
  # updates the seo tags for given path (params[:seo_tag][:path])
  def update
    if params[:key] && params[:key] == authentication_key
      @tag = SeoTag.find_or_create_by(path: seo_tag_params[:path])
      @tag.update_attributes(seo_tag_params)
      respond_to do |format|
        format.js
        format.html {redirect_to params[:path]}
      end
    end
  end
  
private

  def seo_tag_params
    params.require(:seo_tag).permit(:title, :description, :keywords, :canonical, :open_graph,
     :path, :use_project_title, :canonical, :nofollow, :noindex)
  end

  # Reads the authentication key from the seo_fuel_settings.yml file
  def authentication_key
    YAML::load(File.open("config/seo_fuel_settings.yml"))['SEO_FUEL_SETTINGS']['key']
  end
    
end