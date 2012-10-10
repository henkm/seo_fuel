module SeoFuel
  # Contains methods to use in views and helpers.
  #
  
  module ViewHelper
    
    def edit_seo_button(text=I18n.t('seo.button_text'), klass="")
      link_to text, "#", class: "seo_fuel #{klass}", id: "edit_seo_btn"
    end
    
    def edit_seo_dialog
      render :partial => "seo_tags/seo_options"
    end
    
    def current_page
      SeoTag.find_by_path(request.path)
    end
    
    def show_title
      render :partial => "seo_tags/title"
    end

    def show_description
      render :partial => "seo_tags/description"
    end

    def show_keywords
      render :partial => "seo_tags/keywords"
    end
    
  end
end