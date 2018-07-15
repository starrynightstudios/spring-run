# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

set :markdown_engine, :redcarpet

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

require 'sprockets/es6'
activate :sprockets do |s|
  s.supported_output_extensions << '.es6'
end

sprockets.append_path File.join(root, "node_modules")

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# Loop through each page
data.pages.each do |id, page|
  # The path to the page gets set from the slug of the page
  path = page.slug == 'homepage' ? '/index.html' : "#{page.slug}/index.html"
  # Use the appropriate template
  template = "/templates/page.html"
  # Add the proxy
  proxy path, template, locals: { page: page }
end

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
