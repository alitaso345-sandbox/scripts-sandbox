class Foo
  def foo(arg)
    "foo called with arg #{arg}"
  end
end

m = Foo.new.method(:foo)
p m
p m.call(1)

pr = Proc.new {|arg| "proc called with arg #{arg}"}
p pr
p pr.call(1)

