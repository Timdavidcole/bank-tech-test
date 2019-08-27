require 'bank.rb'

describe Bank do

  # As a user,
  # So that I can see how much money I have,
  # I want to be able to view my balance.

  describe "#show_balance" do
    it "allows a user to view their balance" do
      expect(subject.show_balance).to eq 0
    end
  end

# As a user,
# So that I can keep my money safe,
# I want to be able to deposit money.

  describe "#deposit" do
    it "allows a user to deposit money" do
      subject.deposit(200)
      expect(subject.show_balance).to eq 200
    end
  end

  # As a user,
  # So that I can spend my money,
  # I want to be able to withdraw money.

  describe "#deposit" do
    it "allows a user to withdraw money" do
      subject.withdraw(200)
      expect(subject.show_balance).to eq -200
    end
  end

  # As a user,
  # So that I can get an overview of my account,
  # I want to be able to print my statement.

  describe "#print_statement" do
    it "allows a user to view all transactions" do
      subject.withdraw(200)
      expect(subject.show_balance).to eq -200
    end
  end

end

# As a user,
# So that I can get an overview of my account,
# I want to be able to print my statement.
