# frozen_string_literal: true

require_relative './statement.rb'
require 'date'

class Bank
  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions.push([amount, Date.today])
  end

  def withdraw(amount)
    @balance -= amount
    @transactions.push([(amount * -1), Date.today])
  end

  def show_balance
    format('%.2f', @balance)
  end

  def return_statement(statement = Statement)
    statement.create(@balance, @transactions)
  end
end

# bank = Bank.new
# bank.deposit(30)
# bank.deposit(40)
# bank.withdraw(50)
# bank.withdraw(50)
# puts bank.show_balance
# puts bank.return_statement
