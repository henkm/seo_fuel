module SeoFuel
  # Contains methods to use in views and helpers.
  
  module ViewHelper
    
    # used in version < 0.0.4
    def edit_seo_button(text=I18n.t('seo.button_text'), klass="")
      link_to text, "#", class: "seo_fuel #{klass}", id: "edit_seo_btn"
    end
    
    # set your default title in any view template, by 
    # simply calling `default_title(your_title_here)`
    # this title takes precedence over the default title set
    # in your config file, but not over the one set 'in browser'
    def default_title(title)
      @default_title = title.force_encoding('utf-8')
    end
    
    # determines wich title to show
    def title_to_show
      if current_page && current_page.title.present?
        current_page.title
      elsif @default_title.present?
        @default_title
      else
        ""
      end
    end
    
    # render the dialog box and edit button by calling
    # `edit_seo_dialog` in the templates that should have this
    # form. Usually this should be on every page, so this helper
    # methods is mostly used on the bottom of the application.html,
    # just above the closing `<body>` tag.
    def edit_seo_dialog
      render :partial => "seo_tags/seo_options"
    end
    
    # returns the current SeoTag object
    # this instance contains all the SEO options
    def current_page
      SeoTag.find_by_path(request.path)
    end
    
    # renders the `title_to_show` inside a `<title>` tag.
    def show_title
      render :partial => "seo_tags/title"
    end

    # renders the description inside a `<meta>` tag.
    def show_description
      render :partial => "seo_tags/description"
    end

    # renders the keywords inside a `<meta>` tag.
    def show_keywords
      render :partial => "seo_tags/keywords"
    end
    
  end
end