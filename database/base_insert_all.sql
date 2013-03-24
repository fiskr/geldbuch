/*script to insert base data into all the tables*/

/*accounts*/
insert into account values (1, 'CASH', 'Account to keep track of cash- be that literal bills or electronic');
insert into account values (2, 'WAGES EARNED REVENUE', 'Money earned from providing a service');
insert into account values (3, 'FOOD EXPENSE', 'Expenses related to food');
insert into account values (4, 'ACCOUNTS RECEIVABLE', 'Amounts owed to me');
INSERT INTO account VALUES (5, 'ACCOUNTS PAYABLE', 'Amounts I owe someone else');
INSERT INTO account VALUES (6, 'AUTOMOBILE EXPENSE', 'Expenses related to automobiles');
INSERT INTO account VALUES (7, 'GAS EXPENSE', 'Amounts spent on gasoline');
INSERT INTO account VALUES (8, 'KINDNESS EXPENSE', 'Money spontaneously spent on other people without personal gain');
INSERT INTO account VALUES (9, 'MISC EXPENSE', 'Any expense that does not fit other categories');
INSERT INTO account VALUES (10, 'CLOTHING EXPENSE', 'Money spent on clothing, including shoes');
INSERT INTO account VALUES (11, 'SCHOOL EXPENSE', 'Money spent on school, e.g. tuition, books');
INSERT INTO account VALUES (12, 'GIFT EXPENSE', 'Money spent on other people for their birthdays or holidays');
INSERT INTO account VALUES (13, 'GIFT REVENUE', 'Money received on account of birthdays or holidays');
INSERT INTO account VALUES (14, 'MEDICAL EXPENSE', 'Money spent on medical bills, supplies, etc.');
INSERT INTO account VALUES (15, 'PHONE EXPENSE', 'Money spent on phone, e.g. purchasing phones or paying monthly service fees');
INSERT INTO account VALUES (16, 'RESTITUTION EXPENSE', 'Money spent as a result of my misbehavior, usually in the home');
INSERT INTO account VALUES (17, 'TAX EXPENSE', 'Money spent on taxes');
INSERT INTO account VALUES (18, 'TAX REVENUE', 'Money received from taxes');
INSERT INTO account VALUES (19, 'DENTAL EXPENSE', 'Medical expense related to dentist bills');
INSERT INTO account VALUES (20, 'TOOL EXPENSE', 'Money invested in tools, e.g. Kleins, shovels, meat grinder, etc.');
INSERT INTO account VALUES (21, 'RENT EXPENSE', 'Money spent on rent');
INSERT INTO account VALUES (22, 'UTILITIES EXPENSE', 'Money spent on utilities');
INSERT INTO account VALUES (23, 'LEGAL EXPENSE', 'Money spent on lawyers or in relation to legal business, e.g. speeding tickets');

/*family- relational hierarchy of accounts*/
INSERT INTO family VALUES (6, 7); /*Automobile expense is parent to gasoline expense*/
INSERT INTO family VALUES (14, 19); /*Medical expense is parent to dental expense*/

/*institutions and businesses*/
INSERT INTO institution VALUES (1, 'TACALA TN');
INSERT INTO institution VALUES (2, 'FOOD LION, LLC');
INSERT INTO institution VALUES (3, 'WALMART');
INSERT INTO institution VALUES (4, 'FOOD CITY');
INSERT INTO institution VALUES (5, 'KROGER');
INSERT INTO institution VALUES (6, 'CVS');
INSERT INTO institution VALUES (7, 'PSTCC');
INSERT INTO institution VALUES (8, 'STARBUCKS');
INSERT INTO institution VALUES (9, 'PAPA MURPHEYS');
INSERT INTO institution VALUES (10, 'RACEWAY');
INSERT INTO institution VALUES (11, 'SAMS CLUB');
INSERT INTO institution VALUES (12, 'THOMPSON TIRE');
INSERT INTO institution VALUES (13, 'EARTH FARE');
INSERT INTO institution VALUES (14, 'MCDONALDS');
INSERT INTO institution VALUES (15, 'AMAZON MARKETPLACE');
INSERT INTO institution VALUES (16, 'ORNLFCU');
INSERT INTO insitution VALUES (17, 'FFF');

/*addresses*/
INSERT INTO address VALUES (1, '9002 OAKRDIGE HWY', 'KNOXVILLE', 'TN', '3793');
INSERT INTO address VALUES (2, '380 S. ILLINOIS', 'OAK RIDGE', 'TN', '37830');
INSERT INTO address VALUES (3, '1199 OAK RIDGE TURNPIKE', 'OAK RIDGE', 'TN', '37830');

/*locations- bridging addresses to businesses*/
INSERT INTO location VALUES (1, 10); /*Raceway's location*/
INSERT INTO location VALUES (2, 5); /*Kroger's location*/
INSERT INTO location VALUES (3, 4); /*Food City's location*/

/*sources- bridging accounts and businesses, e.g. I buy gas from Raceway so the Gas expense account is associated with Raceway*/
INSERT INTO source VALUES(7, 10); /*Gas provided by Raceway*/

/*bank account- balances and types of cash accounts*/
INSERT INTO bank_account VALUES (1, 16, 'CHECKING', 1000.00);
INSERT INTO bank_account VALUES (2, 16, 'SAVINGS', 4000.00);
INSERT INTO bank_account VALUES (3, NULL, 'HARD CASH', 100.00);

/*some transactions, note dates are 'YYYY-MM-DD'*/
INSERT INTO transaction VALUES(101, '2013-03-19', 6, 'Automobile insurance', 775.00);
INSERT INTO transaction VALUES(102, '2013-03-19', 1, 'Automobile insurance', -775.00);
