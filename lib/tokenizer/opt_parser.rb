require 'optparse'
require 'tokenizer/version'
require 'tokenizer/tokenizer'

module Tokenizer
	class OptParser
		#singleton methode
		def self.parse args
			@@options = {}
			parser = create_parser #implizit : OptParser.create_parser
			begin
				parser.parse(args)
			rescue OptionParser::InvalidArgument
			rescue OptionParser::InvalidOption => e
				
				STDERR.puts "The system has encountered the following error:\n#{e.message}"
				STDERR.puts "You have used an invalid option on the tokenizer."
				STDERR.puts "To view the help and a list of valid options\ntype \"tokenize -h\""
				exit 1
			end
		end
		
		private
		
		def self.create_parser
			OptionParser.new do |args|
			
				args.banner = 'Usage: tokenize ARGS'
			
				args.on('-h', '--help', 'Show this summary!') do 
					puts args
					exit
				end
				args.on('-v', '--version', 'Show the version!') do
					puts "Tokenizer version #{VERSION} written and copyrighted by David Alfter."
					exit
				end
				#read filename, make absolute path, existence test, readability test, fehlermeldungen liefern (separat) ( + test)
				args.on('-f', '--file', 'Read filename') do
					if ARGV[-1] == '-f'
						puts "Please specify a filename with \'-f\'!"
						puts "tokenize -f \"filename\""
						exit
					else
						t = Tokenizer.new
						f = ARGV[-1]
						fp = File.expand_path(f)
						if File.exist?(fp)
							if File.readable?(fp)
								puts "All correct! Successfully opened \'#{fp}\'"
								puts "Tokenizing..."
								File.open(fp) do |file|
									while line = file.gets
										puts t.tokenize(line)
									end
								end
							else
								STDERR.puts "The specified file is not readable!"
								STDERR.puts fp
								STDERR.puts "Please change permission on file and retry!"
							end
						else
							STDERR.puts "The specified file could not be found!"
							STDERR.puts fp
							STDERR.puts "Make sure you have entered the filename correctly!"
						end
					end
				end
			
			end
		end
	end #class
end #module