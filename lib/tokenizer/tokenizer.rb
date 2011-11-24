module Tokenizer

	class Tokenizer
		
	@lang
	WL = /\s+/
		def initialize(lang = :de)
			@lang = lang
		end
		
		def tokenize(str)
			
			tokens = str.split(WL)
			
			tokens
		end
	end
end