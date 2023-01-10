# frozen_string_literal: true

require 'set'

class LogParser
  attr_reader :page_views, :unique_page_views

  def initialize(log_lines)
    @page_views, @unique_page_views = parse(log_lines)
  end

  private

  def parse(log_lines)
    page_views = {}
    unique_page_views = {}

    log_lines.each do |line|
      page, ip = line.split
      page_views[page] ||= 0
      page_views[page] += 1
      (unique_page_views[page] ||= Set.new) << ip
    end

    [page_views, unique_page_views.to_h]
  end
end
