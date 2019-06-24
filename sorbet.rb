# typed: true
require 'sorbet-runtime'

class Main
  extend T::Sig

  sig {void}
  def self.main
    puts 'Hello, World'
  end
end

Main.main
