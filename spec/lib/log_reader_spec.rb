# frozen_string_literal: true

require_relative '../../lib/log_reader'

RSpec.describe LogReader do
  subject { described_class.new(log_file) }

  let(:log_file) { double(:log_file) }

  before { allow(File).to receive(:foreach).with(log_file).and_yield("line1\n").and_yield("line2\n") }

  it 'reads the log file and sets log_lines' do
    expect(subject.log_lines).to eq(%w[line1 line2])
  end
end
