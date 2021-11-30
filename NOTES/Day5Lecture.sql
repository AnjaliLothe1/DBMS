/*MySQL SQL-- GROUP Y clause()*/
show databases;
create database Lecture;
use lecture;

create table EMP(EMPNO INT, ENAME VARCHAR(20), SAL INT, DEPTNO VARCHAR(20), JOB VARCHAR(20), MGR INT);
INSERT into emp values(1,'Arun', 8000, 1,'M' ,4),
(2, 'Ali' ,7000 ,1 ,'C' ,1),
(3, 'Kirun', 3000 ,1,'C', 1),
(4, 'Jack', 9000 ,2 ,'M', null),
(5,'Thomas', 8000, 2 ,'C', 4);

-- select clause ----> select deptno, sum(sal);
-- FROM clause ------> from emp;
-- group by clause --> group by deptno;

select count(*), min(sal),max(sal),sum(sal) from emp;

select count(deptno), sum(sal) from emp;
 
-- # Rule no 1:


/*GROUP BY clause: - (used for grouping)*/
