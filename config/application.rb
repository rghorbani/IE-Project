require File.expand_path('../boot', __FILE__)

require 'rails/all'

<<<<<<< HEAD


=======
>>>>>>> c65f81f4d82ef87298bbcbc553797664478b880b
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

<<<<<<< HEAD
module IE
=======
module IE2
>>>>>>> c65f81f4d82ef87298bbcbc553797664478b880b
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
<<<<<<< HEAD
    # config.i18n.default_locale = :de
    #config.i18n.default_locale = :fa
    #I18n.locale = :fa
    #config.active_record.whitelist_attributes = true
=======
    # config.i18n.default_locale = :fa
>>>>>>> c65f81f4d82ef87298bbcbc553797664478b880b
  end
end
