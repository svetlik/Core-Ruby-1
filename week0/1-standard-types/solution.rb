def histogram(string)
  chars = {}
  string.delete(' ').each_char { |c| chars[c] = string.count(c) }
  chars
end

def prime?(n)
  (2...n).all? { |c| (n % c) != 0 }
end

def ordinal(n)
  ones = n % 10
  tens = n % 100
  if (4..20).include? tens then "#{n}th"
  else choose_one(n, ones)
  end
end

def choose_one(n, ones)
  case ones
  when 1       then "#{n}st"
  when 2       then "#{n}nd"
  when 3       then "#{n}rd"
  when 0, 4..9 then "#{n}th"
  end
end

def palindrome?(object)
  string = object.to_s.downcase.gsub(/\s+/, '')
  string == string.reverse ? true : false
end

def anagram?(word, other)
  histogram(word) == histogram(other) ? true : false
end

def remove_prefix(string, prefix)
  string.slice(prefix.length..string.length)
end

def remove_suffix(string, suffix)
  string.reverse!.slice(suffix.length..string.length).reverse!
end

def digits(n)
  n.to_s.each_char.map(&:to_i)
end

def fizzbuzz(range)
  array = []
  range.each do |n|
    if (n % 15 == 0) then array << :fizzbuzz
    elsif (n % 5 == 0) then array << :buzz
    elsif (n % 3 == 0) then array << :fizz
    else array << n
    end
  end
  array
end

def count(array)
  objects = {}
  array.each { |object| objects[object] = array.count(object) }
  objects
end

def count_words(*sentences)
  words = []
  (sentences.length).times do |number|
    words += sentences[number].downcase.gsub(/[^0-9a-z' ]/i, '').split(' ')
  end
  count(words)
end
