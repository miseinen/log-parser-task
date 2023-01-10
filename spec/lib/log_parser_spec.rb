# frozen_string_literal: true

require_relative '../../lib/log_parser'

RSpec.describe LogParser do
  subject { described_class.new(log_lines) }

  context 'when valid log lines' do
    let(:log_lines) do
      [
        '/help_page/1 126.318.035.038',
        '/contact 184.123.665.067',
        '/contact 184.123.665.067'
      ]
    end

    let(:expected_page_views) do
      {
        '/help_page/1' => 1,
        '/contact' => 2
      }
    end

    let(:expected_unique_page_views) do
      {
        '/help_page/1' => Set.new(['126.318.035.038']),
        '/contact' => Set.new(['184.123.665.067'])
      }
    end

    it 'returns a hash of page views and a hash of unique page views' do
      expect(subject.page_views).to eq(expected_page_views)
      expect(subject.unique_page_views).to eq(expected_unique_page_views)
    end
  end
end
