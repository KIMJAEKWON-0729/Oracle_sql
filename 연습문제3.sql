--QUESTION (group/having)
--1. 사원테이블에서 부서별 최대 월급을 출력하라.
select deptno ,max(sal)
from emp 
group by deptno


--2. 사원테이블에서 직위별 최소 월급을 구하되 직위가  CLERK인 것만 출력하라. (having절 이용)
select job ,min(sal)
from emp 
group by job
having job = 'CLERK'



--3. 커미션이 책정된 사원은 모두 몇 명인가?
select ename
from emp
where comm is not null;


--4. 직위가 'SALESMAN'이고 월급이 1000이상인 사원의
-- 이름과 월급을 출력하라.
select ename, sal 
from emp 
where job = 'SALESMAN' and sal >=1000


--5. 부서별 평균월급을 출력하되, 평균월급가 2000보다
-- 큰 부서의 부서번호와 평균월급을 출력하라.
select job , trunc(avg(sal))
from emp
group by job
having avg(sal)>=2000


--6. 사원테이블에서 커미션을 가장 많이 받는 사원을 2순위까지
-- 출력하되 랭킹이 중복될 경우 동률처리를 하여 출력하라.
--    (rank() over(쿼리파티션)이용)
select ename, comm, rank
from (select ename, comm, rank()over(order by nvl(comm,0) desc) as rank from emp)
where rank<3;

--7. 직위가 MANAGER인 사원을 뽑는데 월급이 높은 사람
-- 순으로 이름, 직위, 월급을 출력하라.
select ename,job,sal,
       first_value(sal) over(partition by department_id order by salary desc)
       "부서별최고급여", department_id
from employees
order by department_id asc;



--8. 각 직위별로 총월급을 출력하되 월급이 낮은 순으로 출력하라.
select ename,job,
       first_value(sal) over(partition by job order by sal) "직위별 월급순위"
       
from emp



--9. 직위별 총월급을 출력하되, 직위가 'MANAGER'인 사원들은 제외하라. 
--   그리고 그 총월급이 5000보다 큰 직위와 총월급만 출력하라.

select job , sum(sal)
from emp
where job != 'MANAGER'
group by job
having sum(sal)> 5000


--10. 직위별 최대월급을 출력하되, 직위가 'CLERK'인 사원들은 제외하라. 
--그리고 그 최대월급이 2000 이상인 직위와 최대월급을 최대 월급이 
--높은 순으로 정렬하여 출력하라.

select job , max(sal)
from emp
where job != 'CLERK'
group by job
having max(sal)>= 2000
order by 2 desc;


