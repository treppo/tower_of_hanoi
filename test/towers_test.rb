require 'towers'

class TowerOfHanoiTest < Minitest::Test
  def setup
    @tower = TowerOfHanoi.new 5
  end

  def subject
    @tower
  end
end
