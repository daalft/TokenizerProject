require 'tokenizer/tokenizer'
require 'test/unit'

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
end

