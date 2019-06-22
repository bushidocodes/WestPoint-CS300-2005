# Problem Statement

## BACKGROUND:

You have been hired to develop a program for the newly reopened West Point Train Station. Authorities are considering a new passenger train service along the west side of the Hudson River, and they are starting with a 3-stop line connecting Newburg, West Point, and Nyack. Eventually, the line will be extended to Albany and New York City, and a highly sophisticated train sensing and ticketing system (compatible with the other Metro stations) will be put into service. However, right now the West Point Train Station needs a temporary system with a few basic features. This system will be used by the cashier, as she conducts transactions with customers and observes arrivals of trains at the West Point station.

## FUNCTIONAL REQUIREMENTS:

The system that you will design, implement, and test will be a text-based terminal driven by a menu. The menu (displayed as soon as the program is started) must allow the cashier to select from several possible actions:

1. Sell tickets to Newburg
2. Sell tickets to Nyack
3. Process train departure
4. Check tickets remaining
5. View total sales
6. Quit this program

From the West Point station, tickets to Newburg cost $3.50 and tickets to Nyack cost $5.25. The cashier will use menu choices #1 and #2 to conduct the sales transaction. To start the sales transaction, the cashier will need to enter the number of tickets that the customer wants to purchase. The system will then display the total price for the tickets. Next, the cashier will enter the total paid by the customer and the system will specify the change due to the customer in dollars, quarters, dimes, nickels, and pennies or show a message “Exact price paid.” Once the sales transaction is complete, the program must deduct the tickets just sold from the total tickets available and then redisplay the menu.

The West Point station can sell up to 10 tickets for each Newburg train and 15 tickets for each Nyack train. Since train schedules are not yet predictable, tickets can only be sold for one train at a time going to either Newburg or Nyack. However, once the cashier has seen a train arrive and depart from the station, she must be able to use menu choice #3 in your program to note the departure of the train and start selling tickets for the next train.

The cashier will use menu choice #4 to count off each ticket left for both trains, displaying each count to the screen. For example, if the next Newburg train has 2 tickets left and the next Nyack train has 3 tickets left, the system will show:

“1 Newburg ticket

2 Newburg ticket

1 Nyack ticket

2 Nyack ticket

3 Nyack ticket”

At any point, the cashier should also be able to use menu choice #5 to display the dollar value sum of ticket sales since the start of the program. The program should only terminate when menu option #6 is selected.

## TECHNICAL REQUIREMENTS:

Your solution will consist of deliverables in two phases:

Phase 1: Design (50 points, to include a Problem Specification, Flowchart, Functional Decomposition, and Partial Test Plan) due at 1600 hrs on Lesson 14.

Phase 2: Implementation (150 points, Ada code and completed Test Plan) due at 1600 hrs on Lesson 22.

Beyond satisfying the functional requirements, there are a few specific technical requirements that you must meet to earn full credit. Your instructor may have additional instructions as well.

Your solution must exhibit top-down design, follow all naming conventions (see the Ada95 Style Guide, linked from the CS300 Tools page), and be documented IAW the USMA pamphlet Documentation of Written Work (DWW). This project is expected to be an individual project, so you must document all assistance that you receive.

Your design and implementation must be thoroughly tested. Make sure that you include test cases for each menu choice, input validation, and path testing.

Your implementation must use a single function to calculate how many of each denomination of currency is needed for change. There are a variety of acceptable ways to implement this function—strive to make your function be a general calculation process that reduces repetitious lines of code.

Declare an enumerated type for the two trains, and use it to determine which train ticket counter to reset in menu choice #3.

