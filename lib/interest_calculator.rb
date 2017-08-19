$LOAD_PATH.unshift File.expand_path("../", __FILE__)

require 'interest_calculator/tariff'
require 'interest_calculator/loan'
require 'interest_calculator/payment'
require 'interest_calculator/printer'

class InterestCalculator
  attr_accessor :loans

  def initialize
    @loans = []
  end

  def annual_realistic
    payed_interest = loans.inject(0.0) {|sum, loan| sum += loan.payed_interest}
    payed_base = loans.inject(0.0) {|sum, loan| sum += loan.payed_base}
    1.0 * payed_interest / payed_base / loans.first.term * 12
  end

  def annual_optimistic
    annual_interest = loans.inject(0.0) {|sum, loan| sum += (loan.monthly_interest * loan.term)}
    annual_base = loans.inject(0.0) {|sum, loan| sum += (loan.monthly_base * loan.term)}
    1.0 * (annual_interest) / (annual_base) / loans.first.term * 12
  end
end
