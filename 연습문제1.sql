--QUESTION
--1. 사원테이블에서 모든 데이터를 출력하라
select * from EMP;


--2. 사원테이블에서 사원번호, 사원이름, 월급을 출력하라
select EMPNO, ENAME, SAL
from EMP;

--3. 사원테이블에서 월급을 뽑는데 중복된 데이터가 없게 출력하라

select distinct SAL
from EMP;


--4. 사원테이블에서 사원이름과 월급을 출력하는데 각각의 컬럼명을
-- '이 름,'월 급'으로 바꿔서 출력하라. 단, ALIAS에 공백 추가

select ENAME as "이  름", SAL as "월  급"
from EMP;

--5. 사원테이블에서 사원이름, 월급을 뽑고, 월급과 커미션을  더한 값을
-- 출력하는데 컬럼명을 '실급여'이라고 해서 출력하라.
-- 단, NULL값은 나타나지 않게 하라(커미션 안받는사람제외)
select ENAME, SAL, SAL+ COMM  as "실급여"
from EMP
where COMM is not NULL;


--6. 사원테이블에서 'SCOTT'이라는 사원의 사원번호, 이름, 월급을 출력하라

select EMPNO,ENAME, SAL
from EMP
where ENAME ='SCOTT';

--7. 사원테이블에서 직위가 'SALESMAN'인 사원의 사원번호, 이름, 직위를
-- 출력하라
select EMPNO ,ENAME ,JOB
from EMP
where JOB = 'SALESMAN';

--8. 사원테이블에서 사원번호가 7499, 7521, 7654인 사원의 사원번호, 이름
-- 월급을 출력하라
select EMPNO, ENAME,SAL
from EMP
where EMPNO in(7499,7521,7654);

--9. 사원테이블에서 월급이 1500에서 3000사이인 사원의 사원번호, 이름,
-- 월급을 출력하라.
select EMPNO, ENAME,SAL
from EMP
where SAL between 1500 and 3000;



--10. 사원테이블에서 이름의 첫글자가 A이고 마지막 글자가 N이 아닌 사원의
-- 이름을 출력하라

select EMPNO, ENAME,SAL
from EMP
where (ENAME like 'A%' and ENAME not like '%N');



