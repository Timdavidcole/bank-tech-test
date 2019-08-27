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
