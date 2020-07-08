※ select 
select [distinct] [컬럼1,컬럼2,.....][as 별명][ || 연산자][*]  --- 6
from 테이블명     --- 1
[where 조건절]    --- 2
[group by컬럼명]  --- 3
[having 조건절]   --- 4
[order by 컬럼명 asc|desc ]  --- 5

group by : 그룹함수(max,min,sum,avg,count..)와 같이 사용
having : 묶어놓은 그룹의 조건절
==================================================================================
--ex1) 사원테이블에서 급여의 평균을 구하시오
--     조건)소수이하는 절삭,세자리마다 콤마(,)
--     사원급여평균
--     ------------
--            6,461
select to_char(trunc(avg(salary)),'99,999')
from employees


--ex2) 부서별로 급여평균을 구해서 부서ID, 급여평균을 출력하시오
select department_id ,to_char(trunc(avg( salary)),'99,999')
from employees
group by department_id
order by department_id;


--ex3) 업무ID별 급여의 합계를 구해서 업무ID, 급여합계를 출력하시오
select job_id ,to_char(sum( salary),'99,999,999')
from employees
group by job_id
order by job_id;




--ex4) 부서별 급여평균을 구해서 사원명,부서별 급여평균을 출력하시오 (X)
select job_id ,department_id,to_char(sum( salary),'99,999,999')
from employees
group by department_id;




--ex5) group by / having절
-- 부서별 급여평균을 구해서 평균급여가  6000이상인 부서만 출력  (8 레코드)
-- (평균급여는 소수점 이하 절삭)
--      부서ID   평균급여
--     -----------------------
--        100       8600
select department_id, trunc(avg(salary)) 
from employees
group by department_id
having avg(salary) >=6000
order by 1;




--ex6)부서별 급여평균을 구하시오
--    조건1) 소수이하는 반올림
--    조건2) 세자리마다콤마, 화페단위 ￦를 표시
--    조건3)  부서코드        평균급여
--           ---------------------------
--             10              ￦8,600
--    조건4) 부서별로 오름차순정렬하시오 
--    조건5) 평균급여가 5000이상인 부서만 표시하시오
select department_id as "부서코드", to_char(round(avg(salary),-2),'L99,999,999') as "평균급여"
from employees
group by department_id
having avg(salary) >=5000
order by 1;





--ex7) 비효율적인 having절
--10과 20 부서에서 최대급여를 받는사람의 급여를 구하시오, 부서별로 오름차순 정렬하시오
--department_id     max_salary
-----------------------------
-- 10                    4400
-- 20                    13000 

--(효율적방법)
select department_id, max(salary) as "max_salary"
from employees
where  department_id in(10,20)
group by department_id
order by 1




--(비효율적방법)
select department_id, max(salary) as "max_salary"
from employees
group by department_id
having department_id in(10,20)
order by 1


--ex8) having절 (where + group by + having)
--10과 20 부서에서 최대급여를 받는사람의 급여를 구하시오.  --1건
--[조건1] 부서별로 오름차순 정렬하시오
--[조건2] 최대급여가 5000이상인 부서만 출력하시오
--         department_id     max_salary
--         -----------------------------------
--           20                    13000 

select department_id , max(salary) as "max_salary"
from employees
where department_id in(10,20)
group by department_id
having max(salary) >= 5000




--ex9) 20~80번 부서별로  급여를 가장 적게 받는 사원의 급여를 출력하시오 --7건
--      부서별 오름차순으로 할것
--      [출력]    department_id     min_salary

--(효율적방법)
select department_id, min(salary) as "min_salary"
from employees
where department_id between 20 and 80
group by department_id
order by department_id;



--(비효율적방법)


=======================================================================================
[조인(join)]

(employees)           (departments)                (join)
사       부                부        부              사     부    부
원       서    +          서        서     =       원     서    서
이       번                번        이              이     번    이
름       호                호        름              름     호    름

※종류
0. natural join(자연조인) : 같은컬럼이 여러개 있을때 같은 컬럼 모두를 and연산해서 연결
1. Inner join(내부조인) : 같은것 끼리만 연결
2. Outer join(외부조인) : 한쪽을 기준(모두포함)해서 연결
                                   left  join : 왼쪽컬럼 모두포함
                                   right join : 오른쪽컬럼 모두포함
3. full join : 왼쪽,오른쪽 모두 포함
4. self join : 자기자신 테이블과 연결
5. cross join : 모든 경우의 수로 연결
6. non equijoin : 범위에 속하는지 여부를 확인
7. n개 테이블 조인 : 여러개의 테이블 조인

※방법
1. 오라클 구문전용
2. Ansi표준구문


select * from employees;    --107 (부서없는 사원 1명)
select * from departments;  --27

--ex1) inner join : 같은것끼리만 조인
--사원테이블과 부서테이블에서 부서가 같을경우 사원번호,부서번호,부서이름을 출력하시오  -- 106건

