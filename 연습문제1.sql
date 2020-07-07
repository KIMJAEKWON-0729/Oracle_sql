--QUESTION
--1. ������̺��� ��� �����͸� ����϶�
select * from EMP;


--2. ������̺��� �����ȣ, ����̸�, ������ ����϶�
select EMPNO, ENAME, SAL
from EMP;

--3. ������̺��� ������ �̴µ� �ߺ��� �����Ͱ� ���� ����϶�

select distinct SAL
from EMP;


--4. ������̺��� ����̸��� ������ ����ϴµ� ������ �÷�����
-- '�� ��,'�� ��'���� �ٲ㼭 ����϶�. ��, ALIAS�� ���� �߰�

select ENAME as "��  ��", SAL as "��  ��"
from EMP;

--5. ������̺��� ����̸�, ������ �̰�, ���ް� Ŀ�̼���  ���� ����
-- ����ϴµ� �÷����� '�Ǳ޿�'�̶�� �ؼ� ����϶�.
-- ��, NULL���� ��Ÿ���� �ʰ� �϶�(Ŀ�̼� �ȹ޴»������)
select ENAME, SAL, SAL+ COMM  as "�Ǳ޿�"
from EMP
where COMM is not NULL;


--6. ������̺��� 'SCOTT'�̶�� ����� �����ȣ, �̸�, ������ ����϶�

select EMPNO,ENAME, SAL
from EMP
where ENAME ='SCOTT';

--7. ������̺��� ������ 'SALESMAN'�� ����� �����ȣ, �̸�, ������
-- ����϶�
select EMPNO ,ENAME ,JOB
from EMP
where JOB = 'SALESMAN';

--8. ������̺��� �����ȣ�� 7499, 7521, 7654�� ����� �����ȣ, �̸�
-- ������ ����϶�
select EMPNO, ENAME,SAL
from EMP
where EMPNO in(7499,7521,7654);

--9. ������̺��� ������ 1500���� 3000������ ����� �����ȣ, �̸�,
-- ������ ����϶�.
select EMPNO, ENAME,SAL
from EMP
where SAL between 1500 and 3000;



--10. ������̺��� �̸��� ù���ڰ� A�̰� ������ ���ڰ� N�� �ƴ� �����
-- �̸��� ����϶�

select EMPNO, ENAME,SAL
from EMP
where (ENAME like 'A%' and ENAME not like '%N');



