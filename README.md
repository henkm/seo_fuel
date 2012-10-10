# SEO Fuel: easily gas up search engines
SEO Fuel is a super easy way to manage SEO tags in your Rails App. It doesn't require any adjustments to existing models or controllers. 

SEO Fuel works by adding a form with SEO settings (title, description, etc.) to every single page of your app. This form is hidden, but pops up when you hit the button. The SEO settings aren't linked to a page by foreign keys, but rather by path ('/articles/1-article-title')

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

    <%= show_title %>
    <%= show_description %>
    <%= show_keywords %>
    
Display the edit button and the form on every page, by including these commands on the bottom of your application.html.erb (just above the closing body tag)

    <%= edit_seo_button %>
    <%= edit_seo_dialog %>
    

## TODO
This gem is in early development, there are still some things to do:
- add system for default values (<% default_title(@article.title) %> for example)
- add options for open_graph
- add documentation
- include testing


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
