# frozen_string_literal: true

class LogReader
  attr_reader :log_lines

  def initialize(log_file)
    @log_lines = read(log_file)
  end

  private

  def read(log_file)
    log_lines = []

    File.foreach(log_file) { |line| log_lines << line.chomp }

    log_lines
  end
end
