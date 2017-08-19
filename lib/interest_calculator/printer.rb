class Printer
  def initialize(calculator)
    @calculator = calculator
  end

  def print_loan(loan)
    puts "*** #{loan.name} ***"
    puts "Сумма:                    #{loan.amount}"
    puts "Срок:                     #{loan.term}"
    puts "Ставка годовых:           #{loan.interest * 100}%"
    puts "Ставка при просрочке:     #{loan.overdue_interest * 100}%"; puts

    puts "Ежемесячный по долгу:     #{loan.monthly_base.round(2)}"
    puts "Ежемесячный по процентам: #{loan.monthly_interest.round(2)}"
    puts "Общий ежемесячный:        #{loan.monthly_total.round(2)}"
    puts "Сумма выплаты:            #{loan.total.round(2)}"; puts

    loan.payments.each.with_index(1) do |payment, i|
      puts "Выплата месяц #{i}:          #{payment.total.round(2)}"
    end; puts

    puts "Выплачено %:              #{loan.payed_interest.round(2)}"
    puts "Выплачено ОД:             #{loan.payed_base.round(2)}"
    puts "Доходность годовых:       #{(loan.payed_annual_interest * 100).round(2)}%"
  end

  def print_calculator
    @calculator.loans.each {|loan| print_loan(loan); puts}
    puts '*** ИТОГО ***'
    puts "Годовая доходность реалистично:  #{(@calculator.annual_realistic * 100).round(2)}%"
    puts "Годовая доходность оптимистично: #{(@calculator.annual_optimistic * 100).round(2)}%"
  end
end
