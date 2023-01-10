# frozen_string_literal: true

require_relative '../runner'

describe 'script' do
  let(:log_file) { 'logs/test.log' }
  let(:locale) { 'en' }

  before do
    allow(ARGV).to receive(:count).and_return(2)
    allow(ARGV).to receive(:[]).with(0).and_return(log_file)
    allow(ARGV).to receive(:[]).with(1).and_return(locale)
  end

  context 'when no arguments provided' do
    before do
      allow(Localization).to receive(:activate)
      allow(ARGV).to receive(:count).and_return(0)
    end

    it 'prints the usage info' do
      expect(Printer).to receive(:print_usage_info)
      load './runner.rb'
    end
  end

  context 'when arguments provided' do
    context 'when valid log file and locale' do
      let(:log_lines) { ['page1 10.0.0.1', 'page1 10.0.0.2', 'page2 10.0.0.3', 'page2 10.0.0.4'] }

      before do
        allow(LogReader).to receive(:new).with(log_file).and_return(double(log_lines: log_lines))
        allow(LogParser).to receive(:new).with(log_lines).and_return(double(page_views: { 'page1' => 2, 'page2' => 2 },
                                                                            unique_page_views: {
                                                                              'page1' => ['10.0.0.1',
                                                                                          '10.0.0.2'], 'page2' => ['10.0.0.3', '10.0.0.4']
                                                                            }))
        allow(Localization).to receive(:activate).with(locale)
        allow(Validators).to receive(:validate_log_file).with(log_file)
        allow(Printer).to receive(:print_views_details)
      end

      it 'calls necessary classes' do
        expect(Localization).to receive(:activate).with(locale)
        expect(Validators).to receive(:validate_log_file).with(log_file)
        expect(LogReader).to receive(:new).with(log_file)
        expect(LogParser).to receive(:new).with(log_lines)
        expect(Printer).to receive(:print_views_details)
        load './runner.rb'
      end
    end

    context 'when invalid log file or locale' do
      before do
        allow(Localization).to receive(:activate).with(locale)
        allow(Validators).to receive(:validate_log_file).with(log_file).and_raise(ArgumentError)
        allow(ErrorHandler).to receive(:handle_error)
      end

      it 'handles error' do
        expect(ErrorHandler).to receive(:handle_error)
        load './runner.rb'
      end
    end
  end
end
