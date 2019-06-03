require 'objspace'

ObjectSpace.trace_object_allocations_start
foo = ["foo"] * 255
ObjectSpace.trace_object_allocations_stop

trace_file = File.basename(__FILE__) # object_space.rb
ObjectSpace.each_object do |o|
  file = ObjectSpace.allocation_sourcefile(o)
  next unless file == trace_file # 今回は本ファイルのみを追う
  line = ObjectSpace.allocation_sourceline(o)
  memsize = ObjectSpace.memsize_of(o)
  klass = o.class
  puts "#{memsize} #{file}:#{line}:#{klass}"
end
ObjectSpace.trace_object_allocations_clear

#=>
# 2080 object_space.rb:4:Array
# 40 object_space.rb:4:Array
# 40 object_space.rb:4:String
