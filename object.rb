class Foo
  def foo() "foo" end
  def bar() "bar" end
  def baz() "baz" end
end

obj = Foo.new

# 任意のキーとメソッドの関係をハッシュに保持しておく
methods = {
  1 => :foo,
  2 => :bar,
  3 => :baz
}

# レシーバを固定させる必要がないなら、Object#sendを使う方法もある
p Foo.new.send(methods[1])
p Foo.new.send(methods[2])
p Foo.new.send(methods[3])
