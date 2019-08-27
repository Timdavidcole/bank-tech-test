# frozen_string_literal: true

require 'bank.rb'
require 'Timecop'

describe Bank do

  before do
    Timecop.freeze(Time.local(1999, 12, 31,))
  end

  # As a user,
  # So that I can see how much money I have,
  # I want to be able to view my balance.

  describe '#show_balance' do
    it 'allows a user to view their balance' do
      expect(subject.show_balance).to eq 0
    end
  end

  # As a user,
  # So that I can keep my money safe,
  # I want to be able to deposit money.

  describe '#deposit' do
    it 'allows a user to deposit money' do
      subject.deposit(1000)
      expect(subject.show_balance).to eq 1000
    end
  end

  # As a user,
  # So that I can spend my money,
  # I want to be able to withdraw money.

  describe '#withdraw' do
    it 'allows a user to withdraw money' do
      subject.withdraw(500)
      expect(subject.show_balance).to eq(-500)
    end
  end

  # As a user,
  # So that I can get an overview of my account,
  # I want to be able to print my statement.

  describe '#return_statement' do
    it 'runs' do
      statement_class = double(:statement_class)
      allow(statement_class).to receive(:create).and_return(true)
      expect(subject.return_statement(statement_class)).to eq true
    end

    it 'allows a user to view all transactions' do
      statement = [
        'date || credit || debit || balance',
        '31/12/1999 || || 500 || 2500',
        '31/12/1999 || 2000 || || 3000',
        '31/12/1999 || 1000 || || 1000'
      ]
      subject.deposit(1000)
      subject.deposit(2000)
      subject.withdraw(500)
      expect(subject.return_statement).to eq statement
    end

    it 'another statement check' do
      statement = [
        'date || credit || debit || balance',
        '31/12/1999 || || 872 || 8386',
        '31/12/1999 || || 742 || 9258',
        '31/12/1999 || 3000 || || 10000',
        '31/12/1999 || 7000 || || 7000'
      ]
      subject.deposit(7000)
      subject.deposit(3000)
      subject.withdraw(742)
      subject.withdraw(872)
      expect(subject.return_statement).to eq statement
    end
  end
end
