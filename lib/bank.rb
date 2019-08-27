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
    @transactions.push([amount, date_today])
  end

  def withdraw(amount)
    @balance -= amount
    @transactions.push([(amount * -1), date_today])
  end

  def show_balance
    @balance
  end

  def return_statement(statement = Statement)
    statement.create(@balance, @transactions)
  end

  private

  def date_today
    Date.today.strftime("%e/%m/%Y")
  end
end
