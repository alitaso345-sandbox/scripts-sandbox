require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'thor'
end


class Test < Thor
  desc 'example', 'an example task'
  def example
    puts "I'm a thor task"
  end
end

# thor list
# test
# ----
# thor test:example  # an example task

# thor test:example
#=> I'm a thor task
