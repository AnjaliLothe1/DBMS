/*SQL Exercise 4*/
show databases;
use sqlexercise1;
select * from s;
select * from P;
select * from J;
select * from spj;

-- 1. Display the minimum Status in the Supplier table.
select * , min(status) minValue from s;

-- 2. Display the maximum Weight in the Parts table.
select *, max(weight) from p;

-- 3. Display the average Weight of the Parts.
select *, avg(weight) from p;

-- 4. Display the total Quantity sold for part ‘P1’.
select * from spj where pno='P1';

-- 5. Display the total Quantity sold for each part.
select sum(Qty) from SPJ;
select * from SPJ;

-- 6. Display the average Quantity sold for each part.
select avg(qty) Average from SPJ;

-- 7. Display the maximum Quantity sold for each part, provided the maximum Quantity is greater than 800.

-- 8. Display the Status and the count of Suppliers with that Status.
-- 9. Display the count of Projects going on in different cities.
-- 10. What is the difference between COUNT(Status) and COUNT(*) ?
/*11. Display the Status and the Count of Suppliers with that Status in the following format as shown below:-
Status Count
Ten 1
Twenty 2
Thirty 3 */