require "test_helper"

class PaymentTest < Minitest::Test
  def setup
    @payment = Payment.new(
      interest: 300.12,
      base:     1000.65
    )
  end

  def test_has_attributes
    assert_equal @payment.base, 1000.65
    assert_equal @payment.interest, 300.12
    assert_equal @payment.total, 1000.65 + 300.12
  end

  def test_correct_total
    assert_equal @payment.total, 1000.65 + 300.12
  end
end
