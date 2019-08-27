require 'statement.rb'

class Bank

  def initialize()
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date)
    @balance += amount
    @transactions.push([amount, date])
  end

  def withdraw(amount, date)
    @balance -= amount
    @transactions.push([(amount * -1), date])
  end

  def show_balance
    @balance
  end

  def return_statement(statement = Statement)
    statement.create(@balance, @transactions)
  end

end