--방법1(오라클전용구문)
select employee_id, employees.department_id, department_name
from employees , departments 
where employees.department_id = departments.department_id;
-- emp depart 의 데이터가 같으면 합친다 

--방법2(오라클전용구문)


--방법3(Ansi표준)

select employee_id, department_id, department_name
from employees
inner join departments using(department_id); 
-- 데이터에서 컬럼 사용


--ex2)부서테이블과 위치테이블을 연결하여 부서가 위치한 도시를 알아내시오(inner join)
--     (departments, locations)
--  department_id     city
----------------------------------
--  10                   Seattle

select * from departments;
select * from locations;

--오라클표준


--Ansi표준
select department_id ,city
from departments
inner join locations using(location_id);

--ex3) outer join(left) : 왼쪽 테이블은 모두포함하여 조인
--사원테이블과 부서테이블에서 부서번호가 같은 사원을 조인하시오 ==> 107레코드
--조건 1) 사원이름, 부서ID, 부서이름을 출력하시오
--조건 2) 사원테이블의 모든 사원을 포함하시오

--방법1(오라클전용구문)


--방법2(ansi표준)
select last_name, department_id, department_name
from employees
left join departments using(department_id); 



--ex4) outer join(right) : 오른쪽 테이블은 모두포함하여 조인
--사원테이블과 부서테이블에서 부서번호가 같은 사원을 조인하시오 ===> 122레코드
--조건 1) 사원이름, 부서ID, 부서이름을 출력하시오
--조건 2) 부서테이블의 모든 부서를 포함하시오

--방법1(오라클전용구문)

select employee_id, employees.department_id, department_name
from employees , departments 
where employees.department_id(+) = departments.department_id;

--방법2(ansi표준)

select employee_id, department_id, department_name
from employees
right join departments using(department_id); 


--ex5) full join : 왼쪽,오른쪽 테이블을 모두포함하여 조인
--사원테이블과 부서테이블에서 부서번호가 같은 사원을 조인하시오 ===> 123레코드
--조건 1) 사원이름, 부서ID, 부서이름을 출력하시오
--조건 2) 사원데이블의 모든사원과 부서테이블의 모든 부서를 포함하시오

--방법1(오라클전용구문)
  X

--방법2(ansi표준)
select employee_id, department_id, department_name
from employees
full join departments using(department_id); 


select * from locations;

select * from departments;
--ex6) departments 와  locations 자연조인의 비교(같은컬럼 : location_id)  ==> 27레코드
--        두개의 테이블을 연결해서 부서위치(location_id), 도시(city), 부서이름(department_name)을 출력하시오

--방법1(natural  join)


--방법2(inner join)
select location_id, city, department_name
from departments
join locations using(location_id)


--ex7) inner join,  natural join : 두개의 컬럼이 일치하는경우
--        부서ID와 매니저ID가  같은 사원을 연결하시오
--       (관련테이블 : departments, employees)  : 32 레코드

--        last_name     department_id   manager_id
--        ------------------------------------------

--방법1(오라클전용구문)
select last_name, e.department_id,e.manager_id
from employees e , departments d 
where e.department_id = d.department_id and e.manager_id = d.manager_id;

--방법2(ansi표준)
select last_name, department_id,manager_id
from employees
join departments using(department_id,manager_id)


--방법3(natural조인이용)


--ex8) 내용은 같은데 컬럼명이 다른경우에 조인으로 연결하기
--       departments(location_id) , locations2(loc_id)
        
--      부서ID    부서명             도시
--      -----------------------------------------------------
--      60	      IT	             Southlake
--      50	     Shipping	South San Francisco
--      10	     Administration	Seattle


create table locations2 
as select * from locations;     -- 테이블복사

select * from tab;
select * from locations2;

alter table locations2 rename column location_id to loc_id;   
--location_id를 loc_id로 변경

--방법1(오라클표준)
SELECT DEPARTMENT_ID , DEPARTMENT_NAME,CITY
FROM DEPARTMENTS , LOCATIONS2
WHERE DEPARTMENTS.LOCATION_ID = LOCATIONS2.LOC_ID


--방법2(Ansi표준)

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, CITY
FROM DEPARTMENTS
JOIN LOCATIONS2 ON(LOCATION_ID = LOC_ID)
--컬럼명이 다를때는 ON 을써서 같다고 선언해준다



--ex9) self 조인 : 자기자신의 테이블과 조인하는경우
--        사원과 관리자를 연결하시오, 모든 사원을 표시하시오

--        사원번호   사원이름      관리자
--        ----------------------------------
--        101      Kochhar      King   

select * from emp;
--방법1(오라클표준)
select e.employee_id, e.last_name, m.last_name
from employees e, employees m
where e.manager_id = m.employee_id(+);

--방법2(Ansi표준)
select e.employee_id as "사원번호", e.last_name as "사원이름", m.last_name as "관리자"
from employees e
left join employees m on(e.manager_id = m.employee_id)


