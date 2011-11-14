# Load the rails application
require File.expand_path('../application', __FILE__)

# haml xhtml
Haml::Template.options[:format] = :xhtml

# Initialize the rails application
Intranet::Application.initialize!
