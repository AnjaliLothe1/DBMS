mysql> select * from emp;
+-------+--------+------+--------+------+------+
| EMPNO | ENAME  | SAL  | DEPTNO | JOB  | MGR  |
+-------+--------+------+--------+------+------+
|     1 | Arun   | 8000 | 1      | M    |    4 |
|     2 | Ali    | 7000 | 1      | C    |    1 |
|     3 | Kirun  | 3000 | 1      | C    |    1 |
|     4 | Jack   | 9000 | 2      | M    | NULL |
|     5 | Thomas | 8000 | 2      | C    |    4 |
+-------+--------+------+--------+------+------+
5 rows in set (0.00 sec)

mysql> select deptno,sum(sal) from emp group by deptno;
+--------+----------+
| deptno | sum(sal) |
+--------+----------+
| 1      |    18000 |
| 2      |    17000 |
+--------+----------+
2 rows in set (0.10 sec)

mysql> select deptno,max(sal) from emp group by deptno;
+--------+----------+
| deptno | max(sal) |
+--------+----------+
| 1      |     8000 |
| 2      |     9000 |
+--------+----------+
2 rows in set (0.27 sec)

mysql> select deptno,min(sal) from emp group by deptno;
+--------+----------+
| deptno | min(sal) |
+--------+----------+
| 1      |     3000 |
| 2      |     8000 |
+--------+----------+
2 rows in set (0.00 sec)

mysql> select deptno,count(*) from emp group by deptno;
+--------+----------+
| deptno | count(*) |
+--------+----------+
| 1      |        3 |
| 2      |        2 |
+--------+----------+
2 rows in set (0.00 sec)

=================================================
* WHERE clause is specified BEFROE the GROUP BY clasue




Step : 
dig 2.Evernote
=================================================

 select * from emp;
+-------+--------+------+--------+------+------+
| EMPNO | ENAME  | SAL  | DEPTNO | JOB  | MGR  |
+-------+--------+------+--------+------+------+
|     1 | Arun   | 8000 | 1      | M    |    4 |
|     2 | Ali    | 7000 | 1      | C    |    1 |
|     3 | Kirun  | 3000 | 1      | C    |    1 |
|     4 | Jack   | 9000 | 2      | M    | NULL |
|     5 | Thomas | 8000 | 2      | C    |    4 |
+-------+--------+------+--------+------+------+
5 rows in set (0.00 sec)

mysql> select deptno,job,sum(sal) from emp group by deptno,job;
+--------+------+----------+
| deptno | job  | sum(sal) |
+--------+------+----------+
| 1      | M    |     8000 |
| 1      | C    |    10000 |
| 2      | M    |     9000 |
| 2      | C    |     8000 |
+--------+------+----------+
4 rows in set (0.00 sec)


mysql> select job,deptno,sum(sal) from emp group by job,deptno;
+------+--------+----------+
| job  | deptno | sum(sal) |
+------+--------+----------+
| M    | 1      |     8000 |
| C    | 1      |    10000 |
| M    | 2      |     9000 |
| C    | 2      |     8000 |
+------+--------+----------+
4 rows in set (0.00 sec)

-----dig.3 Evernote(day 6)-------------
Notes:
* The position of columns in SELECT clasue, and the order of columns
  in GROUP BY clasue need not be the same
* The position of columns in SELECT clause, will determine the position
  of colums in the output (this you will write as per user requirments)  
* The order of columns in GROUP BY clause will determin the sorting order, the
  group order, the summation order, and hence the speed of processing.

Example
*******
select ................... group by country,state,district,city; -> FASTER
select ................... group by city,district,state,country; -> SLOWER
  
======================================================
Function: 
======================================================
* if you have large  number of columns in group by clasue, then the
  select statment will be  
  
======================================================================  
 HAVING clause
======================================================================
select deptno, sum(sal) from emp group by deptno having sum(sal) > 17000;
 ---dig
 
 *** HAVING 
 *** interally sortig having take place it was a last postion in according columns
 ***its recommended that only group functions should be used in HAVING clause
======================================================================
ORDER BY
======================================================================
 ---dig 
 
 *** ORDER BY clause is the LAST clause in SELECT Statement

======================================================================
-- QUERY
create table DEPT(DEPTNO INT, DNAME varchar(20), LOCATION VARCHAR(20));
INSERT INTO DEPT VALUES(1, 'TRN','BBY'),(1,'EXP','DLH'),(3,'MKTG','CAL');

DEPT
deptno dname location
------ ----- --------
1 		TRN 	Bby
2 		EXP 	Dlh
3 		MKTG	Cal
======================================================================
**********************************************************************
IN ORACLE
---------
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO
DEPTNO	SUL(SAL)
------	--------
10		18000
20		17000

SELECT SUM(SAL) FROM EMP GROUP BY DEPTNO;
SUM(SAL)
--------
18000
17000

SELECT MAX(SUM(SAL)) FROM EMP GROUP BY DEPTNO;
MAX(SUM(SAL))   
-----------  
18000

*** NESTING OF GROUP FUN IS ALLOWED 

SELECT DEPTNO, SUM(SAL) SUM_SALARY FROM EMP GROUP BY DEPTNO
DEPTNO	SUM_SALARY
------	--------
10		18000
20		17000

SELECT SUM(SAL) FROM EMP GROUP BY DEPTNO;
SUM(SAL)
--------
18000
17000
-- DIG 5

_____________________******************_____________________******************
IN MYSQL:-
----------
SELECT SUM(SAL)FROM EMP GROUP BY 

SELECT MA(SUM_SAL) FROM (
SELECT SUM(SAL) FROM EMP GROUP BY DEPTNO) AS TEMPP;
MAX(SUM(SAL))
--------
18000

**********************************************************************

