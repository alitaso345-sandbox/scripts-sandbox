class Bar
  def Bar.callback
    proc do
      puts "bar"
    end
  end

  def initialize
    ObjectSpace.define_finalizer(self, Bar.callback)
  end
end
Bar.new
GC.start
