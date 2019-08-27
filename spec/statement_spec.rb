# frozen_string_literal: true

require_relative '../lib/statement.rb'

describe Statement do
  statement_array = [
    'date || credit || debit || balance',
    '14/01/2012 || || 500.00 || 2500.00',
    '13/01/2012 || 2000.00 || || 3000.00',
    '10/01/2012 || 1000.00 || || 1000.00'
  ]
  balance = 2500

  before(:each) do
    time1 = double(:time1)
    allow(time1).to receive(:strftime).and_return('10/01/2012')
    time2 = double(:time2)
    allow(time2).to receive(:strftime).and_return('13/01/2012')
    time3 = double(:time3)
    allow(time3).to receive(:strftime).and_return('14/01/2012')
    @transactions = [
      [1000, time1],
      [2000, time2],
      [-500, time3]
    ]
  end

  describe '#create' do
    it 'returns a statement array' do
      expect(Statement.create(balance, @transactions)).to eq statement_array
    end
  end

  describe '#return_statement' do
    it 'creates the statement array' do
      statement = Statement.new(balance, @transactions)
      expect(statement.return_statement).to eq statement_array
    end
  end
end
