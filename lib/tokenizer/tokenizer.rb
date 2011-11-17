module Tokenizer

	class Tokenizer
		@lang
		def initialize(lang = :de)
			@lang = lang
		end
		
		def tokenize(str)
			tokens = []
			tokens = str.split(/\s+/)
			tokens
		end
	end
end