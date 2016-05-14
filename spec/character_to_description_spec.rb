require 'spec_helper'

describe CharacterToDescription do
  it 'has a version number' do
    expect(CharacterToDescription::VERSION).not_to be nil
  end

  describe CharacterToDescription::Dictionary do
    describe '.description' do
      context 'given an empty string' do
        it 'returns nil' do
          expect(CharacterToDescription::Dictionary.description('')).to eql(nil)
        end
      end
      context 'given a character' do
        it 'returns its description' do
          expect(CharacterToDescription::Dictionary.description('あ')).to eql('Hiragana letter あ')
        end
      end
      context 'given a string ' do
        it 'returns the description of its first letter' do
          expect(CharacterToDescription::Dictionary.description('言語')).to eql('ゲンゴガクノ ゲン')
        end
      end
    end
  end
end
