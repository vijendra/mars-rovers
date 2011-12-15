require 'rubygems'
require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = Dir['test/**/*_test.rb']
  t.verbose = true
end

desc "To run the mars rover"
task :run do
  ruby "mars_rover.rb"
end
