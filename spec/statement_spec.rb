require 'statement.rb'

describe Statement do

  describe "#create" do
    it "returns a statement string" do
      expect(Statement.create(2500, [[1000, "14/01/2012"], [2000, "13/01/2012"], [-500, "14/01/2012"]])).to eq (["date || credit || debit || balance", "14/01/2012 || || 500 || 2500", "13/01/2012 || 2000 || || 3000", "14/01/2012 || 1000 || || 1000"])
    end
  end

  describe "#return_statement" do
    it "creates the statement array" do
      statement = Statement.new(2500, [[1000, "14/01/2012"], [2000, "13/01/2012"], [-500, "14/01/2012"]])
      expect(statement.return_statement).to eq (["date || credit || debit || balance", "14/01/2012 || || 500 || 2500", "13/01/2012 || 2000 || || 3000", "14/01/2012 || 1000 || || 1000"])
    end
  end

end
