require "test_helper"

class LoanTest < Minitest::Test
  def setup
    @tariff = Tariff.new(term: 6, interest: 0.3, overdue_interest: 0.5)
    @loan = Loan.new(name: 'ЮЛ-1', amount: 1_000_000, tariff: @tariff)
    @payment = Payment.new(
      interest: @loan.monthly_interest,
      base:     @loan.monthly_base
    )
    @loan.payments = [@payment, @payment, @payment, @payment, @payment, @payment]
  end

  def test_loan_has_tariff_attributes
    assert_equal @loan.term, @tariff.term
    assert_equal @loan.interest, @tariff.interest
    assert_equal @loan.overdue_interest, @tariff.overdue_interest
  end

  def test_monthly_base
    assert_equal @loan.monthly_base, (1.0 * @loan.amount / @loan.term)
  end

  def test_monthly_interest
    assert_equal @loan.monthly_interest, (1.0 * @loan.amount * @loan.interest / 12)
  end

  def test_monthly_overdue_interest
    assert_equal @loan.monthly_overdue_interest, (1.0 * @loan.amount * @loan.overdue_interest / 12)
  end

  def test_monthly_total
    assert_equal @loan.monthly_total, (@loan.monthly_base + @loan.monthly_interest)
  end

  def test_total
    assert_equal @loan.total, (1.0 * @loan.monthly_total * @loan.term)
  end

  def test_payed_interest
    assert_equal @loan.payed_interest, (@loan.payments.inject(0.0) {|sum, payment| sum += payment.interest})
  end

  def test_payed_base
     assert_equal @loan.payed_base, (@loan.payments.inject(0.0) {|sum, payment| sum += payment.base})
  end

  def test_payed_annual_interest
     assert_equal @loan.payed_annual_interest, (1.0 * @loan.payed_interest / @loan.payed_base * 12 / @loan.term)
  end
end
