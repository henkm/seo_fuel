module SeoFuel
  # Contains methods to use in controllers.

  module ControllerHelper
    extend ActiveSupport::Concern

    included do
      helper_method :testing
    end
  
    def testing
      logger.info "TESTING: OK"
      raise "ERROR!!!!!!!!!!!!!"
    end
    
  end
end