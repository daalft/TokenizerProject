require 'tokenizer/opt_parser'
require 'test/unit'
require 'optparse'

class TestOptParser < Test::Unit::TestCase

	def setup
		#self-explanatory
		@opt = Tokenizer::OptParser
		#good option (implemented)
		@go = '-h'
		#bad option (not implemented)
		@bo = '-s'
	end
	
	def test_opt_parser_instantiable
		assert(@opt.new)
	end
	
	def test_public_method
		assert_respond_to(@opt, :parse)
	end
	
	def test_parse_works_as_class_method
		assert_raise(NoMethodError) {@opt.new.parse(@go)}
	end
	
	def test_parse_returns_non_empty_hash
		begin
			result = @opt.parse(@go)
			assert_instance_of(Hash, result)
			assert_equal(false, result.empty?)
		rescue SystemExit
		end
	end
	
	def test_invalid_option_raises_exit
		assert_raise(SystemExit) { @opt.parse(@bo) }
	end
	
	
end
