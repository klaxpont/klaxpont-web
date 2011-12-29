
# Sass::Engine::DEFAULT_OPTIONS[:load_paths].tap do |load_paths|
#   load_paths << "#{Rails.root}/app/assets/stylesheets"
#   load_paths << "#{Gem.loaded_specs['compass'].full_gem_path}/frameworks/compass/stylesheets"
# end

Klaxpont::Application.config.sass.load_paths.tap do |paths|
  paths << "#{Gem.loaded_specs['compass'].full_gem_path}/frameworks/compass/stylesheets"
  paths << "#{Gem.loaded_specs['compass'].full_gem_path}/frameworks/blueprint/stylesheets"
end
