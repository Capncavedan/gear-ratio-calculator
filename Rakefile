require 'rspec/core/rake_task'
require 'rubygems'
require 'bundler/setup'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = "--color"
end

task :default => [:spec]
