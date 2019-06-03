require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'activesupport'
end

require 'active_support/core_ext/class/subclasses'

class C; end
p C.descendants

class B < C; end
p C.descendants

class A < B; end
p C.descendants
