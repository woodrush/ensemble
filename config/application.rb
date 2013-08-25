require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module TemplateApp
  class Application < Rails::Application
    config.time_zone = 'Athens'

    config.generators do |g|
      g.test_framework :rspec,
        :fixtures => false,
        :view_specs => false,
        :helper_specs => false,
        :routing_specs => false,
        :controller_specs => true,
        :request_specs => true
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.assets.precompile += %w(admin/admin_base_css.css admin/admin_base_js.js)
    config.assets.precompile += %w(front/front_base_css.css front/front_base_js.js)
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.ico)
    # config.assets.precompile += %w(authentication.js authentication.css)
    # config.assets.precompile += %w(front/fonts/*

    # # Fonts precompile
    # config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    # config.assets.precompile += %w( *.ttf *.css *.js )
  end
end