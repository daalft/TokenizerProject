<<<<<<< HEAD
module Tokenizer	class Tokenizer	@@lang		def initialize lang			@@lang = lang		end	endend
=======
﻿# :title: My cool Tokenizer!!!
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
>>>>>>> ad87841b36091e771f8361bb68b8e26cde876678
