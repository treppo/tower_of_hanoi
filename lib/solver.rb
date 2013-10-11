class Solver
  def initialize towers
    @towers = towers
    @steps = 0
  end

  def solve
    @steps = 0
    until towers.finished?
      towers.next_step @steps
      @steps += 1
    end
  end

  def state
    towers.state
  end

  def next_step
    towers.next_step @steps
    @steps += 1
  end

  private
  attr_reader :towers
end
