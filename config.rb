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

# Build-specific configuration
configure :build do
end

configure :development do
  activate :livereload
end
