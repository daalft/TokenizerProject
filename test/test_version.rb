require 'tokenizer'
require 'test/unit'

class TestVersion < Test::Unit::TestCase

	def setup
		@t = Tokenizer::Tokenizer.new(:de)
	end
	
	def test_version_is_string
		assert(Tokenizer::VERSION.is_a?(String), "Falsche Klasse fuer Version!")		
	end

	def test_version_not_empty
		assert_equal(false, Tokenizer::VERSION.empty?)
	end
	
	
	
	
end #Test Version