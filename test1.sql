★ SQL문
1. 데이타 조작어(DML : Data Manipulation Language)
    : insert, update, delete, merge
2. 데이타 정의어(DDL : Data Definition Language)
    : create, alter, drop, rename, truncate    
3. 데이타검색
    : select 
4. 트랜젝션제어
    : commit, rollback, savepoint
5. 데이타 제어어(DCL : Data Control Language)
    : grant,  revoke

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
[형식]
 select [distinct] [컬럼1,컬럼2,.....][as 별명][ || 연산자][*]
 from 테이블명
 [where 조건절] 

distinct : 중복제거
* : 모든
조건절 : and,or,like,in,between and,is null,is not null
==================================================================================
select * from tab;         -- 테이블 목록확인하기
select * from EMP;   --employees테이블의 내용확인하기
select * from departments; 

--ex1)employees테이블의 모든 사원의 사원번호,이름(last_name),급여 검색
select EMPLOYEE_ID , LAST_NAME, SALARY from EMPLOYEES;


--ex2)employees테이블에서 모든 사원의 이름, 입사일, 업무ID 만 검색
select HIRE_DATE , LAST_NAME, JOB_ID from EMPLOYEES;

--ex3)employees테이블에서 모든 사원의 이름(last_name), 연봉(salary*12)만 검색
select LAST_NAME, salary*12 from EMPLOYEES;



--ex4)별명붙이기(as는 생략가능)
--    employees테이블의 모든 사원의 사원번호,이름(last_name),급여 검색
--    조건) title 사원번호, 이름 ,급여로 출력할것

select employee_id 사원번호, last_name 이름, salary 급여
from employees;

--ex5) employee테이블에서 사원번호,이름,연봉을 구하시오
--     조건1) 연봉 = 급여 * 12
--     조건2) 제목을 사원번호, 이름,연봉으로 출력
select  employee_id 사원번호, last_name 이름, salary*12 연봉
from employees;

--ex6) 연결연산자( || ) : 컬럼을 연결해서 출력
--    first_name과  last_name을 연결해서 출력하시오
--     이   름
--     ------------
--     Ellen   Abel

select first_name ||' '|| last_name fullname
from employees;
--ex7) 다음처럼 출력하시오
--   사원번호    이  름        연 봉
--   ---------------------------------------------
--    100      Steven King   288000달러 

select employee_id 사원번호,first_name ||' '|| last_name "이 름", salary*12 || '달러'   as 연봉
from employees;



--ex8) 다음처럼 출력하시오 (last_name, job_id이용)
--     Employee  Detail
--     --------------------
--     King  is a  AD_PRES
select last_name ||  'is a'  || job_id as "Detail"
from employees;

--중복제거(distinct)
--ex9)employees테이블에서 부서를 출력하시오
--    조건1)중복되는 부서는 1번만 출력하시오
--    조건2)부서별 오름차순으로 보여주시오
select distinct department_id from employees
order by DEPARTMENT_id asc;

--ex10) 10번부서 또는 90번부서 사원들의 이름,입사일,부서ID를 출력하시오

select  department_id ,last_name,hire_date
from employees
where department_id = 10 or department_id = 90;



--ex11)급여가 2500이상 3500미만인 사원의 이름(last), 입사일, 급여를 검색하시오
select  department_id ,last_name,salary
from employees
where salary >=2500 and salary<3500;



--ex12) 급여가 2500이하 이거나 3000이상이면서, 90번 부서인 사원의 이름, 급여, 부서ID를 출력하시오.
--      조건1) 제목은 사원명, 월  급, 부서코드로 하시오
--      조건2) 급여앞에 $를 붙이시오
--      조건3) 사원명은 first_name과 last_name을 연결해서 출력하시오
select  department_id as "부서코드" ,first_name|| '  '|| last_name as "사원명",salary || '$' as "월 급"
from employees
where (salary <=2500 or salary>=3000) and department_id = 90;




--ex13) 'King'사원의 모든 컬럼을 표시하시오
select * 
from employees
where last_name='King';   -->문자열검색할때 대.소문자를 구분

SELECT *
FROM EMPLOYEES
WHERE UPPER(LAST_NAME)='KING';   --->문자열을 대문자로

SELECT *
FROM EMPLOYEES
WHERE LOWER(LAST_NAME)='king';   --->문자열을 소문자로

-- like  : 문자를 포함
-- '%d'      d로 끝나는 
-- 'a%'      a로 시작하는
-- '%test%'   test가 포함되어있는
-- 예)  select * from employees where first_name like '%net%';
--ex14)업무ID에 CL이 포함되어있는 사원들의 이름,업무ID,부서ID를 출력하시오  --45건
select last_name, department_id , job_id
from EMPLOYEES
where job_id like '%CL%';

--ex15) 업무ID가  IT로 시작하는 사원들의 이름,업무ID,부서ID를 출력하시오  -- 5건
select last_name, department_id , job_id
from EMPLOYEES
where job_id like 'IT%';


--ex16) is null / is not null 
--커미션을 받는 사원들의 이름과 급여,커미션을 출력하시오 -- 35건
select last_name, salary, commission_pct
from employees
where commission_pct is not null;


--ex17)커미션을 받지 않는 사원들의 이름과 급여,커미션을 출력하시오 -- 72건
select last_name, salary, commission_pct
from employees
where commission_pct is  null;


--ex18) in연산자(or연산자의 다른표현)
--업무ID가  FI_MGR이거나  FI_ACCOUNT인 사원들의 사원번호,이름,직무를 출력하시오   --6건



--방법1
select last_name,employee_id,job_id
from employees
where job_id = 'FI_MGR' or job_id = 'FI_ACCOUNT';


--방법2
select last_name,employee_id,job_id
from employees
where job_id in( 'FI_MGR' ,'FI_ACCOUNT');



--ex19) between연산자(and연산자의 다른 표현) : 초과,미만에서는 사용할수 없다
--급여가  10000이상  20000이하인 사원의 사원번호,이름,급여를 출력하시오   --18건

--방법1
select last_name,employee_id,salary
from employees
where salary>=10000 and salary <=20000;


--방법2

select last_name,employee_id,salary
from employees
where salary between 10000 and 20000;

--[문제1] 업무ID가 'SA_REP' 이거나 'AD_PRES' 이면서, 급여가 15000를 초과하는 
--사원들의 이름,업무ID,급여를 출력하시오
--이름        업무ID            급  여
-- --------------------------------------
--King       AD_PRES            24000원
select last_name,job_id,salary
from employees
where job_id in('SA_REP','AD_PRES')and salary>15000;


------------------------------------------------------------------------------
--[문제2] Employees테이블의 업무ID가 중복되지 않게 표시하는 질의를 작성하시오
-- JOB_ID
-- ---------
--AC_ACCOUNT
--AC_MGR
--     :

select distinct job_id
from employees



-----------------------------------------------------------------------------
--[문제3] 입사일이 03년인 사원들의 사원번호,이름,입사일을 표시하시오


SELECT hire_date
     
  FROM employees
where hire_date like '03%';

