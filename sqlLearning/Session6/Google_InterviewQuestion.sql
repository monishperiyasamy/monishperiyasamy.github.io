-- GOOGLE INTERVIEW QUESTION--
use TechForAllWithMonish;
create table Accounts(
A_id int primary key,
A_holder varchar(40) not null);

create table Transaction(
Acc_id int,
Transaction_id int primary key,
Transaction_date timestamp not null,
Amt int not null
 );

INSERT INTO Accounts (A_id, A_holder) VALUES 
(1, 'Alice Johnson'),
(2, 'Bob Smith'),
(3, 'Charlie Brown'),
(4, 'David Williams'),
(5, 'Emma Davis');

INSERT INTO Transaction (Acc_id, Transaction_id, Transaction_date, Amt) VALUES 
(1, 101, '2024-03-12 10:15:30', 500),
(2, 102, '2024-02-12 11:20:45', 1000),
(3, 103, '2024-03-12 12:35:50', 750),
(4, 104, '2024-03-12 13:40:10', 1200),
(4, 105, '2024-03-12 13:44:10', 1200),
(5, 106, '2024-04-12 14:55:25', 300);

/* QUERY 1
With the given two tables give Account number, holder name, num of transaction made in march ,
 total amt that they transfered during march 
*/

select Acc_id,A_holder,count(Transaction_id) as Num_of_Transaction,sum(Amt)as TotalAmt from Accounts
join Transaction on Accounts.A_id=Transaction.Acc_id
where month(Transaction_date)=03
group by Acc_id,A_holder ;





