class Payment
  attr_reader :base, :interest, :total

  def initialize(base:, interest:)
    @base = base
    @interest = interest
  end

  def total
    base + interest
  end
end
