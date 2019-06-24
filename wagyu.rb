require 'wagyu'

io = open('fact.wasm')
instance = Wagyu::Wasm::instantiate_streaming(io)
result = instance.exports.fact(10)
p result # => 3628800