======================================================================
JOIN -##VV IMP
======================================================================
* All the data is not stored in one table; data is stored in mutiple tables
* To vies / combine the columns of 2 or more table, then you will have to write a join
mysql>
mysql> INSERT INTO DEPT VALUES(1, 'TRN','BBY'),(1,'EXP','DLH'),(3,'MKTG','CAL');
Query OK, 3 rows affected (0.12 sec)
Records: 3  Duplicates: 0  Warnings: 0


~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Reference table ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
mysql> select * from emp;
+-------+--------+------+--------+------+------+
| EMPNO | ENAME  | SAL  | DEPTNO | JOB  | MGR  |
+-------+--------+------+--------+------+------+
|     1 | Arun   | 8000 | 1      | M    |    4 |
|     2 | Ali    | 7000 | 1      | C    |    1 |
|     3 | Kirun  | 3000 | 1      | C    |    1 |
|     4 | Jack   | 9000 | 2      | M    | NULL |
|     5 | Thomas | 8000 | 2      | C    |    4 |
+-------+--------+------+--------+------+------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM DEPT;
+--------+-------+----------+
| DEPTNO | DNAME | LOCATION |
+--------+-------+----------+
|      1 | TRN   | BBY      |
|      1 | EXP   | DLH      |
|      3 | MKTG  | CAL      |
+--------+-------+----------+
3 rows in set (0.00 sec)

mysql> SELECT ENAME, DEPTNO FROM EMP;
+--------+--------+
| ENAME  | DEPTNO |
+--------+--------+
| Arun   | 1      |
| Ali    | 1      |
| Kirun  | 1      |
| Jack   | 2      |
| Thomas | 2      |
+--------+--------+
5 rows in set (0.00 sec)

dept--->drivig 
emp --->driven
mysql> select dname, ename from emp, dept where dept.deptno=emp.deptno;
+-------+-------+
| dname | ename |
+-------+-------+
| EXP   | Arun  |
| TRN   | Arun  |
| EXP   | Ali   |
| TRN   | Ali   |
| EXP   | Kirun |
| TRN   | Kirun |
+-------+-------+
6 rows in set (0.03 sec)
-- dig 7


mysql> select dname,ename from emp,dept where dept.deptno=emp.deptno;
+-------+-------+
| dname | ename |    <----- fast
+-------+-------+
| EXP   | Arun  |    __emp
| TRN   | Arun  |	|	 __dept
| EXP   | Ali   |	|	|
| TRN   | Ali   |	|	| where dept.deptno=emp.deptno;
| EXP   | Kirun |	|	|__
| TRN   | Kirun |	|___
+-------+-------+
6 rows in set (0.00 sec)

mysql> select dname,ename from dept, emp where dept.deptno=emp.deptno;
+-------+-------+
| dname | ename |   <------ slow
+-------+-------+	 _ dept
| EXP   | Arun  |	|	 __emp
| TRN   | Arun  |	|	|
| EXP   | Ali   |	|	|where dept.deptno=emp.deptno;
| TRN   | Ali   |	|	|__
| EXP   | Kirun |	|_	
| TRN   | Kirun |
+-------+-------+
6 rows in set (0.00 sec)
*** IN ORDER FOR YOUR JOI TO WORK FASTER, PREFERABLY THE DRIVING TABLE SHOULD BE TABLE WITH LESSER NUMBER OF ROWS.
*** The commo columns that is preset i oth the tables, that columns
	name need not be same in both the tables; because the same columns
	my have a different meaning in some other table.
	
(error)
select deptno,dname , loc,empno,ename,job,sal from emp,dept where dept.deptno=emp.deptno;

working properly
mysql> select dept.deptno,dname,location,empno,ename,job,sal from emp,dept where dept.deptno=emp.deptno order by 1;
+--------+-------+----------+-------+-------+------+------+
| deptno | dname | location | empno | ename | job  | sal  |
+--------+-------+----------+-------+-------+------+------+
|      1 | EXP   | DLH      |     1 | Arun  | M    | 8000 |
|      1 | TRN   | BBY      |     1 | Arun  | M    | 8000 |
|      1 | EXP   | DLH      |     2 | Ali   | C    | 7000 |
|      1 | TRN   | BBY      |     2 | Ali   | C    | 7000 |
|      1 | EXP   | DLH      |     3 | Kirun | C    | 3000 |
|      1 | TRN   | BBY      |     3 | Kirun | C    | 3000 |
+--------+-------+----------+-------+-------+------+------+
6 rows in set (0.00 sec)

mysql> select emp.deptno,dname,location,empno,ename,job,sal from emp,dept where dept.deptno=emp.deptno order by 1;
+--------+-------+----------+-------+-------+------+------+
| deptno | dname | location | empno | ename | job  | sal  |
+--------+-------+----------+-------+-------+------+------+
| 1      | EXP   | DLH      |     1 | Arun  | M    | 8000 |
| 1      | TRN   | BBY      |     1 | Arun  | M    | 8000 |
| 1      | EXP   | DLH      |     2 | Ali   | C    | 7000 |
| 1      | TRN   | BBY      |     2 | Ali   | C    | 7000 |
| 1      | EXP   | DLH      |     3 | Kirun | C    | 3000 |
| 1      | TRN   | BBY      |     3 | Kirun | C    | 3000 |
+--------+-------+----------+-------+-------+------+------+
6 rows in set (0.04 sec)


mysql> select dept.deptno,dept.dname,dept.location,emp.empno,emp.ename,emp.job,emp.sal from emp,dept where dept.deptno=emp.deptno order by 1;
+--------+-------+----------+-------+-------+------+------+
| deptno | dname | location | empno | ename | job  | sal  |
+--------+-------+----------+-------+-------+------+------+
|      1 | EXP   | DLH      |     1 | Arun  | M    | 8000 |
|      1 | TRN   | BBY      |     1 | Arun  | M    | 8000 |
|      1 | EXP   | DLH      |     2 | Ali   | C    | 7000 |
|      1 | TRN   | BBY      |     2 | Ali   | C    | 7000 |
|      1 | EXP   | DLH      |     3 | Kirun | C    | 3000 |
|      1 | TRN   | BBY      |     3 | Kirun | C    | 3000 |
+--------+-------+----------+-------+-------+------+------+
6 rows in set (0.00 sec)

 select dept.deptno,dname,location,empno,ename,job,sal from emp,dept  where dept.deptno=emp.deptno  order by 1;
