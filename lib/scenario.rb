require_relative 'interest_calculator'

tariff = Tariff.new(term: 6, interest: 0.3, overdue_interest: 0.5)

first_loan = Loan.new(name: 'ЮЛ-1', amount: 1_000_000, tariff: tariff)
first_loan.payments = [
  Payment.new(
    interest: first_loan.monthly_interest,
    base:     first_loan.monthly_base
  ),
  Payment.new(
    interest: first_loan.monthly_interest,
    base:     first_loan.monthly_base
  ),
  Payment.new(
    interest: first_loan.monthly_interest,
    base:     first_loan.monthly_base
  ),
  Payment.new(
    interest: first_loan.monthly_interest,
    base:     first_loan.monthly_base
  ),
  Payment.new(
    interest: first_loan.monthly_interest,
    base:     first_loan.monthly_base
  ),
  Payment.new(
    interest: first_loan.monthly_interest,
    base:     first_loan.monthly_base
  )
]

second_loan = Loan.new(name: 'ЮЛ-2', amount: 1_000_000, tariff: tariff)
second_loan.payments = [
  Payment.new(
    interest: second_loan.monthly_interest,
    base:     second_loan.monthly_base
  ),
  Payment.new(
    interest: second_loan.monthly_interest,
    base:     second_loan.monthly_base
  ),
  Payment.new(
    interest: second_loan.monthly_interest,
    base:     second_loan.monthly_base
  ),
  Payment.new(
    interest: second_loan.monthly_interest,
    base:     second_loan.amount - second_loan.monthly_base * 3
  ),
  Payment.new(
    interest: 0.0,
    base:     0.0
  ),
  Payment.new(
    interest: 0.0,
    base:     0.0
  )
]

third_loan = Loan.new(name: 'ЮЛ-3', amount: 1_000_000, tariff: tariff)
third_loan.payments = [
  Payment.new(
    interest: third_loan.monthly_interest,
    base:     third_loan.monthly_base
  ),
  Payment.new(
    interest: third_loan.monthly_interest,
    base:     third_loan.monthly_base
  ),
  Payment.new(
    interest: third_loan.monthly_overdue_interest,
    base:     third_loan.monthly_base
  ),
  Payment.new(
    interest: third_loan.monthly_overdue_interest,
    base:     third_loan.monthly_base
  ),
  Payment.new(
    interest: third_loan.monthly_overdue_interest,
    base:     third_loan.monthly_base
  ),
  Payment.new(
    interest: third_loan.monthly_overdue_interest,
    base:     third_loan.monthly_base
  )
]

puts 'Будет четвёртое юрлицо? (y/n)'
if gets.chomp == 'y'
  puts 'Введите сумму для ЮЛ-4:'
  amount = gets.chomp.to_i

  fourth_loan = Loan.new(name: 'ЮЛ-4', amount: amount, tariff: tariff)

  fourth_loan.payments = (1..tariff.term).map do |i|
    puts "Введите выплату за #{i}-ый месяц по процентам"
    interest = gets.chomp.to_f
    puts "Введите выплату за #{i}-ый месяц по ОД"
    base = gets.chomp.to_f
    Payment.new(interest: interest, base: base)
  end

  loans = [first_loan, second_loan, third_loan, fourth_loan]
else
  loans = [first_loan, second_loan, third_loan]
end

calculator = InterestCalculator.new
calculator.loans = loans
printer = Printer.new(calculator)
printer.print_calculator
