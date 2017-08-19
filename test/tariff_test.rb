require "test_helper"

class TariffTest < Minitest::Test
  def setup
    @tariff = Tariff.new(
      term: 6,
      interest: 0.3,
      overdue_interest: 0.5
    )
  end

  def test_has_attributes
    assert_equal @tariff.term, 6
    assert_equal @tariff.interest, 0.3
    assert_equal @tariff.overdue_interest, 0.5
  end
end
