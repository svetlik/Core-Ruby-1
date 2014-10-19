require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Unit::TestCase
  def test_histograms
    assert_equal histogram('abraca'), 'a' => 3, 'b' => 1, 'r' => 1, 'c' => 1
    assert_equal histogram('aaaaaa'), 'a' => 6
    assert_equal histogram('a3!3!?'), 'a' => 1, '3' => 2, '!' => 2, '?' => 1
  end

  def test_primes
    assert_equal prime?(7), true
    assert_equal prime?(8), false
    assert_equal prime?(1), false
  end

  def test_ordinals
    assert_equal ordinal(2), '2nd'
    assert_equal ordinal(112), '112th'
    assert_equal ordinal(53), '53rd'
    assert_equal ordinal(1054), '1054th'
    assert_equal ordinal(16), '16th'
    assert_equal ordinal(9), '9th'
    assert_equal ordinal(213), '213th'
    assert_equal ordinal(101), '101st'
    assert_equal ordinal(1000), '1000th'
    assert_equal ordinal(0), '0th'
  end

  def test_palindromes
    assert_equal palindrome?(12_321), true
    assert_equal palindrome?('Race car'), true
    assert_equal palindrome?('Azobichammachiboza'), false
    assert_equal palindrome?(293_821), false
    assert_equal palindrome?(:racecar), true
    # assert_equal palindrome?(0b10001), true
    # assert_equal palindrome?(010001), true
    # assert_equal palindrome?(0x10001), true
    assert_equal palindrome?("Kara'o'arak"), true
  end

  def test_anagrams
    assert_equal anagram?('silent', 'listen'), true
    assert_equal anagram?('Mr Mojo Risin', 'Jim Morisson'), false
    assert_equal anagram?('a lia', 'aila'), true
    assert_equal anagram?('ankh', 'morpork'), false
    # assert_equal anagram?("K'vatch", "vatchk"), false
  end

  def test_removing_prefixes
    assert_equal remove_prefix('Ladies Night Out', 'Ladies '), 'Night Out'
    assert_equal remove_prefix('Ladies Night Out', 'Ladies Night'), ' Out'
    assert_equal remove_prefix('03453456', '034'), '53456'
    # assert_equal remove_prefix('    _345', '  '), "  _345"
  end

  def test_removing_suffixes
    assert_equal 'Ladies', remove_suffix('Ladies Night Out', ' Night Out')
    assert_equal remove_suffix('Ladies Night Ladies Out', ' Out'), 'Ladies Night Ladies'
    assert_equal remove_suffix('1343=_433t', '33t'), '1343=_4'
    assert_equal remove_suffix('234   _43<   __   ', '_   '), '234   _43<   _'
  end

  def test_digits
    assert_equal digits(12_345), [1, 2, 3, 4, 5]
    # assert_equal digits(-12345), [1, 2, 3, 4, 5]
  end

  def test_fizzbuzz
    assert_equal fizzbuzz(1..7), [1, 2, :fizz, 4, :buzz, :fizz, 7]
  end

  def test_count
    assert_equal count([1, 2, 3, 1]), 1 => 2, 2 => 1, 3 => 1
    assert_equal count(%w(an array of words words)), 'an' => 1, 'array' => 1, 'of' => 1, 'words' => 2
  end

  def test_count_words
    assert_equal count_words("This isn't a sentence, bro, is it?", 'Bro, this is a sentence.'), 'this' => 2, "isn't" => 1, 'a' => 2, 'sentence' => 2, 'bro' => 2, 'is' => 2, 'it' => 1
  end
end
