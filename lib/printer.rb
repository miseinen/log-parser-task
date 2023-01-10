# frozen_string_literal: true

module Printer
  def self.print_usage_info
    puts "#{I18n.t('printer.usage')}: #{I18n.t('printer.usage_info_message')}"
  end

  def self.print_views_details(page_views, unique_page_views)
    print_page_views(page_views)
    print_unique_views(unique_page_views)
  end

  def self.print_page_views(page_views)
    puts I18n.t('printer.most_page_view_message')
    page_views.sort_by { |_page, views| -views }.each do |page, views|
      puts "#{page} #{views} #{I18n.t('printer.visits')}"
    end
  end

  def self.print_unique_views(unique_page_views)
    puts "\n#{I18n.t('printer.unique_page_views_message')}"
    unique_page_views.sort_by { |_page, unique_views| -unique_views.size }.each do |page, unique_views|
      puts "#{page} #{unique_views.size} #{I18n.t('printer.unique_views')}"
    end
  end
end
