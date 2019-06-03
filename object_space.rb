require 'objspace'

ObjectSpace.memsize_of({a: 4})
#=> 232

ObjectSpace.memsize_of(123)
#=> 0

ObjectSpace.memsize_of('123')
#=> 40
