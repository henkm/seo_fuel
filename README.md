# SEO Fuel

## Installation

Add this line to your application's Gemfile:

    gem 'seo_fuel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install seo_fuel

## Usage
After installation, run these commands:

    $ rails generate seo_fuel
    $ bundle exec rake db:migrate

this will generate a database migration to add a SeoTag table, it will also update your routes and add the .yml file for configuration.

Add these lines to your assets manifest files

    # in appcliation.css
    *= require seo_fuel
  
    # in appcliation.js
    //= require seo_fuel
    
### Implementation in views
Replace the title, description and keywords tags for these methods:
    <!-- application.html.erb -->
    <%= show_title %>
    <%= show_description %>
    <%= show_keywords %>
    
Display the edit button and the form on every page, by including these commands on the bottom of your application.html.erb (just above the closing body tag)
    <!-- application.html.erb -->
    <%= edit_seo_button %>
    <%= edit_seo_dialog %>
    

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
