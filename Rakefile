require 'rake/clean'
require 'rake'

CLOBBER.include('rdoc')

require 'rdoc/task'

RDoc::Task.new do |rdoc|
	rdoc.rdoc_dir = 'rdoc'
end

desc 'This is a method for generating documentation.'
task :doc => [:clobber, :rdoc]

#Testing
require 'rake/testtask'
Rake::TestTask.new do |t|
	t.test_files = FileList['test/*.rb']
end