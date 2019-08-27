# frozen_string_literal: true

require './statement.rb'

describe Statement do

  statement_array = [
    'date || credit || debit || balance',
    '14/01/2012 || || 500 || 2500',
    '13/01/2012 || 2000 || || 3000',
    '14/01/2012 || 1000 || || 1000'
  ]
  balance = 2500
  transactions = [
    [1000, '14/01/2012'],
    [2000, '13/01/2012'],
    [-500, '14/01/2012']
  ]

  describe '#create' do
    it 'returns a statement array' do
      expect(Statement.create(balance, transactions)).to eq statement_array
    end
  end

  describe '#return_statement' do
    it 'creates the statement array' do
      statement = Statement.new(balance, transactions)
      expect(statement.return_statement).to eq statement_array
    end
  end
end
