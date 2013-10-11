class Towers
  RIGHT = 1
  LEFT = -1

  def initialize n
    @n = n
    @pegs = [n.downto(1).to_a, [], []]
    @tip = 0
  end

  def finished?
   pegs.last.length == n
  end

  def state
    pegs
  end

  def next_step steps
    steps.even? ? move_tip : move_other
  end

  private
  attr_reader :pegs, :n

  def move_tip
    move @tip, next_tip
    @tip = next_tip
  end

  def move from, to
    pegs[to].push pegs[from].pop
  end

  def next_tip
    (@tip + direction) % 3
  end

  def direction
    disks_even? ? RIGHT : LEFT
  end

  def disks_even?
    n % 2 == 0
  end

  def move_other
    move(*other_from_to)
  end

  def other_from_to
    from = index_of_minimum_in others
    to = pegs.find_index { |peg| possible_next? peg, from }
    [from, to]
  end

  def index_of_minimum_in arr
    arr.each_with_index.min.last
  end

  def others
    pegs.map { |peg| not_other?(peg) ? Float::INFINITY : peg.last }
  end

  def not_other? peg
    peg.empty? || is_tip?(peg)
  end

  def is_tip? peg
    peg.last == 1
  end

  def possible_next? peg, from
    peg != pegs[from] && !is_tip?(peg)
  end
end
