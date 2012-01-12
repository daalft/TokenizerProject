require 'tokenizer/tokenizer'
require 'test/unit'
#This is the test suite for lib/tokenizer/tokenizer.rb
class TestTokenizer < Test::Unit::TestCase

	def setup
		@t = Tokenizer::Tokenizer.new
		@result = @t.tokenize("test\t\n string")
	end
	
	def test_has_method
		assert(@t.respond_to?(:tokenize))
	end
	
	def test_returns_array
		assert_instance_of(Array, @result)
	end
	
	def test_array_not_empty
		assert_equal(false, @result.empty?)
	end
	
	def test_array_contains_strings
		assert_instance_of(String, @result.first)
	end
	
	def test_splits_more_whitespace
		assert_equal(["test", "string"], @result)
	end
	
	def test_simple_email_not_split
		assert_equal(["abc@mail.com"], @t.tokenize("abc@mail.com"))
	end
	
	def test_complex_email_not_split
		assert_equal(["this_is_a_mail.123@something.info"], @t.tokenize("this_is_a_mail.123@something.info"))
	end
	
	def test_no_empty_tokens
		assert_equal(["hallo", "(", ")", "du"], @t.tokenize("hallo\n(\n\n)\ndu"))
	end
end

