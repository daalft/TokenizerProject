lib_path = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib_path) unless $LOAD_PATH.include?(lib_path)

require 'tokenizer/version'
require 'rake'

Gem::Specification.new do |s|
  s.name = "TokenizerProjectUT"
  s.summary = 'Tokenizer is a linguistic tool intended to split a text into tokens.'
  s.description = 'A simple multilingual tokenizer for NLP tasks. This tool provides a CLI and a library for linguistic tokenization which is an anavoidable step for many HLT (human language technology) tasks in the preprocessing phase for further syntactic, semantic and other higher level processing goals. Use it for tokenization of German, English and French texts.'
  s.rubyforge_project = "tokenizer"
  s.version = Tokenizer::VERSION
  s.author = "David Alfter"
  s.email = "s2daalft@uni-trier.de"
  s.executables << 'tokenize'
  s.extra_rdoc_files = FileList['*.rdoc'].to_a
   s.files = FileList['lib/**/*.rb',
                     'README.rdoc',
                     'LICENSE.rdoc',
                     'CHANGELOG.rdoc',
                     'test/**/*',
                     'bin/*'].to_a
  s.test_files = FileList['test/**/*'].to_a
end
