# Bank Tech Test

## Description

- This was tech interview practise test for Makers Bootcamp.  The idea was to complete a command line only program, which offered simple banking functionality.

## My approach

- I decided to TDD as much as possible.  Using ruby with rspec.
- One of my main aims was not to make it too complicated or go off spec, as I have done in the past.  So I've not taken any leaps of faith and just implemented what they asked for
- Started off by making the Bank class, which started to get a little cumbersome, so refactored in a Statement class to do the heavy lifting there.  Found it hard to TDD the new class.
- I think I should have planned more, as I probably would have made a Statement class from the beginning if so.  But in the past I have tended to over OOP, and over plan, so this forces me to only do it when necessary.
- I end up using Timecop, a pretty handy gem that hard sets the Time.now method in ruby for testing.
- There was a fair bit of debate in our cohort as to wether to make 2 or 3 classes, ie extract out a transaction class.  Personally I was against it because I did really see the point of making a class with no functionality, that's just a glorified relational data row.  Much quicker and easier to make the information an array.  Obviously if we started needing a more CRUD like capability for each transaction it would definitely be worth refactoring out a new class.

## Techstack

```
Ruby 2.6.3
Rspec 3.8
Rubocop 0.74.0
simplecov 0.17.0
timecop 0.9.1
```

## Installation

To install
```
git clone git@github.com:Timdavidcole/bank-tech-test.git
cd bank-tech-test
gem install bundler
bundle install
## to run tests
rspec
## to run program
IRB
require './lib/bank.rb'
```

To use

```
bank = Bank.new ## creates new bank account
bank.deposit(amount) ## deposits money
bank.withdraw(amount) ## withdraws money
print bank.show_balance ## prints current balance to console
puts bank.return_statement ## prints statement to console
```

Example usage

```
irb(main):001:0> require './lib/bank.rb'
=> true
irb(main):002:0> bank = Bank.new
=> #<Bank:0x00007f8f2791f3a8 @balance=0, @transactions=[]>
irb(main):003:0> bank.deposit(30)
=> [[30, #<Date: 2019-08-27 ((2458723j,0s,0n),+0s,2299161j)>]]
irb(main):004:0> bank.deposit(40)
=> [[30, #<Date: 2019-08-27 ((2458723j,0s,0n),+0s,2299161j)>], [40, #<Date: 2019-08-27 ((2458723j,0s,0n),+0s,2299161j)>]]
irb(main):005:0> bank.withdraw(20)
=> [[30, #<Date: 2019-08-27 ((2458723j,0s,0n),+0s,2299161j)>], [40, #<Date: 2019-08-27 ((2458723j,0s,0n),+0s,2299161j)>], [-20, #<Date: 2019-08-27 ((2458723j,0s,0n),+0s,2299161j)>]]
irb(main):006:0> print bank.show_balance
50.00=> nil
irb(main):008:0> puts bank.return_statement
date || credit || debit || balance
27/08/2019 || || 20.00 || 50.00
27/08/2019 || 40.00 || || 70.00
27/08/2019 || 30.00 || || 30.00
=> nil
```

## Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see...

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00

## User Stories

```
As a user,
So that I can keep my money safe,
I want to be able to deposit money.
```

```
As a user,
So that I can spend my money,
I want to be able to withdraw money.
```

```
As a user,
So that I can see how much money I have,
I want to be able to view my balance.
```

```
As a user,
So that I can get an overview of my account,
I want to be able to print my statement.
```
