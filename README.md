# SEO Fuel: easily gas up search engines

_This gem is still in early development. Described features work, but some features are still lacking. I'll be updating the documentation as I go along. Feel free to fork this project and improve on it._

SEO Fuel is a super easy way to manage SEO tags in your Rails app. It doesn't require any adjustments to existing models or controllers. 

![Edit SEO right in your browser](http://server6.dagjeweg.nl/bestanden/seo_fuel_example.png "Example Usage")

## Philosophy
Where to put SEO? The main idea behind this gem is that end users often want to be able to fine tune SEO settings right in the browser, without going to some sort of backend or options file.

SEO Fuel works by adding a form with SEO settings (title, description, etc.) to every single page of your app. This form is hidden, but pops up when you hit the button. The SEO settings are stored in their own table and aren't linked to a page by complicated foreign keys, but rather by path ('/articles/1-article-title').

SEO Fuel makes it realy easy to have total control of the meta tags, while still keeping it just as easy to set great default SEO values.

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

    <%= edit_seo_dialog %>
    
or, if you wish to only let signed in users be able to see the form (using devse in this example):

    <%= edit_seo_dialog if admin_signed_in? %>
    
### Setting default values
By default, all titles are blank. If a title is blank, the one specified in `seo_fuel_settings.yml` should be used (NOT YET IMPLEMENTED). Per template, you can specify a default value by adding a line of code to your view template. This value takes precedence over the default title.
The 'in browser' added SEO settings take precedence over all default values. 

    <% default_title("Site Name | #{@article.title}") %>


### I18n
This gem is fully I18n adjustable. Just edit the locale file, placed in the locales directory of your Rails app.

## TODO
This gem is in early development, there are still some things to do:
- add authentication layer
- add options for open_graph
- add documentation
- include testing


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
