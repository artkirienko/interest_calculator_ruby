class Loan
  attr_reader :name, :amount
  attr_accessor :payments

  def initialize(name:, amount:, tariff:)
    @name = name
    @amount = amount
    @tariff = tariff
    @payments = []
  end

  def term
    @tariff.term
  end

  def interest
    @tariff.interest
  end

  def overdue_interest
    @tariff.overdue_interest
  end

  def monthly_base
    1.0 * amount / term
  end

  def monthly_interest
    1.0 * amount * interest / 12
  end

  def monthly_overdue_interest
    1.0 * amount * overdue_interest / 12
  end

  def monthly_total
    monthly_base + monthly_interest
  end

  def total
    1.0 * monthly_total * term
  end

  def payed_interest
    payments.inject(0.0) {|sum, payment| sum += payment.interest}
  end

  def payed_base
    payments.inject(0.0) {|sum, payment| sum += payment.base}
  end

  def payed_annual_interest
    1.0 * payed_interest / payed_base * 12 / term
  end
end
