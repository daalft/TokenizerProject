# :title: My cool Tokenizer!!!
# :main: README.rdoc
require 'tokenizer/error'
#The module Tokenizer is the namespace for this project.
module Tokenizer
	#The class Tokenizer defines the tokenizer itself.
	class Tokenizer
	#Language used by the tokenizer
	@lang
	#WL is the "word limit" used by the tokenizer.
	WL = /\s+/
	PRE = %w{ ( ) " ' ? ! , : ; - }
	POST = %w{ ( ) " '}
		#Constructs a Tokenizer with specified language. Standard = :de
		def initialize(params = {:lang => :de})
			check_params(params)
		end
		#Returns the tokens contained in the given string.
		def tokenize(str)
			tokens = str.split(WL)
			tokens = sep_punct(tokens)
			tokens
		end
		
		private
		#Check whether the parameters passed to the method are valid
		def check_params(params)
			if !params.instance_of?(Hash)
				fail(UserError, "Die Parameter sind keine Hash-Struktur!") 
			elsif  params.empty?
				fail(UserError, "Die Parameter sind leer!")
			elsif !params.has_key?(:lang)
				fail(UserError, "Der Parameter \'lang\' hat keinen Wert!")
			end
		end
		#Separate punctuation from tokens
		def sep_punct (tokens)
			out = ""
			tokens.each do |token|
				token.each_char do |c|
					if PRE.include?(c)
						out << "#{c}\n"
					elsif POST.include?(c)
						out << "\n#{c}"
					else
						out << c
					end
				end
				out << "\n"
			end
			out.split(/\n+/)
		end
	end
end