# frozen_string_literal: true

require_relative './validators'

module Localization
  def self.activate(locale = nil)
    Validators.validate_locale(locale) unless locale.nil?

    I18n.load_path += Dir["#{File.expand_path('config/locales')}/*.yml"]
    I18n.default_locale = locale.nil? ? :en : locale.to_sym
  end
end
