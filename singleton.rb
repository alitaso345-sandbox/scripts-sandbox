require 'singleton'

class SomeSingletonClass
  include Singleton
end

a = SomeSingletonClass.instance
b = SomeSingletonClass.instance

p [a, b]

a = SomeSingletonClass.new # private method `new' called for SomeSingletonClass:Class (NoMethodError)
