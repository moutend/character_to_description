require 'spec_helper'

describe CharacterToDescription do
  it 'has a version number' do
    expect(CharacterToDescription::VERSION).not_to be nil
  end

  String.send :include, CharacterToDescription

  it 'has an alias method for #to_description' do
    expect('string'.respond_to? :to_d).to eql(true)
  end

  describe '#to_description' do
    context 'given an empty character' do
      description_for_unknown_character = CharacterToDescription::DESCRIPTION_FOR_UNKNOWN
      it "returns #{description_for_unknown_character}" do
        expect(''.to_d).to eql(description_for_unknown_character)
      end
    end

    context 'given a character' do
      it 'returns its description' do
        expect('あ'.to_d).to eql("ひらがなの「あ」")
      end
    end

    context 'given a string' do
      it 'returns a description of a first letter' do
        expect('あいうえお'.to_d).to eql("ひらがなの「あ」")
      end
    end

    context 'overwrite athe user dictionary' do
      it 'returns new description' do
        CharacterToDescription.user_dictionary['あ'] = 'Hiragana letter'
        expect('あ'.to_d).to eql('Hiragana letter')
      end
    end
  end
end
