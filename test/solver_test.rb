require 'test_helper'
require 'solver'
require 'towers'

module SolverInterfaceTest
  def test_state
    assert_respond_to subject, :state
  end

  def test_next_to
    assert_respond_to subject, :next_step
  end

  def test_solve
    assert_respond_to subject, :solve
  end
end

class SolverTest < Minitest::Test
  include SolverInterfaceTest

  def setup
    @solver = Solver.new Towers.new 5
  end

  def subject
    @solver
  end

  def test_moves_one_step_at_a_time
    subject.next_step
    subject.next_step
    subject.next_step
    assert_equal [[5, 4, 3], [2, 1], []], subject.state
  end

  def test_solves_the_problem
    subject.solve
    assert_equal [[], [], [5, 4, 3, 2, 1]], subject.state
  end
end
