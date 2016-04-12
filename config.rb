require 'middleman-deploy'

set :css_dir,           'stylesheets'
set :js_dir,            'javascripts'
set :images_dir,        'images'
set :markdown_engine,   :redcarpet

ignore "bower_components/*"
ignore "javascripts/app.js"
ignore "javascripts/script.js"

# Change Compass configuration
compass_config do |config|
  config.add_import_path "bower_components/foundation-sites/scss/"
  config.output_style = :compact

  # Set this to the root of your project when deployed:
  config.http_path = "/"
  config.css_dir = "stylesheets"
  config.sass_dir = "stylesheets"
  config.images_dir = "images"
  config.javascripts_dir = "javascripts"
end

activate :blog do |blog|
  blog.name =    "news"
  blog.prefix =  "news"
  blog.layout =  "news"
end

activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'ie >= 9', 'and_chr >= 2.3']
end

# Add bower's directory to sprockets asset path
after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.remote = 'gh-pages'
end

# Build-specific configuration
configure :build do
end

configure :development do
end

#------------------------------------------------------------------------
AWS_CLOUDFRONT_DISTRIBUTION_ID  = 'E3MU5VW27PPDKR'

# Variables: Sent in on CLI by rake task via ENV
#------------------------------------------------------------------------
AWS_ACCESS_KEY                  = ENV['AWS_ACCESS_KEY']
AWS_SECRET                      = ENV['AWS_SECRET']

activate :cloudfront do |cf|
  cf.access_key_id                    = AWS_ACCESS_KEY
  cf.secret_access_key                = AWS_SECRET
  cf.distribution_id                  = AWS_CLOUDFRONT_DISTRIBUTION_ID
end
