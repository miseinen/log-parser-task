# frozen_string_literal: true

module Validators
  LOG_EXTENSION = ['.txt', '.log'].freeze
  LOCALE = %w[en jp].freeze

  private_constant :LOG_EXTENSION, :LOCALE

  def self.validate_log_file(log_file)
    return if LOG_EXTENSION.include?(File.extname(log_file))

    raise ArgumentError, I18n.t('validators.invalid_extension')
  end

  def self.validate_locale(locale)
    return if LOCALE.include?(locale)

    raise ArgumentError, I18n.t('validators.invalid_locale')
  end
end
