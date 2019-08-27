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
      if transaction[0] < 0
        @statement.push("#{transaction[1]} || || #{transaction[0]*-1} || #{@balance}")
        change_balance(transaction[0])
      else
        @statement.push("#{transaction[1]} || #{transaction[0]} || || #{@balance}")
        change_balance(transaction[0])
      end
    end
  end

  def change_balance(transaction)
    @balance -= transaction
  end

  def format_header
    @statement.push("date || credit || debit || balance")
  end

end
