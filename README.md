# SEO Fuel: easily gas up search engines

SEO Fuel is a super easy way to manage SEO tags in your Rails app. It doesn't require any adjustments to existing models or controllers. 

## Philosophy
Where to put SEO? The main idea behind this gem is that end users often want to be able to fine tune SEO settings right in the browser, without going to some sort of backend or options file.

SEO Fuel works by adding a form with SEO settings (title, description, etc.) to every single page of your app. This form is hidden, but pops up when you hit the button. The SEO settings are stored in their own table and aren't linked to a page by complicated foreign keys, but rather - be default - by path ('/articles/123').

SEO Fuel makes it realy easy to have total control of the meta tags, while still keeping it just as easy to set great default SEO values.

## Installation

Add this line to your application's Gemfile:

    gem 'seo_fuel', git: "https://github.com/henkm/seo_fuel.git"

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
Replace the title, description and keywords tags for this method:

    <%= show_meta_tags %>
    
Display the edit button and the form on every page, by including these commands on the bottom of your application.html.erb (just above the closing body tag)

    <%= edit_seo_dialog %>
    
### Setting default values
By default, all meta tags are blank. If a tag is blank, the one specified in `seo_fuel_settings.yml` will be used. Per template, you can specify a default value by adding a few lines of code to your view template. These values take precedence over the default values.
The 'in browser' added SEO settings take precedence over all default values. 

    <% default_title("Site Name | #{@article.title}") %>
    <% default_description(@article.summary) %>
    <% default_keywords(@article.categories.map(&:name).join(',')) %>

By default, the unique key for each set of SEO-settings is the path of the current page (`request.path`). If you want, you can manually set the unique key for a page, by defining it with a helper method in your view template:

    <% seo_identifier("home_page") %>

### I18n
This gem is fully I18n adjustable. Just edit the locale file, placed in the locales directory of your Rails app.


## Authentication
Not all users are allowed to edit SEO settings, obviously. To only let specific users see the SEO form, you can simply use your own restrictions when rendering the form. If only admin users are supposed to see the form (when using Devise), use this:

    <%= edit_seo_dialog if admin_signed_in? %>
    
Authentication for the Controller layer is added through the key in a hidden field in the form. This random key is set in the `seo_fuel_settings.yml` configuration file. Only when this key matches, the record will be saved. If this form is only visible for signed in admins, they are the only ones that can submit POST requests with the proper key.

## TODO
This gem is in early development, there are still some things to do:
- add options for open_graph
- include testing


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
