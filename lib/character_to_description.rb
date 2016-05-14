require "character_to_description/version"

module CharacterToDescription
  class Dictionary
    @description_table = {}

    File.open File.expand_path('../../descriptions.dic', __FILE__), 'r' do |file|
      file.each_line do |line|
        next if line.match /^#|^\r\n$/
        fields = line.split "\t"
        character = fields[0]
        description = fields[1].chomp.gsub /[()]/, ''
        @description_table[character] = description
      end
    end
    class << self
      def description(character)
        return nil if character.empty?
        character = character[0] if character.size > 1
        case character
        when /[a-z]/
          "Lower case #{character}"
        when /[A-Z]/
          "Upper case: #{character}"
        when /\p{Hiragana}/
          "Hiragana letter #{character}"
        when /\p{Katakana}/
          "Katakana letter #{character}"
        when /[一-龠]/
          @description_table[character]
        else
          "Unknown"
        end
      end
    end
  end
  refine String do
    def to_description
      CharacterToDescription::Dictionary.description self
    end
  end
end
