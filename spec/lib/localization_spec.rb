# frozen_string_literal: true

require_relative '../../lib/localization'

RSpec.describe Localization do
  describe '.activate' do
    subject { described_class.activate(locale) }

    context 'when given a valid locale' do
      let(:locale) { 'jp' }

      it 'sets the default locale' do
        subject
        expect(I18n.default_locale).to eq(:jp)
      end
    end

    context 'when given an invalid locale' do
      let(:locale) { 'fr' }

      it 'raises an error' do
        expect { subect }.to raise_error(StandardError)
      end
    end

    context 'when not given a locale' do
      let(:locale) { nil }

      it 'sets the default locale to :en' do
        subject
        expect(I18n.default_locale).to eq(:en)
      end
    end
  end
end
