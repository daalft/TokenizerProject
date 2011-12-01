require 'optparse'
require 'tokenizer/version'

module Tokenizer
	class OptParser
		#singleton methode
		def self.parse args
			@@options = {}
			parser = create_parser #implizit : OptParser.create_parser
			parser.parse(args)
		end
		
		private
		
		def self.create_parser
			OptionParser.new do |args|
				args.banner = 'Usage: tokenize ARGS'
				args.on('-h', '--help', 'Show this summary!') do 
					puts args
					exit
				end
			end
		end
	end #class
end #module