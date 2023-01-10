# frozen_string_literal: true

module ErrorHandler
  def self.handle_error(error_message)
    puts "#{I18n.t('error_handler.general')} #{error_message}"
  end
end
