# frozen_string_literal: true

require_relative '../../lib/error_handler'

RSpec.describe ErrorHandler do
  describe '.handle_error' do
    subject { described_class.handle_error(error_message) }

    let(:error_message) { 'Error message' }

    before { allow(I18n).to receive(:t).with('error_handler.general').and_return('Error occured:') }

    it 'outputs an error message to the console' do
      expect { subject }.to output("Error occured: #{error_message}\n").to_stdout
    end
  end
end
