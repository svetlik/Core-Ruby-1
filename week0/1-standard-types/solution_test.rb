require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Unit::TestCase
  def test_histograms
    abraca = { 'a' => 3, 'b' => 1, 'r' => 1, 'c' => 1 }
    aaaaaa = { 'a' => 6 }
    a3 = { 'a' => 1, '3' => 2, '!' => 2, '?' => 1 }
    assert_equal abraca, histogram('abraca')
    assert_equal aaaaaa, histogram('aaaaaa')
    assert_equal a3, histogram('a3!3!?')
  end

  def test_primes
    assert_equal true, prime?(7)
    assert_equal false, prime?(8)
    assert_equal false, prime?(1)
  end

  def test_ordinals
    assert_equal '2nd', ordinal(2)
    assert_equal '112th', ordinal(112)
    assert_equal '53rd', ordinal(53)
    assert_equal '1054th', ordinal(1054)
    assert_equal '16th', ordinal(16)
    assert_equal '9th', ordinal(9)
    assert_equal '213th', ordinal(213)
    assert_equal '101st', ordinal(101)
    assert_equal '1000th', ordinal(1000)
    assert_equal '0th', ordinal(0)
  end

  def test_palindromes
    assert_equal true, palindrome?(12_321)
    assert_equal true, palindrome?('Race car')
    assert_equal false, palindrome?('Azobichammachiboza')
    assert_equal false, palindrome?(293_821)
    assert_equal true, palindrome?(:racecar)
    assert_equal true, palindrome?("Kara'o'arak")
  end

  def test_anagrams
    assert_equal true, anagram?('silent', 'listen')
    assert_equal false, anagram?('Mr Mojo Risin', 'Jim Morisson')
    assert_equal true, anagram?('a lia', 'aila')
    assert_equal false, anagram?('ankh', 'morpork')
  end

  def test_removing_prefixes
    assert_equal 'Night Out', remove_prefix('Ladies Night Out', 'Ladies ')
    assert_equal ' Out', remove_prefix('Ladies Night Out', 'Ladies Night')
    assert_equal '53456', remove_prefix('03453456', '034')
    assert_equal nil, remove_prefix('Ladies Night Out', 'morriss')
  end

  def test_removing_suffixes
    ladies = 'Ladies Night Ladies'
    assert_equal 'Ladies', remove_suffix('Ladies Night Out', ' Night Out')
    assert_equal ladies, remove_suffix('Ladies Night Ladies Out', ' Out')
    assert_equal '1343=_4', remove_suffix('1343=_433t', '33t')
    assert_equal '234   _43<   _', remove_suffix('234   _43<   __   ', '_   ')
    assert_equal nil, remove_suffix('Ladies Night Out', ' catalan')
  end

  def test_digits
    assert_equal [1, 2, 3, 4, 5], digits(12_345)
  end

  def test_fizzbuzz
    assert_equal [1, 2, :fizz, 4, :buzz, :fizz, 7], fizzbuzz(1..7)
  end

  def test_count
    numbers = { 1 => 2, 2 => 1, 3 => 1 }
    words = { 'an' => 1, 'array' => 1, 'of' => 1, 'words' => 2 }
    assert_equal numbers, count([1, 2, 3, 1])
    assert_equal words, count(%w(an array of words words))
  end

  def test_count_words
    counts = { 'this' => 2, "isn't" => 1, 'a' => 2 }
      .merge('sentence' => 2, 'bro' => 2, 'is' => 2, 'it' => 1)
    first_string  = "This isn't a sentence, bro, is it?"
    second_string = 'Bro, this is a sentence.'
    assert_equal counts, count_words(first_string, second_string)
  end
end