You must use two different types of iterative programming constructs to implement the ticket counting processes (menu choice #4).

# Problem Specificiation

## OBJECTIVES:

Develop a temporary train sensing and ticketing system for the newly reopened West Point Train Station to track tickets available/sold to Newburg and Nyack, calculate the change in units of currency the cashier must give the customer, calculate total sales, and manually allow a cashier to input when a train has arrived at the station.

## SPECIFIED TASKS

- Implement a text based terminal based on a menu
- Display the following menu immediately upon starting the program
  1. Sell tickets to Newburg
  2. Sell tickets to Nyack
  3. Process train departure
  4. Check tickets remaining
  5. View total sales
  6. Quit the program
- Select operation from menu (MenuChoice)
- Input Validation Test: Good, ‘1’; Bad, ‘7’; Ugly ‘Quit’
- Input the number of tickets the customer wants to buy (NumberTickets)
- Input Validation Test: Good, '2'; Bad, '0'; Ugly, 'five'
- Output the total cost of the tickets (TotalCost)
- Input the amount of money paid by the customer (AmountPaid)
- Input Validation Test: Good, ‘3.50’; Bad, ‘1000’; Ugly, ‘twenty’
- Output the change due to the customer in dollars (DollarsChange), quarters (QuartersChange), dimes (DimesChange), nickels (NickelsChange), and pennies (PenniesChange), or show a message “Exact price paid.”
- Subtract the number of tickets sold (NumberTickets) from the total for the train (NewburgSupply) / (NyackSupply)
- Return to the menu following a transaction
- Reset the tickets total for the train once the train arrives (NewburgSupply) or (NyackSupply) upon cashier selection from the menu
- Display the total tickets remaining (NewburgSupply) & (NyackSupply) upon cashier selection from the menu

## IMPLIED TASKS

- Check user input for appropriateness and plausibility
- Define the Newburg ticket costs (NewburgCost) equal to \$3.50
- Define the Nyack ticket costs (NyackCost) equal to \$5.25
- Define the supply of Newburg tickets (NewburgSupply) equal to 10
- Define the supply of Nyack tickets (NyackSupply) equal to 15
- Multiply the ‘NumberTickets’ value by the cost of the ticket (NewburgCost or NyackCost) to find the Total Cost (TotalCost)
- Subtract the ‘AmountPaid’ value from the ‘TotalCost’ value to find the total change (TotalChange)
- Subtract increments of $1.00 from the ‘TotalChange’ value while adding 1 to the ‘DollarsChange’ value until the ‘TotalChange’ value is less than $1.00
- Subtract increments of $0.25 from the ‘TotalChange’ value while adding 1 to the ‘QuartersChange’ value until the ‘TotalChange’ value is less than $0.25
- Subtract increments of $0.10 from the ‘TotalChange’ value while adding 1 to the ‘DimesChange’ value until the ‘TotalChange’ value is less than $0.10
- Subtract increments of $0.05 from the ‘TotalChange’ value while adding 1 to the ‘NickelsChange’ value until the ‘TotalChange’ value is less than $0.05
- Subtract increments of $0.01 from the ‘TotalChange’ value while adding 1 to the ‘PenniesChange’ value until the ‘TotalChange’ value is less than $0.01
- Display the following submenu to allow the cashier to select which train has arrived
  1. Process train departure to Newburg
  2. Process train departure to Nyack
- Select operation from submenu (SubmenuChoice)
- Input Validation Test: Good, ‘1’; Bad, ‘7’; Ugly ‘Quit’

## ASSUMPTIONS

- The cashier never runs out of increments of money
- No customer buys multiple types of tickets in a single transaction
- No customer pays more than \$100 in a transaction
- Every train stopping at the West Point train station stops at either Nerburg or Nyack
- All ticket costs include tax
- No money values use fractions of pennies
- The user does not input strings or floats values at an integer prompt for menu selection
- The user does not input strings at a prompt at a float prompt for values of money

## CONSTRAINTS

- Tickets to Newburg cost \$3.50
- Tickets to Nyack cost \$5.25
- Cashier can sell up to 10 tickets for each Newburg train
- Cashier can sell up to 15 tickets for each Nyack train
- Design must be completed prior to Lesson 14
- Implementation must be completed prior to Lesson 22
- Use a top-down design, follow all naming conventions, and document according to the DWW
- Thoroughly test Implementation including menu choice, input validation, and path testing.
- Use a single function to calculate how many of each denomination of currency is needed for change
- Declare an enumerated type for the two trains, and use them to determine which ticket counter must be reset in menu choice #3 upon the arrival of the respective train
- Use two different types of iterative programming constructs to implement the ticket counting processes in menu choice #4
- Format using Ada programming.
