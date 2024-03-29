# frozen_string_literal: true

require 'date'

class Statement
  def self.create(balance, transactions)
    Statement.new(balance, transactions).return_statement
  end

  def initialize(balance, transactions)
    @balance = balance
    @transactions = transactions
    @statement = []
  end

  def return_statement
    format_header
    format_statement
    @statement
  end

  private

  def format_statement
    @transactions.reverse_each do |transaction|
      if transaction[0].negative?
        @statement.push(withdrawal(transaction))
      else
        @statement.push(deposit(transaction))
      end
      change_balance(transaction[0])
    end
  end

  def withdrawal(transaction)
    "#{date(transaction)} || || #{format('%.2f', (transaction[0] * -1))} || #{balance}"
  end

  def deposit(transaction)
    "#{date(transaction)} || #{format('%.2f', transaction[0])} || || #{balance}"
  end

  def date(transaction)
    transaction[1].strftime('%e/%m/%Y')
  end

  def balance
    format('%.2f', @balance)
  end

  def change_balance(transaction)
    @balance -= transaction
  end

  def format_header
    @statement.push('date || credit || debit || balance')
  end
end
