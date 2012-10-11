require 'action_controller'
require 'action_view'

module SeoFuel
  
  module Rails
    class Engine < ::Rails::Engine
    end
  end

  
end

require 'seo_fuel/version'
require 'seo_fuel/view_helper'
require 'seo_fuel/controller_helper'

ActionView::Base.send :include, SeoFuel::ViewHelper
ActionController::Base.send :include, SeoFuel::ControllerHelper