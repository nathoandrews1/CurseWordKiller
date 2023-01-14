module CurseWordKiller
  class << self
    def filter(text)
      @profanity = text.split(' ')
      @profanityList = %w[fuck fuck. fucking fucking. cunt cunt. bitch bitch. bastard arse arsehole ass asshole bullshit bollocks bollox crap prick shit twat]
      @filtered = []
      @profanity.each do |word|
        if word.downcase
          if word.in?(@profanityList)
            @word = word[0] # Setting the first letter here
            @index = 0

            # looping the elements of the curse word
            word.split("").each do |char|
              if @index == word.size - 1
                @word += char
                break
              end
              @word += '*'
              @index += 1
            end
            # adding the filtered word to the array
            @filtered << @word
          else
            # adding non profanity word back to array
            @filtered << word
          end
        end
      end
      @sentence = @filtered.join(' ')
      return @sentence
    end
  end
end