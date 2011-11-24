require 'rake/clean'

CLOBBER.include('rdoc')

require 'rdoc/task'

RDoc::Task.new do |rdoc|
rdoc.rdoc_dir = 'rdoc'
end

desc 'This is a method for generating documentation.'
task :doc => [:clobber, :rdoc]