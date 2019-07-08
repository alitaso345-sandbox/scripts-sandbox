class Foo
  def foo() "foo" end
  def bar() "bar" end
  def baz() "baz" end
end

obj = Foo.new

# 任意のキーとメソッドの関係をハッシュに保持しておく
methods = {
  1 => obj.method(:foo),
  2 => obj.method(:bar),
  3 => obj.method(:baz)
}

# キーを使って関連するメソッドを呼び出す
p methods[1].call
p methods[2].call
p methods[3].call
