# :title: My cool Tokenizer!!!
# :main: README.rdoc
#The module Tokenizer is the namespace for this project.
module Tokenizer
	#The class Tokenizer defines the tokenizer itself.
	class Tokenizer
		
	@lang
	#WL is the word limit used by the tokenizer.
	WL = /\s+/
		#Constructs a Tokenizer with specified language. Standard = :de
		def initialize(lang = :de)
			@lang = lang
		end
		#Returns the tokens contained in the given string.
		def tokenize(str)
			
			tokens = str.split(WL)
			
			tokens
		end
	end
end