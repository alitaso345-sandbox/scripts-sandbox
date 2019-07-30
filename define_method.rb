class A
  def fred
    puts "In Fred"
  end

  def create_method(name, &block)
    self.class.define_method(name, &block)
  end
  define_method(:wilma) { puts "Charge it!" }
end

class B < A
  define_method(:barney, instance_method(:fred))
end

a = B.new
a.barney
a.wilma
a.create_method(:betty) { p self }
a.betty

class Foo
  def self.define_many_methods
    proc = -> { puts Time.now }
    %w(foo bar buzz).each { |name| define_method(name, proc) }
  end
end

Foo.define_many_methods
Foo.new.foo

class Thing
end

a = %q{def hello() "Hello there" end}
Thing.module_eval(a)
puts Thing.new.hello()

class Hoge
  def hoge
    fuga = 'hoge'

    self.class.define_method(:fuga) do
      puts fuga
    end
  end
end

p Hoge.new.hoge
Hoge.new.fuga

# クラスメソッドを定義できる方法1
class C
  class << self
    def class_name
      to_s
    end
  end
end

C.define_singleton_method(:who_am_i) do
  "I am: #{class_name}"
end
puts C.who_am_i
puts C.singleton_methods
