#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative './lib/log_reader'
require_relative './lib/log_parser'
require_relative './lib/validators'
require_relative './lib/error_handler'
require_relative './lib/printer'
require_relative './lib/localization'

require 'I18n'

if ARGV.count.zero?
  Localization.activate
  Printer.print_usage_info
else
  log_file = ARGV[0]
  locale = ARGV[1]

  begin
    Localization.activate(locale)
    Validators.validate_log_file(log_file)
    log_lines = LogReader.new(log_file).log_lines
    parsed_log = LogParser.new(log_lines)

    Printer.print_views_details(parsed_log.page_views, parsed_log.unique_page_views)
  rescue Exception => e
    ErrorHandler.handle_error(e)
  end
end
