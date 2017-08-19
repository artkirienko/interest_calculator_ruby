class Tariff
  attr_reader :term, :interest, :overdue_interest

  def initialize(term:, interest:, overdue_interest:)
    @term = term
    @interest = interest
    @overdue_interest = overdue_interest
  end
end
