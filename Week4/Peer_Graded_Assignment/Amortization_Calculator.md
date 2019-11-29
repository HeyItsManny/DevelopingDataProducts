Amortization Calculator
========================================================
author: Manny Ruiz
date:  2019-11-29
autosize: true

Context
========================================================

The accompanying application to this slideset uses R Shiny to create a mortgage amoritization calculator. <br>
The applicaiton has the following features:

- Parameter based inputs for loan amount, APR and length of the loan. 
- A calculation to determine the monthly payments.
- A data table provides a breakdown of monthly principal, interest and loan balance.
- A plot showing principal and interest amounts over time.

Application Links
========================================================
- The application code is stored in github at 
- The application can be found at
- Logic for the calculation can be found at https://en.wikipedia.org/wiki/Annuity

Montlhy Payment Calculation
========================================================
In the code example below we take the given parameters:

- APR of 3.5% 
- Term of 30 years
- Loan of $200,000


```r
# calculate monthly rate
monthly_rate = 3.5 / 100 / 12

# calculate monthly payment amount
r = (1 + monthly_rate) ^ 360 - 1
payment = 200000 * monthly_rate * (r + 1) / r

payment 
```

```
[1] 898.0894
```

Application Benefits
========================================================

The mortgage amoritization calculator provides borrowers with method to determine:

- How much they will have to pay monthly.
- How much of the payment actually goes to the principal loan amount vs the interest charged by the bank to borrow the money. 
- How changing the relivant parameters can impact the load amount, length of loan and amount of interest paid. 

