--QUESTION(함수)
--1. 사원 테이블에서 사원이름을 첫글자는 대문자로, 나머지는 소문자로 출력하라
-- [결과]       사원이름
--           ---------------------
--             Smith
select INITCAP(ename) as "사원이름"
from emp





--2. 사원테이블에서 사원이름을 뽑고 또 이름의 두번째 글자부터 네번째 글자까지
-- 출력하라.
-- [결과]  사원이름    2-4문자
--         ---------------------
--        SMITH        MIT

select ename,
	substr(ename,2,3) as "2-4문자"
from emp

--3. 사원테이블의 사원 이름의 철자 개수를 출력하라.
select count(ename), ename
from emp
group by ename

--4. 사원테이블에서 사원 이름의 앞 글자 하나와 마지막 글자 하나만 출력하되 
--   모두 소문자로 각각 출력하라.
select ename,
	lower(substr(ename,1,1)) as "앞글자",
	lower(substr(ename,-1)) as "마지막글자"
from emp

--5. 3456.78의 소수점 첫번째 자리에서 반올림하라.
select round(3456.78,1) from dual

--6. 3의 4제곱을 구하고, 64의 제곱근을 구하라.
select power(3,4) from dual;

select sqrt(64) from dual;
--7. 오늘날짜와 오늘날짜에서 10일을 더한 날짜를 출력하라.
select sysdate +10 from dual
--8. 국제 표준으로 현재 날짜를 출력하라.
select sysdate from dual
--9. 사원테이블에서 사원이름과 사원들의 오늘 날짜까지의 근무일수를 구하라.
--사원이름   근무일수
-- -----------------------
--	SMITH	12628
--	ALLEN	12563
--	WARD	12561
--	JONES	12522
--	MARTIN	12343
--	BLAKE	12523
--	CLARK	12462
--	SCOTT	11967
--	KING	12293
--	TURNER	12363
--	ADAMS	11872
--	JAMES	12338
--	FORD	12338
--	MILLER	12226

select * from emp

select ename as "사원이름",
	trunc(sysdate -hiredate) as "근무일수"
from emp
--10. 위 문제에서 근무일수를 00년 00개월 00일 근무하였는지
--확인할 수 있도록 변환하라.(단, 한 달을 30일로 계산하라)
--  [결과]
--   사원이름       근무일수
-- --------------------------------
--	SMITH	34년 07개월 05일
--	ALLEN	34년 05개월 01일
--	WARD	34년 04개월 30일
--	JONES	34년 03개월 21일
--	MARTIN	33년 09개월 24일
--	BLAKE	34년 03개월 22일
--	CLARK	34년 01개월 20일
--	SCOTT	32년 09개월 13일
--	KING	33년 08개월 04일
--	TURNER	33년 10개월 13일
--	ADAMS	32년 06개월 10일
--	JAMES	33년 09개월 19일
--	FORD	33년 09개월 19일
--	MILLER	33년 05개월 29일

select ename,
to_char(to_date(sysdate-hiredate),'YYYY"년"fmMM"월"fmDD"일"') from emp


















