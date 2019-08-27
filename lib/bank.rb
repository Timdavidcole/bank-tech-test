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

  def print_statement
    print_transactions
  end

  private

  def print_transactions
    statement_balance = @balance
    statement = []
    statement.push(statement_header)
    @transactions.reverse_each do |transaction|
      if transaction[0] < 0
        statement.push("#{transaction[1]} || || #{transaction[0]*-1} || #{statement_balance}")
        statement_balance -= transaction[0]
      else
        statement.push("#{transaction[1]} || #{transaction[0]} || || #{statement_balance}")
        statement_balance -= transaction[0]
      end
    end
    statement
  end

  def statement_header
    "date || credit || debit || balance"
  end

end

bank = Bank.new
bank.deposit(1000, '14/01/2012')
bank.deposit(2000, '13/01/2012')
bank.withdraw(500, '14/01/2012')
puts bank.print_statement
