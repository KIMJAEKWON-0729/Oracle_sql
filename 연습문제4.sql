--QUESTION(join)

--1. emp테이블을 이용합니다.
--직원의 이름, 월급여, 연봉을 조회하는 질의를 작성하시오.
--(단, 직원의 연봉은 $200의 월 보너스를 포함하여 계산합니다.)

--이름              월급여               연봉
---------------------------------------------------
--SMITH             800                 12000
--ALLEN            1600                 21600
--WARD             1250                 17400
select * from emp 

 to char '$99,999,999'sal*12 +(12*200)

--2.  emp테이블을 이용합니다.
--열이름이 Employee and Job Title이고, 콤마와 공백으로 구분된 직원이름과 
--직무를 연결되도록 하는 질의를 작성하시오.

--Employee and Job Title
---------------------------
--SMITH, CLERK
--ALLEN, SALESMAN
concat

--3.  emp테이블을 이용합니다.
--이름의 두번째 문자가 "A"인 모든 직원의 이름을 조회하는 질의를 작성하시오 
instr 2
--ENAME
----------
--WARD 
--MARTIN
--JAMES



--4.  emp테이블을 이용합니다.
--이름, 입사일, 입사한 요일을 조회하는 질의를 작성하시오
--입사한 요일을 기준으로 오름차순 정렬합니다.(이때 기준요일은 월요일로 합니다)
--(이때, 이름, 입사일 입사요일 별칭을 사용합니다.)

--이름              입사일          입사요일
---------------------------------------------------
--MARTIN          1981년9월28일        monday
--CLARK           1981년6월9일         tuesday

data formating  

--5.  emp테이블을 이용합니다.
--   모든 직원의 이름과 현재까지의 입사기간을 월단위(가장 가까운 월로 반올림할 것)로 
--   조회하는 질의를 작성하시오
--   (이때, 입사기간에 해당하는 열별칭은 "MONTHS WORKED"로 하고, 
--    입사기간이 가장 최근인 직원순으로 정렬합니다.)

--출력예)
--ENAME         MONTHS WORKED
--------------------------------
--ADAMS            284
--SCOTT            286
--MILLER           348


--6. emp테이블과 dept테이블을 이용합니다.
--보너스를 받는 모든 직원의 이름, 보너스, 부서이름, 위치를 조회하는 질의를 작성하시오.

--ENAME           COMM        DNAME         LOC
----------------------------------------------------
--KING	3500	ACCOUNTING	NEW YORK
--JONES	30	RESEARCH	DALLAS
--TURNER	0	SALES	CHICAGO
--MARTIN	300	SALES	CHICAGO
--WARD	200	SALES	CHICAGO
--ALLEN	300	SALES	CHICAGO         
select *from dept
select ename, comm, dname, loc
from emp
left join dept using(deptno)


--7.  emp,dept 테이블을 이용합니다.
--   NEW YORK에서 근무하는 모든 직원에 대해서 이름, 업무, 부서번호, 부서명을 
--   조회하는 질의를 작성하시오.

--ENAME             JOB          DEPTNO         DNAME       
--------------------------------------------------------------------
--CLARK             MANAGER       10        ACCOUNTING                
--KING              PRESIDENT       10        ACCOUNTING
--MILLER            CLERK             10        ACCOUNTING 

left join
--8. EMP 테이블을 이용합니다.
--  모든 직원의 이름과 해당 직원의 관리자 이름을 함께 조회하는 질의를 작성하시오
--  단, 관리자가 없는 경우는 ‘없음’으로 나타내고 관리자 이름으로 내림차순 정렬하시오.

--이름           담당관리자이름 
--------------------------------
--KING             없음
--ADAMS            SCOTT
--JONES            KING





