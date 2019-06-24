# typed: true
require 'sorbet-runtime'

module A; end
module B; end

def x
  rand.round == 0 ? A : B
end

class Main
  include x
end

# sorbet.rb:12: include must only contain constant literals https://srb.help/4002
#     12 |  include x
