require 'bank.rb'
require 'Timecop'

describe Bank do

  before do
    Timecop.freeze(Time.local(1999, 12, 31,))
  end

  describe "a user can deposit money" do


  end
  it 'allows a user to view all transactions' do
    statement = [
      "date || credit || debit || balance",
      "31/12/1999 || || 500.00 || 2500.00",
      "31/12/1999 || 2000.00 || || 3000.00",
      "31/12/1999 || 1000.00 || || 1000.00"
    ]
    subject.deposit(1000)
    subject.deposit(2000)
    subject.withdraw(500)
    expect(subject.return_statement).to eq statement
  end

  it 'another statement check' do
    statement = [
      "date || credit || debit || balance", 
      "31/12/1999 || || 872.00 || 8386.00",
      "31/12/1999 || || 742.00 || 9258.00", "31/12/1999 || 3000.00 || || 10000.00",
      "31/12/1999 || 7000.00 || || 7000.00"
    ]
    subject.deposit(7000)
    subject.deposit(3000)
    subject.withdraw(742)
    subject.withdraw(872)
    expect(subject.return_statement).to eq statement
  end

end
