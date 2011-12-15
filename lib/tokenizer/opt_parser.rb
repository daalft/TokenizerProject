require 'optparse'
require 'tokenizer/version'
require 'tokenizer/tokenizer'

module Tokenizer
	class OptParser
		LType = ['de', 'en', 'sp']
		Err_M = "The system has encountered the following error:\n"
		#singleton methode
		def self.parse args
			@@options = {:lang => :de}
			parser = create_parser #implizit : OptParser.create_parser
			begin
				parser.parse(args)
			rescue OptionParser::MissingArgument => e
				STDERR.puts Err_M
				STDERR.puts "#{e.message}\nYou have to specify an argument for this option"
				exit 1
			rescue OptionParser::InvalidArgument
			rescue OptionParser::InvalidOption => e
				STDERR.puts Err_M
				STDERR.puts "#{e.message}\nYou have used an invalid option on the tokenizer."
				STDERR.puts "To view the help and a list of valid options\ntype \"tokenize -h\""
				exit 1
			end
			@@options
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
				args.on('-f', '--file filename', 'Read filename') do |filename|
					f = filename
					fp = File.expand_path(f)
					if File.exist?(fp)
						if File.readable?(fp)
							puts "All correct! Successfully opened \'#{fp}\'"
							puts "Tokenizing..."
							@@options[:filename] = fp
							begin
							File.open(fp) do |file|
								@@options[:lines] = file.readlines
							end
							rescue IOError => e
								STDERR.puts Err_M
								STDERR.puts "#{e.message}\nError opening the file."
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
					exit
				end
				args.on('-l', '--lang lang', LType, "Choose a language for the tokenizer!", "Possible values: #{LType}") do |lang|
					@@options[:lang] = lang.to_sym
					
				end
			end
		end
	end #class
end #module