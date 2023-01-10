# frozen_string_literal: true

require_relative '../../lib/validators'

RSpec.describe Validators do
  describe '.validate_log_file' do
    context 'when the file has a valid extension' do
      let(:log_file) { double(:log_file, extname: '.txt') }

      before { allow(File).to receive(:extname).with(log_file).and_return(log_file.extname) }

      it 'does not raise an error' do
        expect { Validators.validate_log_file(log_file) }.to_not raise_error
      end
    end

    context 'when the file has an invalid extension' do
      let(:log_file) { double(:log_file, extname: '.csv') }

      before do
        allow(File).to receive(:extname).with(log_file).and_return(log_file.extname)
        allow(I18n).to receive(:t).with('validators.invalid_extension').and_return('Invalid file extension')
      end

      it 'raises an error' do
        expect { Validators.validate_log_file(log_file) }.to raise_error(ArgumentError, 'Invalid file extension')
      end
    end
  end

  describe '.validate_locale' do
    context 'when the locale is valid' do
      let(:locale) { 'en' }

      it 'does not raise an error' do
        expect { Validators.validate_locale(locale) }.to_not raise_error
      end
    end

    context 'when the locale is invalid' do
      let(:locale) { 'fr' }

      before { allow(I18n).to receive(:t).with('validators.invalid_locale').and_return('Invalid locale') }

      it 'raises an error' do
        expect { Validators.validate_locale(locale) }.to raise_error(ArgumentError, 'Invalid locale')
      end
    end
  end
end