+--------+-------+----------+-------+-------+------+------+
| deptno | dname | location | empno | ename | job  | sal  |
+--------+-------+----------+-------+-------+------+------+
|      1 | EXP   | DLH      |     1 | Arun  | M    | 8000 |
|      1 | TRN   | BBY      |     1 | Arun  | M    | 8000 |
|      1 | EXP   | DLH      |     2 | Ali   | C    | 7000 |
|      1 | TRN   | BBY      |     2 | Ali   | C    | 7000 |
|      1 | EXP   | DLH      |     3 | Kirun | C    | 3000 |
|      1 | TRN   | BBY      |     3 | Kirun | C    | 3000 |
+--------+-------+----------+-------+-------+------+------+	


mysql> select upper(dname),sum(sal) from emp, dept where dept.deptno=emp.deptno group by dname;
+--------------+----------+
| upper(dname) | sum(sal) |
+--------------+----------+
| EXP          |    18000 |
| TRN          |    18000 |
+--------------+----------+
2 rows in set (0.34 sec)

mysql> select upper(dname),sum(sal) from emp, dept where dept.deptno=emp.deptno group by upper(dname) having sum(sal)>10000 order by 1;
+--------------+----------+
| upper(dname) | sum(sal) |
+--------------+----------+
| EXP          |    18000 |
| TRN          |    18000 |
+--------------+----------+
2 rows in set (0.00 sec)



-------------------------------***------------------------------------




======================================================================
Types of join
======================================================================
!=
mysql> select dname, ename from emp,dept where dept.deptno !=emp.deptno; 
+-------+--------+
| dname | ename  |
+-------+--------+
| MKTG  | Arun   |
| MKTG  | Ali    |
| MKTG  | Kirun  |
| MKTG  | Jack   |
| EXP   | Jack   |
| TRN   | Jack   |
| MKTG  | Thomas |
| EXP   | Thomas |
| TRN   | Thomas |
+-------+--------+
9 rows in set (0.00 sec)

>=
mysql> select dname, ename from emp,dept where dept.deptno >=emp.deptno; 
+-------+--------+
| dname | ename  |
+-------+--------+
| MKTG  | Arun   |
| EXP   | Arun   |
| TRN   | Arun   |
| MKTG  | Ali    |
| EXP   | Ali    |
| TRN   | Ali    |
| MKTG  | Kirun  |
| EXP   | Kirun  |
| TRN   | Kirun  |
| MKTG  | Jack   |
| MKTG  | Thomas |
+-------+--------+
11 rows in set (0.00 sec)




1. Equijoin
* Join based on equality condition
* Shows matiching rows of both the tables
	use:- 
	a. view the columns of both the tables
	e.g. DNAME and ENAME CUSTNAME and ORDER_DETAILS etc
* This is the most frequently used join ( >90% )and hence it is also known as Natural join

mysql> select dname, ename from emp,dept where dept.deptno <=emp.deptno; 
+-------+--------+
| dname | ename  |
+-------+--------+
| EXP   | Arun   |
| TRN   | Arun   |
| EXP   | Ali    |
| TRN   | Ali    |
| EXP   | Kirun  |
| TRN   | Kirun  |
| EXP   | Jack   |
| TRN   | Jack   |
| EXP   | Thomas |
| TRN   | Thomas |
+-------+--------+
10 rows in set (0.00 sec)

2. Inequaijoin(Non-Equijoin)
* join based on inequality condition.
* showa non-matiching rows of both the tables
* 	uses:-
	a. exception reports




dept----> driven table
mysql> select dname, ename from emp,dept where dept.deptno !=emp.deptno; 
+-------+--------+
| dname | ename  |
+-------+--------+
| MKTG  | Arun   |
| MKTG  | Ali    |
| MKTG  | Kirun  |
| MKTG  | Jack   |
| EXP   | Jack   |
| TRN   | Jack   |
| MKTG  | Thomas |
| EXP   | Thomas |
| TRN   | Thomas |
+-------+--------+
9 rows in set (0.00 sec)

3. outerjoin
* join with (+) sign


-- dig 8
-------------------------------***------------------------------------



======================================================================
Day 6 - JOIN
======================================================================
4. Cartesion join
* Join without a WHERE condition
dept --->driving table;
emp  ---> driven table;

continue.....
-------------------------------***------------------------------------

======================================================================
Sub -Queries(VV.IMP)
======================================================================
* also kenow as nested queries (Query within Query)
  (select within select)
  
use near 'from emp, dept' at line 1
mysql> select ename,min(sal) from emp; (error in oracle)
+-------+----------+
| ename | min(sal) |
+-------+----------+
| Arun  |     3000 |
+-------+----------+
1 row in set (0.09 sec)

mysql> select ename from emp where sal=min(sal); (error in MySQL and Oracle)
ERROR 1111 (HY000): Invalid use of group function

***Display the ENAME who is receving sal=min(sal):-
select ename from emp <--- main query (parent query)
where sal=
(select min(sal)from emp); <--- sub-query (child)(inner query)

select ename from emp where sal =(select min(sal) from emp);
+-------+
| ename |
+-------+
| Kirun |
+-------+
1 row in set (0.05 sec)

