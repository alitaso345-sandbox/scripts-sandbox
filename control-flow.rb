class Controls
  def _if(condition, then_proc, &else_block)
    if condition
      then_proc.call
    elsif else_block
      yield else_block
    else
      -1
    end
  end

  def _loop(&block)
    while true
      depth = yield block
      next if depth == 0

      return depth
    end
  end

  def _block(&block)
    yield block
  end

  def test1
    a = 0
    depth = _block{
      depth = _loop{
        depth = _if(a == 0, ->{
          a = 2
          next 1
          -1
        }){
          a = 3
          -1
        }
        next depth - 1 if depth > 0
        -1
      }
      next depth - 1 if depth > 0
      -1
    }
    a
  end

  def test2
    depth = _loop{
      depth = _loop{
        next 2
        p 'inside loop'
      }
      p 'outside loop'
      next depth - 1 if depth > 0
    }
    p 'hello'
  end
end

c = Controls.new
c.test2
