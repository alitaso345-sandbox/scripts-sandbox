p ObjectSpace.each_object.inject(Hash.new(0)) {|h, o|h[o.class] +=1; h }
