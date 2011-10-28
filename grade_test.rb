require "test/unit"
require './grade'

class GradeTest < Test::Unit::TestCase
  
  def test_a_eq_A
    a1 = Grade.new("a")
    a2 = Grade.new("A")
    assert_equal(a1,a2)
  end
  
  def test_a_gt_aminus
    a = Grade.new("A")
    a_minus = Grade.new("A-")
    assert(a > a_minus)
  end
  
  def test_a_lt_aplus
    a = Grade.new("A")
    a_plus = Grade.new("A+")
    assert(a < a_plus)
  end
  
  def test_aminus_gt_bplus
    a_minus = Grade.new("A-")
    b_plus = Grade.new("B+")
    assert(a_minus > b_plus)
  end
  
  def test_a_gt_b
    a = Grade.new("A")
    b = Grade.new("B")
    assert(a > b)
  end
  
  def test_sort
    assert_equal("F-, D+, C-, C, B, B+, A-, A", ["C", "A", "F-", "B", "C-", "D+", "A-", "B+"].collect { |letter| Grade.new(letter) }.sort.join(", "))  
  end
  
end