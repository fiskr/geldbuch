/* Script to create all tables to support my financial transactions and records*/

/*
 * Transaction table is the actual financial journal entry recording increases and decreases to accounts.
 */
DROP TABLE transaction;
CREATE TABLE transaction(
	id		int		PRIMARY KEY
	,date		date	
	,account_id	int		REFERENCES account(id)
	,description	varchar(120)
	,amount		double
);

/*
 * Account  table keeps accounts for transactions, e.g. school expense, wages earned, food expense, miscellaneous, etc.
 */
DROP TABLE account;
CREATE TABLE account(
	id		int		PRIMARY KEY
	,name		varchar(35)
	,description	varchar(120)
);

/*
 * Institution table keeps names of businesses and places accounts are associated with, e.g. Wal-mart, Food Lion, Food City, etc. 
 */
DROP TABLE institution;
CREATE TABLE institution(
	id		int		PRIMARY KEY
	,name		varchar(35)
);

/*
 * Address table is self evident
 */
DROP TABLE address;
CREATE TABLE address(
	id	int		PRIMARY KEY
	,street	varchar(30)
	,city	varchar(30)
	,state	varchar(2)
	,zipcode	varchar(5)	
);

/*
 * Location table is a bridge between institution and address tables, indicating where an institution is
 */
DROP TABLE location;
CREATE TABLE location(
	address_id	int	REFERENCES address(id)
	,institution_id	int	REFERENCES address(id)
);

/*
 * Source table is the bridge between accounts and institutions, allowing many to many relationships
 */
DROP TABLE source;
CREATE TABLE source(
	account_id	int		REFERENCES account(id)
	,institution_id	int		REFERENCES institution(id)
);

/*
 * Family table is a bridge between accounts to designate when one account is the parent of a child account
 */
DROP TABLE family;
CREATE TABLE family(
	parent_id		int		REFERENCES account(id)
	,child_id		int		REFERENCES account(id)
);

/*
 * Receipt table keeps binary large object data of pictures
 */
DROP TABLE receipt;
CREATE TABLE receipt(
	id		int	PRIMARY KEY
	,image		BLOB
	,transaction_id	int	REFERENCES transaction(id)
);

/*
 * Bank_Account table stores balances and types of cash accounts
 */
DROP TABLE bank_account;
CREATE TABLE bank_account(
	id		int		PRIMARY KEY
	,institution_id	int		REFERENCES institution(id)
	,type		varchar(30)
	,balance		double
);