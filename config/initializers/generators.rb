# set up my custom generators to work with scaffolding
Intranet::Application.config.generators do |g|
  g.test_framework :rspec, :views => false, :fixture => true
  g.fixture_replacement :factory_girl, :dir => 'spec/factories'
  g.form_builder :simple_form
  g.template_engine :haml
end