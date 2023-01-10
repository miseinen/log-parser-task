# frozen_string_literal: true

require_relative '../../lib/printer'

RSpec.describe Printer do
  describe '.print_usage_info' do
    let(:expected_output) { "USAGE: This is the usage information\n" }

    before do
      allow(I18n).to receive(:t).with('printer.usage').and_return('USAGE')
      allow(I18n).to receive(:t).with('printer.usage_info_message').and_return('This is the usage information')
    end

    it 'prints the usage info' do
      expect { Printer.print_usage_info }.to output(expected_output).to_stdout
    end
  end

  describe '.print_views_details' do
    let(:page_views) { { 'page1' => 2, 'page2' => 4, 'page3' => 1 } }
    let(:unique_page_views) do
      {
        'page1' => ['10.0.0.1', '10.0.0.2'],
        'page2' => ['10.0.0.1', '10.0.0.3', '10.0.0.4'],
        'page3' => ['10.0.0.1']
      }
    end

    let(:expected_output) do
      "MOST PAGE VIEWS\npage2 4 visits\npage1 2 visits\npage3 1 visits\n\n"\
      "UNIQUE PAGE VIEWS\npage2 3 unique views\npage1 2 unique views\npage3 1 unique views\n"
    end

    before do
      allow(I18n).to receive(:t).with('printer.most_page_view_message').and_return('MOST PAGE VIEWS')
      allow(I18n).to receive(:t).with('printer.visits').and_return('visits')
      allow(I18n).to receive(:t).with('printer.unique_page_views_message').and_return('UNIQUE PAGE VIEWS')
      allow(I18n).to receive(:t).with('printer.unique_views').and_return('unique views')
    end

    it 'prints the views details' do
      expect { Printer.print_views_details(page_views, unique_page_views) }.to output(expected_output).to_stdout
    end
  end
end
