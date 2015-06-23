def make_acronym(phrase)
  'Not a string' if phrase.is_a?(Array)
  'Not a string' if phrase.is_a?(Hash)
  'Not letters' if phrase. ###ADD SOME REGEX HERE
  phrase.split(" ").map{|word| word[0].upcase}.join
end
