require 'rails/generators/active_record/migration'

class SeoFuelGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  extend ActiveRecord::Generators::Migration

  desc "Put the JavaScript and migration in place"
  source_root File.join(File.dirname(__FILE__), "templates")
  
  def install
    copy_javascript if needs_js_copied?
    copy_options_file
    copy_language_file
    # route("resources :seo_tags")
    # migration_template "migration.rb", "db/migrate/create_seo_fuel.rb"
  end

  private


  def template(from, to)
    erb = File.read(File.expand_path("../../../config/templates/#{from}", __FILE__))
    yml = ERB.new(erb).result(binding)
    File.open(to, 'w') {|f| f.write(yml) }
    puts "created option file: config/seo_fuel_settigns.yml"
  end
  
  def gsub_file(relative_destination, regexp, *args, &block)
    path = destination_path(relative_destination)
    content = File.read(path).gsub(regexp, *args, &block)
    File.open(path, 'wb') { |file| file.write(content) }
  end

  def copy_options_file
    template "seo_fuel_settings.yml.erb", config_destination
    # copy_file File.join(config_path, 'seo_fuel_settings.yml'), config_destination
  end
  
  def copy_language_file
    copy_file File.join(locales_path, 'en.seo_fuel.yml'), language_file_destination
  end

  def copy_javascript
    copy_file File.join(javascript_path, 'seo_fuel.js'), js_destination
  end

  def config_path
    File.join(%w(.. .. .. config))
  end
  
  def locales_path
    File.join(%w(.. .. .. config locales))
  end

  def javascripts_path
    File.join(%w(.. .. .. vendor assets javascripts))
  end

  def needs_js_copied?
    ::Rails.version < '3.1' || !::Rails.application.config.assets.enabled
  end

  def js_destination
    'public/javascripts/seo_fuel.js'
  end

  def config_destination
    'config/seo_fuel_settings.yml'
  end

  def language_file_destination
    'config/locales/en.seo_fuel.yml'
  end

end