--ex10) cross join: 모든행에 대해 가능한 모든조합을 생성하는 조인
select count(*) from countries;     -- 25
select count(*) from locations;     -- 23

select * from countries; 
select * from locations; 

--방법1(오라클표준)
--행수변경 : 도구->환경설정->데이터베이스->고급->SQL배열 인출크기 : 1000
select * from countries,locations;  <--- 575 레코드

--방법2(Ansi표준)


--ex11) Non Equijoin (넌 이큐조인) 
--        : 컬럼값이 같은경우가 아닌 범위에 속하는지 여부를 확인할때
--        [형식]  on ( 컬럼명 between 컬럼명1 and 컬럼명2)

create table salgrade(
salvel varchar2(2),
lowst number,
highst number);

insert into salgrade values('A',20000,29999);
insert into salgrade values('B',10000,19999);
insert into salgrade values('C',0,9999);
commit;

select * from salgrade;
select * from tab;



--ex12) 자신이 받는 급여가 어느등급인지를 확인하시오
--    조건1) 타이틀은 사원이름, 급여, 급여등급
--    조건2) 급여별 내림차순으로 정렬하시오
--           사원이름       급여      급여등급
--           ------------------------------------
--            King	       24000	       A
--            De Haan      17000	       B

select last_name as "사원등급", salary as "급여", salvel as "등급"
from employees
left join salgrade on(salary between lowst and highst )
order by 2 desc

--ex13) n(여러)개의 테이블은 조인
--업무ID같은 사원들의 사원이름,업무내용,부서이름을 출력하시오
--(employees, jobs,departments테이블을 조인)

--[분석]
--employees           jobs            departments
----------------------------------------------------
--department_id      job_id          department_id
--job_id

--[조건]
--1. 부서이름 정렬후 같은 부서이름인 경우 업무명으로 오름차순 정렬하시오
--2. 사원이름, 부서이름, 업무명의 이름으로 출력하시오

--[출력]
--사원이름      부서이름                 업무명    ===> employees   departments   jobs
----------------------------------------------------
--Higgins	Accounting Manager	 Accounting
--Gietz		Public Accountant	 Accounting

------------------------------------------------------------------------------------
--[문제1] manager_id가 같은 사원을 조인하여 
--        이름(last_name), 부서이름, 매니저ID를 출력하시오   -4건
--        (관련테이블 : employees, departments)

--  조건1)부서이름이 IT인 사원만 출력하시오
--  조건2)이름별로 오름차순 출력하시오
--  조건3)Ansi표준을 이용하여 join하시오

--  이름   부서이름   매니저ID
--  ----------------------------
--Austin	IT	103
--Ernst	IT	103
--Lorentz	IT	103
--Pataballa	IT	103


------------------------------------------------------------------------------------
--[문제2] 부서테이블과 위치테이블을 조인하여 도시를 알아내시오   --21건
--        (관련테이블 : departments, locations)

--조건1) 도시가 'Seattle'만 출력하시오
--조건2) 부서ID별 내림차순 정렬하시오

-- department_id      city
-- -----------------------------
-- 10                      Seattle

select * from locations;
select * from departments;


------------------------------------------------------------------------------------
--[문제3] 부서번호가 같은 사원을 Ansi표준으로 조인하시오  --9건
--        (관련테이블 : departments, employees)
--  조건1) 타이틀은  사원이름(last_name), 부서ID, 부서이름으로 출력하시오
--  조건2) 부서번호가 30번 또는 90번인 사원들만 출력하시오
--  조건3) 사원이름별 오름차순 정렬하시오


------------------------------------------------------------------------------------
--[문제4] 위치ID를 연결해서 사원이름,도시,부서이름을 출력하시오  ==> 52레코드
--        (관련테이블 : employees, locations2, departments)

--	조건1 : 사원이름 ,도시,부서이름로 제목을 표시하시오	
--	조건2 : Seattle 또는 Oxford 에서 근무하는 사원
--	조건3 : 도시순으로 오름차순정렬하시오 
--	조건4 : 모든 사원을 포함한다

--  사원이름      도    시     부서이름
-- ----------------------------------
--   Hall        Oxford       Sales

--[분석]
--employees                departments            locations2
-- -----------------------------------------------------------
--department_id            department_id
--                               location_id              loc_id            


------------------------------------------------------------------------------------
--[문제5] 부서ID,나라ID,부서위치를 연결해서 다음과 같이 완성하시오   -- 1 레코드
--        (관련테이블 : employees,locations2, departments,countries)
--      조건1 : 사원번호,사원이름,부서이름,도시,도시주소(street_address),나라명로 제목을 표시하시오
--      조건2 : 도시주소에  Vi 또는 St가 포함되어 있는 데이터만 표시하시오
--      조건3 : 나라명, 도시별로 오름차순정렬하시오
--      조건4 : 모든사원을 포함한다