fuction within function
select ename from emp where sal=(select min(sal)from emp where deptno=(select * from emp);

* max upto 255 levels for sub-queries
* JOIN is FASTER than SUB-QUERY (the more the number of SELECT statements, the slower it will be)

***Display the 2nd largest sal: -
______________________________________
 select max(sal) from emp where sal < (select max(sal) from emp);
+----------+                           _________________________
| max(sal) |								Higher priority.
+----------+
|     8000 |
+----------+
1 row in set (0.00 sec)

***Display all the rows with same deptno as 'Thomas': -
 select * from emp where deptno = (select deptno from emp where ename = 'Thomas');
+-------+--------+------+--------+------+------+
| EMPNO | ENAME  | SAL  | DEPTNO | JOB  | MGR  |
+-------+--------+------+--------+------+------+
|     4 | Jack   | 9000 | 2      | M    | NULL |
|     5 | Thomas | 8000 | 2      | C    |    4 |
+-------+--------+------+--------+------+------+

*** Display all the rows with same job as 'Kirun': -

mysql> select * from emp where job =(select job from emp where ename ='Kirun');
+-------+--------+------+--------+------+------+
| EMPNO | ENAME  | SAL  | DEPTNO | JOB  | MGR  |
+-------+--------+------+--------+------+------+
|     2 | Ali    | 7000 | 1      | C    |    1 |
|     3 | Kirun  | 3000 | 1      | C    |    1 |
|     5 | Thomas | 8000 | 2      | C    |    4 |
+-------+--------+------+--------+------+------+

!=
mysql> select * from emp where deptno != (select deptno from emp where ename = 'Thomas');
+-------+-------+------+--------+------+------+
| EMPNO | ENAME | SAL  | DEPTNO | JOB  | MGR  |
+-------+-------+------+--------+------+------+
|     1 | Arun  | 8000 | 1      | M    |    4 |
|     2 | Ali   | 7000 | 1      | C    |    1 |
|     3 | Kirun | 3000 | 1      | C    |    1 |
+-------+-------+------+--------+------+------+
3 rows in set (0.00 sec)


-------------------------------***------------------------------------


======================================================================
Using sub-queries with DML commands: -
======================================================================
In Oracle: -
-------------
delete from emp where deptno =(select deptno from emp where ename = 'Thomas');

update emp set sal = 10000 where job =(select job from emp where ename ='Kirun');

In MySQL: -
------------
* you cannot UPDATE or DELETE from a table from which you are currently SELECTing
Solution: -
mysql> delete from emp where deptno=(select tempp.deptno from (select deptno from emp where ename='Thomas')as tempp);
Query OK, 2 rows affected (0.19 sec)

mysql> select * from emp;
+-------+-------+------+--------+------+------+
| EMPNO | ENAME | SAL  | DEPTNO | JOB  | MGR  |
+-------+-------+------+--------+------+------+
|     1 | Arun  | 8000 | 1      | M    |    4 |
|     2 | Ali   | 7000 | 1      | C    |    1 |
|     3 | Kirun | 3000 | 1      | C    |    1 |
+-------+-------+------+--------+------+------+
3 rows in set (0.00 sec)
>
mysql> update emp set sal = 10000 where job = (select tempp.job from (select job from emp where ename ='Kirun') as tempp);
Query OK, 2 rows affected (0.18 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select * from emp;
+-------+-------+-------+--------+------+------+
| EMPNO | ENAME | SAL   | DEPTNO | JOB  | MGR  |
+-------+-------+-------+--------+------+------+
|     1 | Arun  |  8000 | 1      | M    |    4 |
|     2 | Ali   | 10000 | 1      | C    |    1 |
|     3 | Kirun | 10000 | 1      | C    |    1 |
+-------+-------+-------+--------+------+------+
3 rows in set (0.12 sec)----> TEMPP ===> is in server RAM
+----------+                           _________________________
|Server RAM|								Higher priority.
+----------+
|    TEMPP |
+----------+
Multi-row sub-queries: -
-------------------------
(sub-query returns multiple rows): -
-------------------------------------

*** Display all the rows who are receving the sal equal to any one of managers: -
mysql> select * from emp where sal=any(select sal from emp where job='M');
+-------+-------+------+--------+------+------+
| EMPNO | ENAME | SAL  | DEPTNO | JOB  | MGR  |
+-------+-------+------+--------+------+------+
|     1 | Arun  | 8000 | 1      | M    |    4 |
+-------+-------+------+--------+------+------+
1 row in set (0.10 sec)
Note: ANY is special Operator and it will performed logical and that have subqueirs written like that

mysql> select * from emp where sal in(select sal from emp where job = 'M');
+-------+-------+------+--------+------+------+
| EMPNO | ENAME | SAL  | DEPTNO | JOB  | MGR  |
+-------+-------+------+--------+------+------+
|     1 | Arun  | 8000 | 1      | M    |    4 |
+-------+-------+------+--------+------+------+
1 row in set (0.00 sec)

to Exclude the Managers from the output:-
mysql> select * from emp where job != 'M' and sal in(select sal from emp where job = 'M');
Empty set (0.00 sec)

faster-->
 select * from emp where sal >=(select min(sal) from emp where job = 'M');
+-------+-------+-------+--------+------+------+
| EMPNO | ENAME | SAL   | DEPTNO | JOB  | MGR  |
+-------+-------+-------+--------+------+------+
|     1 | Arun  |  8000 | 1      | M    |    4 |
|     2 | Ali   | 10000 | 1      | C    |    1 |
|     3 | Kirun | 10000 | 1      | C    |    1 |
+-------+-------+-------+--------+------+------+
3 rows in set (0.00 sec)

To make it work faster: -
!1. Join is faster than sub-query; therefore use join wherever pos 
1. Try to solve the problem using join instead of sub-query because using a join you solve the problem using one SELECT statement whereas using sub queries you solve the problem using two or more SELECT statements; the more the number of SELECT statements, the slower it will be
2. Try to reduce the number of levels of sub-queries
3. Try to reduce the number of rows returned by sub-query

Assumption, 3rd row sal is 13000: -
mysql> update emp set sal = 13000 where ename ='Kirum' ;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 0  Changed: 0  Warnings: 0

mysql> insert into emp values(4,'Jack',9000,2,'M',null),(5,'Thomas',8000,2, 'C',4);
Query OK, 2 rows affected (0.45 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from emp;
+-------+--------+-------+--------+------+------+
| EMPNO | ENAME  | SAL   | DEPTNO | JOB  | MGR  |
+-------+--------+-------+--------+------+------+
|     1 | Arun   |  8000 | 1      | M    |    4 |
|     2 | Ali    | 10000 | 1      | C    |    1 |
|     3 | Kirun  | 10000 | 1      | C    |    1 |
|     4 | Jack   |  9000 | 2      | M    | NULL |
|     5 | Thomas |  8000 | 2      | C    |    4 |
+-------+--------+-------+--------+------+------+
5 rows in set (0.02 sec)
all operator perform logically AND;
mysql> select * from emp where sal>all(select sal from emp where job='M');
+-------+-------+-------+--------+------+------+
| EMPNO | ENAME | SAL   | DEPTNO | JOB  | MGR  |
+-------+-------+-------+--------+------+------+
|     2 | Ali   | 10000 | 1      | C    |    1 |
|     3 | Kirun | 10000 | 1      | C    |    1 |
+-------+-------+-------+--------+------+------+
2 rows in set (0.00 sec)

Assumption, 3rd row sal is 3000: -
mysql> select * from emp;
+-------+--------+-------+--------+------+------+
| EMPNO | ENAME  | SAL   | DEPTNO | JOB  | MGR  |
+-------+--------+-------+--------+------+------+
|     1 | Arun   |  8000 | 1      | M    |    4 |
|     2 | Ali    | 10000 | 1      | C    |    1 |
|     3 | Kirun  | 10000 | 1      | C    |    1 |
|     4 | Jack   |  9000 | 2      | M    | NULL |
|     5 | Thomas |  8000 | 2      | C    |    4 |
+-------+--------+-------+--------+------+------+
5 rows in set (0.00 sec)
_____________________******************_____________________******************
Using sub-query in the HAVING clause: -
Display the DNAME that is having max(sum(sal)): -

In Oracle: -

select deptno, sum(sal) from emp group by deptno;
OUTPUT: -
deptno sum(sal)
------ --------
1 		18000
2 		17000

select sum(sal) from emp group by deptno;
OUTPUT: -
sum(sal)
--------
18000
17000

select max(sum(sal)) from emp group by deptno;
OUTPUT: -
max(sum(sal))
------------
18000

select deptno,sum(sal) from emp group by deptno
having sum(sal) = (select max(sum(sal)) from emp group by deptno);
OUTPUT: -
deptno sum(sal)
1 18000

select dname, sum(sal) from emp, dept
where dept.deptno = emp.deptno group by dname
having sum(sal) = (select max(sum(sal)) from emp group by deptno);
OUTPUT: -
dname sum(sal)
------ --------
TRN 18000

_____________________******************_____________________******************
IN MySQL:-
------------
In MySQL: -

mysql> update emp set sal=3000 where ename='kirun';
Query OK, 1 row affected (0.58 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from emp;
+-------+--------+------+--------+------+------+
| EMPNO | ENAME  | SAL  | DEPTNO | JOB  | MGR  |
+-------+--------+------+--------+------+------+
|     1 | Arun   | 8000 | 1      | M    |    4 |
|     2 | Ali    | 7000 | 1      | C    |    1 |
|     3 | Kirun  | 3000 | 1      | C    |    1 |
|     4 | Jack   | 9000 | 2      | M    | NULL |
|     5 | Thomas | 8000 | 2      | C    |    4 |
+-------+--------+------+--------+------+------+
5 rows in set (0.00 sec)

mysql> select deptno, sum(sal) from emp group by deptno;
+--------+----------+
| deptno | sum(sal) |
+--------+----------+
| 1      |    18000 |
| 2      |    17000 |
+--------+----------+
2 rows in set (0.00 sec)

mysql> select sum(sal) from emp group by deptno;
+----------+
| sum(sal) |
+----------+
|    18000 |
|    17000 |
+----------+
2 rows in set (0.00 sec)
mysql> select max(sum_sal) from (select sum(sal) as sum_sal from emp group by deptno) as tempp;
+--------------+
| max(sum_sal) |
+--------------+
|        18000 |
+--------------+
1 row in set (0.00 sec)
 OUTPUT: -
deptno sum(sal)
------ --------
1 18000
select dname, sum(sal) from emp, dept
where dept.deptno = emp.deptno group by dname
having sum(sal) = (select max(sum_sal) from
(select sum(sal) as sum_sal from emp group by deptno) as tempp;
OUTPUT: -
dname sum(sal)
------ --------
TRN 18000

-------------------------------***------------------------------------

======================================================================
DAY 8- INDEXES
======================================================================
INDEXES: -
Types of Indexes: -
1. Normal index (MySQL)
2. Unique index
3. Clustered index
4. Bitmap index 3 to 6 Advanced (Oracle)
5. Index-Organized table
6. Index partitioning
NORMAL INDEX: -
* present in all RDBMS, all DBMS, and some programming languages also
* to speed up the search operations (for faster access)
* to speed up SELECT statement with a WHERE clause
* indexes are automatically invoked by MySQL as and when required
* indexes are automatically updated by MySQL for all the DML operations
* duplicate values are stored in index
* null values are not stored in an index
* no upper limit on the number of indexes per table
* larger the number of indexes, the slower wold be the DML operations
* cannot index TEXT and BLOB columns
* if you have multiple INDEPENDENT columns in the WHERE clause,
  then you should create seperate indexex for each column,
  MySQL will use the necessary indexes as and when required

mysql> DROP TABLE INDEXTABLE;
Query OK, 0 rows affected (0.77 sec)

mysql> create table INDEXTABLE(ROWId varchar(20),EMPNO int,ENAME varchar(20), SAL int ,DEPTNO int);
Query OK, 0 rows affected (1.11 sec)

mysql> insert into INDEXTable values ('X001', 5,'A', 5000, 1),
    -> ('X002', 4 ,'A',6000 ,1),
    -> ('X003',1 ,'C',7000 ,1),
    -> ('X004', 2 ,'D',9000 ,2),
    -> ('X005', 3 ,'E',8000, 2);
Query OK, 5 rows affected (0.18 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from INDEXTABLE WHERE ENAME='D';
+-------+-------+-------+------+--------+
| ROWId | EMPNO | ENAME | SAL  | DEPTNO |
+-------+-------+-------+------+--------+
| X004  |     2 | D     | 9000 |      2 |
+-------+-------+-------+------+--------+
1 row in set (0.00 sec)

mysql> select * from INDEXTABLE WHERE EMPNO=1;
+-------+-------+-------+------+--------+
| ROWId | EMPNO | ENAME | SAL  | DEPTNO |
+-------+-------+-------+------+--------+
| X003  |     1 | C     | 7000 |      1 |
+-------+-------+-------+------+--------+
1 row in set (0.00 sec)

mysql> select * from INDEXTABLE WHERE SAL=5000;
+-------+-------+-------+------+--------+
| ROWId | EMPNO | ENAME | SAL  | DEPTNO |
+-------+-------+-------+------+--------+
| X001  |     5 | A     | 5000 |      1 |
+-------+-------+-------+------+--------+
1 row in set (0.00 sec)

mysql> select * from INDEXTABLE WHERE ENAME='A';
+-------+-------+-------+------+--------+
| ROWId | EMPNO | ENAME | SAL  | DEPTNO |
+-------+-------+-------+------+--------+
| X001  |     5 | A     | 5000 |      1 |
| X002  |     4 | A     | 6000 |      1 |
+-------+-------+-------+------+--------+
2 rows in set (0.00 sec)

mysql>
-------------------------------***------------------------------------

======================================================================
DAY 9 - CONSTRAINTS: - (V. IMP)
======================================================================

* limitations/restrictions imposed on a table
PRIMARY KEY (Primary column): -
* column or set of columns that uniquely identifies a row
* duplicate values are not allowed (has to be unique)
* null values are not allowed ( it's a mandatory column)
* it's recommended tata every table should have a Primary Key
* purpose of Primary Key is row uniqueness (with the help of Primary Key column, you can distinguish between 2 rows of a table)
* TEXT and BLOB cannot be Primary Key
* unique index is automatically created
COMPOSITE PRIMARY KEY: -
* combine 2 or more INTER-DEPENDENT columns together to serve the purpose of Primary Key
* In MySQL, you can combine upto 32 columns in a composite Primary Key
* if you declare a composite Primary Key, then the index that is created automatically, happens to be composite unique index
* if you cannot identify some key column, then you add an extra column to the table to serve the purpose of Primary Key, such a key is known as SURROGATE KEY
* for SURROGATE KEY, CHAR datatype is recommended
* YOU CAN HAVE ONLY 1 PRIMARY KEY PER TABLE
CANDIDATE KEY -> is not a constraint
CANDIDATE KEY -> is a definition
CANDIDATE KEY -> besides the Primary, any other column in the table that could also serve the purpose of Primary key, is a good candidate for Primary key, is known as Candidate key
* its good to have couple of candidate keys in your table, because in future if you Alter your table and DROP the Primary Key column, then your table is left without a Primary Key, in that situation you can make 1 of your candidate key columns as the new Primary Key
mysql> create table empKEY (empno char(4) primary key, ename varchar(25), sal float, deptno int);
Query OK, 0 rows affected (1.49 sec)

mysql> create table emp1 (empno char(4), ename varchar(25), sal float, deptno int, primary key (deptno,empno));
Query OK, 0 rows affected (0.47 sec)

mysql> Select * from empkey;
Empty set (0.01 sec)

mysql> desc empkey;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empno  | char(4)     | NO   | PRI | NULL    |       |
| ename  | varchar(25) | YES  |     | NULL    |       |
| sal    | float       | YES  |     | NULL    |       |
| deptno | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.10 sec)

mysql> desc emp1;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empno  | char(4)     | NO   | PRI | NULL    |       |
| ename  | varchar(25) | YES  |     | NULL    |       |
| sal    | float       | YES  |     | NULL    |       |
| deptno | int         | NO   | PRI | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> insert into empkey values ('5','F',5000,2);
Query OK, 1 row affected (0.22 sec)

mysql> select * from empkey;
+-------+-------+------+--------+
| empno | ename | sal  | deptno |
+-------+-------+------+--------+
| 5     | F     | 5000 |      2 |
+-------+-------+------+--------+
1 row in set (0.00 sec)

mysql> insert into empkey values ('5','F',5000,2);
ERROR 1062 (23000): Duplicate entry '5' for key 'empkey.PRIMARY'

* all constaints are at server level 1(you may perform the DML operations using any front-end s/w, THe constaints will always be valid)
* interally a constaints is a MySQL Create functions;it perform the validations;

mysql> select * from information_schema.table_constraints;
+--------------------+--------------------+-----------------+--------------------+------------------------------------------------------+-----------------+----------+
| CONSTRAINT_CATALOG | CONSTRAINT_SCHEMA  | CONSTRAINT_NAME | TABLE_SCHEMA       | TABLE_NAME                                           | CONSTRAINT_TYPE | ENFORCED |
+--------------------+--------------------+-----------------+--------------------+------------------------------------------------------+-----------------+----------+
| def                | mysql              | PRIMARY         | mysql              | innodb_table_stats                                   | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | innodb_index_stats                                   | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | cond_instances                                       | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | error_log                                            | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_waits_current                                 | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_waits_history                                 | PRIMARY KEY     | YES      |
| def                | performance_schema | HOST            | performance_schema | events_waits_summary_by_host_by_event_name           | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_waits_summary_by_instance                     | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_waits_summary_by_thread_by_event_name         | PRIMARY KEY     | YES      |
| def                | performance_schema | USER            | performance_schema | events_waits_summary_by_user_by_event_name           | UNIQUE          | YES      |
| def                | performance_schema | ACCOUNT         | performance_schema | events_waits_summary_by_account_by_event_name        | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_waits_summary_global_by_event_name            | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | file_instances                                       | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | file_summary_by_event_name                           | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | file_summary_by_instance                             | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | host_cache                                           | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | mutex_instances                                      | PRIMARY KEY     | YES      |
| def                | performance_schema | OBJECT          | performance_schema | objects_summary_global_by_type                       | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | processlist                                          | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | rwlock_instances                                     | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | setup_actors                                         | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | setup_consumers                                      | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | setup_instruments                                    | PRIMARY KEY     | YES      |
| def                | performance_schema | OBJECT          | performance_schema | setup_objects                                        | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | setup_threads                                        | PRIMARY KEY     | YES      |
| def                | performance_schema | OBJECT          | performance_schema | table_io_waits_summary_by_index_usage                | UNIQUE          | YES      |
| def                | performance_schema | OBJECT          | performance_schema | table_io_waits_summary_by_table                      | UNIQUE          | YES      |
| def                | performance_schema | OBJECT          | performance_schema | table_lock_waits_summary_by_table                    | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | threads                                              | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_stages_current                                | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_stages_history                                | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_stages_summary_by_thread_by_event_name        | PRIMARY KEY     | YES      |
| def                | performance_schema | ACCOUNT         | performance_schema | events_stages_summary_by_account_by_event_name       | UNIQUE          | YES      |
| def                | performance_schema | USER            | performance_schema | events_stages_summary_by_user_by_event_name          | UNIQUE          | YES      |
| def                | performance_schema | HOST            | performance_schema | events_stages_summary_by_host_by_event_name          | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_stages_summary_global_by_event_name           | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_statements_current                            | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_statements_history                            | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_statements_summary_by_thread_by_event_name    | PRIMARY KEY     | YES      |
| def                | performance_schema | ACCOUNT         | performance_schema | events_statements_summary_by_account_by_event_name   | UNIQUE          | YES      |
| def                | performance_schema | USER            | performance_schema | events_statements_summary_by_user_by_event_name      | UNIQUE          | YES      |
| def                | performance_schema | HOST            | performance_schema | events_statements_summary_by_host_by_event_name      | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_statements_summary_global_by_event_name       | PRIMARY KEY     | YES      |
| def                | performance_schema | SCHEMA_NAME     | performance_schema | events_statements_summary_by_digest                  | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_statements_summary_by_program                 | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_statements_histogram_global                   | PRIMARY KEY     | YES      |
| def                | performance_schema | SCHEMA_NAME     | performance_schema | events_statements_histogram_by_digest                | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_transactions_current                          | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_transactions_history                          | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_transactions_summary_by_thread_by_event_name  | PRIMARY KEY     | YES      |
| def                | performance_schema | ACCOUNT         | performance_schema | events_transactions_summary_by_account_by_event_name | UNIQUE          | YES      |
| def                | performance_schema | USER            | performance_schema | events_transactions_summary_by_user_by_event_name    | UNIQUE          | YES      |
| def                | performance_schema | HOST            | performance_schema | events_transactions_summary_by_host_by_event_name    | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | events_transactions_summary_global_by_event_name     | PRIMARY KEY     | YES      |
| def                | performance_schema | USER            | performance_schema | events_errors_summary_by_user_by_error               | UNIQUE          | YES      |
| def                | performance_schema | HOST            | performance_schema | events_errors_summary_by_host_by_error               | UNIQUE          | YES      |
| def                | performance_schema | ACCOUNT         | performance_schema | events_errors_summary_by_account_by_error            | UNIQUE          | YES      |
| def                | performance_schema | THREAD_ID       | performance_schema | events_errors_summary_by_thread_by_error             | UNIQUE          | YES      |
| def                | performance_schema | ERROR_NUMBER    | performance_schema | events_errors_summary_global_by_error                | UNIQUE          | YES      |
| def                | performance_schema | USER            | performance_schema | users                                                | UNIQUE          | YES      |
| def                | performance_schema | ACCOUNT         | performance_schema | accounts                                             | UNIQUE          | YES      |
| def                | performance_schema | HOST            | performance_schema | hosts                                                | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | socket_instances                                     | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | socket_summary_by_instance                           | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | socket_summary_by_event_name                         | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | session_connect_attrs                                | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | session_account_connect_attrs                        | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | memory_summary_global_by_event_name                  | PRIMARY KEY     | YES      |
| def                | performance_schema | ACCOUNT         | performance_schema | memory_summary_by_account_by_event_name              | UNIQUE          | YES      |
| def                | performance_schema | HOST            | performance_schema | memory_summary_by_host_by_event_name                 | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | memory_summary_by_thread_by_event_name               | PRIMARY KEY     | YES      |
| def                | performance_schema | USER            | performance_schema | memory_summary_by_user_by_event_name                 | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | table_handles                                        | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | metadata_locks                                       | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | data_locks                                           | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | replication_connection_configuration                 | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | replication_connection_status                        | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | replication_applier_configuration                    | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | replication_applier_status                           | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | replication_applier_status_by_coordinator            | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | replication_applier_status_by_worker                 | PRIMARY KEY     | YES      |
| def                | performance_schema | OWNER_THREAD_ID | performance_schema | prepared_statements_instances                        | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | prepared_statements_instances                        | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | user_variables_by_thread                             | PRIMARY KEY     | YES      |
| def                | performance_schema | ACCOUNT         | performance_schema | status_by_account                                    | UNIQUE          | YES      |
| def                | performance_schema | HOST            | performance_schema | status_by_host                                       | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | status_by_thread                                     | PRIMARY KEY     | YES      |
| def                | performance_schema | USER            | performance_schema | status_by_user                                       | UNIQUE          | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | global_status                                        | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | session_status                                       | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | variables_by_thread                                  | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | global_variables                                     | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | session_variables                                    | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | persisted_variables                                  | PRIMARY KEY     | YES      |
| def                | performance_schema | PRIMARY         | performance_schema | user_defined_functions                               | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | db                                                   | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | user                                                 | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | default_roles                                        | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | role_edges                                           | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | global_grants                                        | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | password_history                                     | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | func                                                 | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | plugin                                               | PRIMARY KEY     | YES      |
| def                | mysql              | name            | mysql              | help_topic                                           | UNIQUE          | YES      |
| def                | mysql              | PRIMARY         | mysql              | help_topic                                           | PRIMARY KEY     | YES      |
| def                | mysql              | name            | mysql              | help_category                                        | UNIQUE          | YES      |
| def                | mysql              | PRIMARY         | mysql              | help_category                                        | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | help_relation                                        | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | servers                                              | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | tables_priv                                          | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | columns_priv                                         | PRIMARY KEY     | YES      |
| def                | mysql              | name            | mysql              | help_keyword                                         | UNIQUE          | YES      |
| def                | mysql              | PRIMARY         | mysql              | help_keyword                                         | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | time_zone_name                                       | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | time_zone                                            | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | time_zone_transition                                 | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | time_zone_transition_type                            | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | time_zone_leap_second                                | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | procs_priv                                           | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | component                                            | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | slave_relay_log_info                                 | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | slave_master_info                                    | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | slave_worker_info                                    | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | gtid_executed                                        | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | replication_asynchronous_connection_failover         | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | replication_asynchronous_connection_failover_managed | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | replication_group_member_actions                     | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | replication_group_configuration_version              | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | server_cost                                          | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | engine_cost                                          | PRIMARY KEY     | YES      |
| def                | mysql              | PRIMARY         | mysql              | proxies_priv                                         | PRIMARY KEY     | YES      |
| def                | sys                | PRIMARY         | sys                | sys_config                                           | PRIMARY KEY     | YES      |
| def                | sqlexercise1       | PRIMARY         | sqlexercise1       | p                                                    | PRIMARY KEY     | YES      |
| def                | sqlexercise1       | PRIMARY         | sqlexercise1       | j                                                    | PRIMARY KEY     | YES      |
| def                | sqlexercise1       | PRIMARY         | sqlexercise1       | s                                                    | PRIMARY KEY     | YES      |
| def                | lecture            | PRIMARY         | lecture            | empkey                                               | PRIMARY KEY     | YES      |
| def                | lecture            | PRIMARY         | lecture            | emp1                                                 | PRIMARY KEY     | YES      |
+--------------------+--------------------+-----------------+--------------------+------------------------------------------------------+-----------------+----------+
137 rows in set (0.14 sec)


mysql> select * from information_schema.table_constraints
    -> where table_schema = 'cdac';
Empty set (0.00 sec)

mysql> select * from information_schema.table_constraints
    -> where table_schema = 'empkey';
Empty set (0.00 sec)

mysql> select * from information_schema.key_column_usage
    -> where table_name = 'emp1';
+--------------------+-------------------+-----------------+---------------+--------------+------------+-------------+------------------+-------------------------------+-------------------------+-----------------------+------------------------+
| CONSTRAINT_CATALOG | CONSTRAINT_SCHEMA | CONSTRAINT_NAME | TABLE_CATALOG | TABLE_SCHEMA | TABLE_NAME | COLUMN_NAME | ORDINAL_POSITION | POSITION_IN_UNIQUE_CONSTRAINT | REFERENCED_TABLE_SCHEMA | REFERENCED_TABLE_NAME | REFERENCED_COLUMN_NAME |
+--------------------+-------------------+-----------------+---------------+--------------+------------+-------------+------------------+-------------------------------+-------------------------+-----------------------+------------------------+
| def                | lecture           | PRIMARY         | def           | lecture      | emp1       | deptno      |                1 |                          NULL | NULL                    | NULL                  | NULL                   |
| def                | lecture           | PRIMARY         | def           | lecture      | emp1       | empno       |                2 |                          NULL | NULL                    | NULL                  | NULL                   |
+--------------------+-------------------+-----------------+---------------+--------------+------------+-------------+------------------+-------------------------------+-------------------------+-----------------------+------------------------+
2 rows in set (0.15 sec)

mysql> select * from INDexTAble;
+-------+-------+-------+------+--------+
| ROWId | EMPNO | ENAME | SAL  | DEPTNO |
+-------+-------+-------+------+--------+
| X001  |     5 | A     | 5000 |      1 |
| X002  |     4 | A     | 6000 |      1 |
| X003  |     1 | C     | 7000 |      1 |
| X004  |     2 | D     | 9000 |      2 |
| X005  |     3 | E     | 8000 |      2 |
+-------+-------+-------+------+--------+
5 rows in set (0.14 sec)


SURROGATE KEY-> is not a constraint
SURROGATE KEY-> is a definition
SURROGATE KEY-> if you 
SURROGATE KEY->

***Not NULL ***
* null values are not allowed(is a mandaotry column)(similar to PK)
* Duplicate values are not allowed(unlike PK)
* you can have a composite not null constaint (unlike PK)
*

eg
 mysql> create table emp11
    ->  (
    ->  empno char(4),
    ->  ename varchar(25) not null,
    ->  sal float not null,
    ->  deptno int
    ->  );
Query OK, 0 rows affected (0.69 sec)

mysql> desc emp11;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| empno  | char(4)     | YES  |     | NULL    |       |
| ename  | varchar(25) | NO   |     | NULL    |       |
| sal    | float       | NO   |     | NULL    |       |
| deptno | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
4 rows in set (0.10 sec)
 
* IN MySQL, nullability is a part of the datatype;
*:- to see the not null column:-
*:- to add the not null constraint afterwards to an existing table:-
 alter table emp11 modify ename varchar(25)not null;
 
*:- to drop the not null constaint:-
 after table emp11 modify ename varchar(25)null; 
solution for candidate key columns;- 
not null constaint * unique index 
 *	with the help of above, you can 'indirectly' have multiplication 



-------------------------------***------------------------------------



======================================================================

======================================================================

-------------------------------***------------------------------------
