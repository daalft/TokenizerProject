require 'tokenizer/opt_parser'
require 'test/unit'
require 'optparse'

class TestOptParser < Test::Unit::TestCase

	def setup
		#self-explanatory
		@opt = Tokenizer::OptParser
		#good option (implemented)
		@go = '-v'
		#bad option (not implemented)
		@bo = '-s'
	end
	
	def test_opt_parser_instantiable
		assert(@opt.new)
	end
	
	def test_parse_works_as_class_method
		assert_raise(NoMethodError) {@opt.new.parse(@go)}
	end
	
	def test_parse_minus_v_works
		assert(@opt.parse(@go))
	end
	
	def test_wrong_option_raises_error
		assert_raise(OptionParser::InvalidOption) {@opt.parse(@bo)}
	end
end
