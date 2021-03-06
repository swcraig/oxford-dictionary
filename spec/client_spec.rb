require 'spec_helper'

RSpec.describe OxfordDictionary::Client do
  let(:app_id) { 'ID' }
  let(:app_key) { 'KEY' }
  let(:client) { described_class.new(app_id: app_id, app_key: app_key) }

  describe '#new' do
    let(:excepted_error_string) { 'app_id and app_key arguments required.' }

    it 'requires an argument' do
      expect { OxfordDictionary::Client.new(nil) }.
        to raise_error(ArgumentError, excepted_error_string)
    end

    it 'requires a hash argument' do
      expect { OxfordDictionary::Client.new('string') }.
        to raise_error(ArgumentError, excepted_error_string)
    end

    it 'requires both id and key' do
      expect { OxfordDictionary.new(app_id: 'ID') }.
        to raise_error(ArgumentError, excepted_error_string)
    end
  end

  describe '#entry' do
    subject { client.entry(args) }

    context 'when the argument is a Hash' do
      let(:args) { { word: 'ace', dataset: 'en-us', params: {} } }

      it 'calls the Entries endpoint with correct arguments' do
        expect_any_instance_of(OxfordDictionary::Endpoints::Entries).
          to receive(:entry).
          with(word: args[:word],
               dataset: args[:dataset],
               params: args[:params])

        subject
      end
    end
  end

  describe '#lemma' do
    subject { client.lemma(word: word, language: language, params: params) }
    let(:word) { 'ace' }
    let(:language) { 'en' }
    let(:params) { {} }

    it 'calls the Lemmas endpoint with correct arguments' do
      expect_any_instance_of(OxfordDictionary::Endpoints::Lemmas).
        to receive(:lemma).
        with(word: word, language: language, params: params)

      subject
    end
  end

  describe '#translation' do
    subject do
      client.translation(
        word: word,
        source_language: source_language,
        target_language: target_language,
        params: params
      )
    end

    let(:word) { 'ace' }
    let(:source_language) { 'en' }
    let(:target_language) { 'es' }
    let(:params) { {} }

    it 'calls the Translations endpoint with correct arguments' do
      expect_any_instance_of(OxfordDictionary::Endpoints::Translations).
        to receive(:translation).
        with(word: word,
             source_language: source_language,
             target_language: target_language,
             params: params)

      subject
    end
  end

  describe '#sentence' do
    subject { client.sentence(word: word, language: language, params: params) }
    let(:word) { 'ace' }
    let(:language) { 'en' }
    let(:params) { {} }

    it 'calls the Sentences endpoint with correct arguments' do
      expect_any_instance_of(OxfordDictionary::Endpoints::Sentences).
        to receive(:sentence).
        with(word: word, language: language, params: params)

      subject
    end
  end

  describe '#thesaurus' do
    subject { client.thesaurus(word: word, language: language, params: params) }
    let(:word) { 'ace' }
    let(:language) { 'en' }
    let(:params) { {} }

    it 'calls the Thesaurus endpoint with correct arguments' do
      expect_any_instance_of(OxfordDictionary::Endpoints::Thesaurus).
        to receive(:thesaurus).
        with(word: word, language: language, params: params)

      subject
    end
  end

  describe '#search' do
    subject { client.search(language: language, params: params) }
    let(:language) { 'en' }
    let(:params) { { q: 'an' } }

    it 'calls the Search endpoint with correct arguments' do
      expect_any_instance_of(OxfordDictionary::Endpoints::Search).
        to receive(:search).
        with(language: language, params: params)

      subject
    end
  end

  describe '#search_translation' do
    subject do
      client.search_translation(
        source_language: source_language,
        target_language: target_language,
        params: params
      )
    end
    let(:source_language) { 'en' }
    let(:target_language) { 'es' }
    let(:params) { {} }

    it 'calls the Search endpoint with correct arguments' do
      expect_any_instance_of(OxfordDictionary::Endpoints::Search).
        to receive(:search_translation).
        with(source_language: source_language,
             target_language: target_language,
             params: params)

      subject
    end
  end
end
