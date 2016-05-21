require "character_to_description/version"

module CharacterToDescription
  DESCRIPTION_FOR_UNKNOWN = '説明がありません'
  DICTIONARY_PATH = File.expand_path '../../descriptions.dic', __FILE__

  @dictionary = {}
  @user_dictionary = {}

  File.open(DICTIONARY_PATH, 'r') do |file|
    file.each_line do |line|
      next if line.match /^#|^\r\n$/
      fields = line.split "\t"
      character = fields[0]
      description = fields[1].chomp.gsub /[()]/, ''
      @dictionary[character] = description
    end
  end

  class << self
    attr_reader :dictionary
    attr_accessor :user_dictionary
  end

  def to_description
    character = self[0]
    description = CharacterToDescription.user_dictionary[character]

    return description unless description.nil?

    case character
    when /[a-z]/
      "Lower case #{character}"
    when /[A-Z]/
      "Upper case: #{character}"
    when /\p{Hiragana}/
      "ひらがなの「#{character}」"
    when /\p{Katakana}/
      "カタカナの「#{character}」"
    when /[一-龠]/
      CharacterToDescription.dictionary[character]
    else
      CharacterToDescription::DESCRIPTION_FOR_UNKNOWN
    end
  end
  alias_method :to_d, :to_description
end
