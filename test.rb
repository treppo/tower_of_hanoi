require 'minitest/autorun'
require_relative 'tower_of_hanoi'

module TowerOfHanoi
  class SolverTest < Minitest::Test
    def setup
      @solver = Solver.new 5
    end

    def subject
      @solver
    end

    def test_shows_state
      assert_respond_to subject, :state
    end

    def test_shows_state_at_steps
      assert_equal [[5, 4, 3], [2, 1], []], subject.state_at_step(3)
    end

    def test_solves_the_problem
      subject.solve
      assert_equal [[], [], [5, 4, 3, 2, 1]], subject.state
    end
  end
end
