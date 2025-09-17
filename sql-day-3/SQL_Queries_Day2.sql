use dac_dbt_202

select empname from emp 
where deptcode='ACCT' 
union 
select empname from emp where deptcode='PRCH';

select empname,timestampdiff(year,birthdate,curdate()) 
as age from emp order by birthdate ASC;

select empname, timestampdiff(year,birthdate,curdate()) as
age, gradecode,gradelevel 
from emp 
order by 
gradecode desc,
gradelevel desc;

select deptcode,empname from emp 
where deptcode not in('ACCT','PRCH')
select deptcode,empname from emp 
where deptcode='ACCT' and not 'PRCH';

select gradecode,max(basic),min(basic) from
grade 
group by gradecode 
order by gradecode; 

select supcode,count(*) 
from emp 
group by supcode 
having count(*)>3

SELECT S.empname AS SupervisorName, 
S.empcode AS SupervisorCode, 
COUNT(E.empcode) AS EmployeeCount
FROM emp E
JOIN emp S ON E.supcode = S.empcode
GROUP BY S.empname, S.empcode;
 

order by supcode;

