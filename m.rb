require 'singleton'

module A

  def self.included(mod)
    mod.extend B
    mod.class_eval do
      hello
    end
    puts "#{mod} included #{self}"
  end

  module B
    def hello
      puts 'hello'
    end
  end

  def hey
    'hey'
  end
end

class Sample
  include A
  include Singleton
end

pp Sample.hello

