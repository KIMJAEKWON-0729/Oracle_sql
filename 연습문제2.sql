--QUESTION(�Լ�)
--1. ��� ���̺��� ����̸��� ù���ڴ� �빮�ڷ�, �������� �ҹ��ڷ� ����϶�
-- [���]       ����̸�
--           ---------------------
--             Smith
select INITCAP(ename) as "����̸�"
from emp





--2. ������̺��� ����̸��� �̰� �� �̸��� �ι�° ���ں��� �׹�° ���ڱ���
-- ����϶�.
-- [���]  ����̸�    2-4����
--         ---------------------
--        SMITH        MIT

select ename,
	substr(ename,2,3) as "2-4����"
from emp

--3. ������̺��� ��� �̸��� ö�� ������ ����϶�.
select count(ename), ename
from emp
group by ename

--4. ������̺��� ��� �̸��� �� ���� �ϳ��� ������ ���� �ϳ��� ����ϵ� 
--   ��� �ҹ��ڷ� ���� ����϶�.
select ename,
	lower(substr(ename,1,1)) as "�ձ���",
	lower(substr(ename,-1)) as "����������"
from emp

--5. 3456.78�� �Ҽ��� ù��° �ڸ����� �ݿø��϶�.
select round(3456.78,1) from dual

--6. 3�� 4������ ���ϰ�, 64�� �������� ���϶�.
select power(3,4) from dual;

select sqrt(64) from dual;
--7. ���ó�¥�� ���ó�¥���� 10���� ���� ��¥�� ����϶�.
select sysdate +10 from dual
--8. ���� ǥ������ ���� ��¥�� ����϶�.
select sysdate from dual
--9. ������̺��� ����̸��� ������� ���� ��¥������ �ٹ��ϼ��� ���϶�.
--����̸�   �ٹ��ϼ�
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

select ename as "����̸�",
	trunc(sysdate -hiredate) as "�ٹ��ϼ�"
from emp
--10. �� �������� �ٹ��ϼ��� 00�� 00���� 00�� �ٹ��Ͽ�����
--Ȯ���� �� �ֵ��� ��ȯ�϶�.(��, �� ���� 30�Ϸ� ����϶�)
--  [���]
--   ����̸�       �ٹ��ϼ�
-- --------------------------------
--	SMITH	34�� 07���� 05��
--	ALLEN	34�� 05���� 01��
--	WARD	34�� 04���� 30��
--	JONES	34�� 03���� 21��
--	MARTIN	33�� 09���� 24��
--	BLAKE	34�� 03���� 22��
--	CLARK	34�� 01���� 20��
--	SCOTT	32�� 09���� 13��
--	KING	33�� 08���� 04��
--	TURNER	33�� 10���� 13��
--	ADAMS	32�� 06���� 10��
--	JAMES	33�� 09���� 19��
--	FORD	33�� 09���� 19��
--	MILLER	33�� 05���� 29��

select ename,
to_char(to_date(sysdate-hiredate),'YYYY"��"fmMM"��"fmDD"��"') from emp


















