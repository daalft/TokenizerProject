require 'tokenizer'
require 'test/unit'
#This is the test suite for lib/tokenizer/version.rb
class TestVersion < Test::Unit::TestCase
	#Setup a tokenizer
	def setup
		@t = Tokenizer::Tokenizer.new(:de)
	end
	#Test whether version is a string.
	def test_version_is_string
		assert(Tokenizer::VERSION.is_a?(String), "Falsche Klasse fuer Version!")		
	end
	#Test whether version is empty.
	def test_version_not_empty
		assert_equal(false, Tokenizer::VERSION.empty?)
	end
	
	
	
	
end #Test Version