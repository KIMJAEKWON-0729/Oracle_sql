--QUESTION (group/having)
--1. ������̺��� �μ��� �ִ� ������ ����϶�.
select deptno ,max(sal)
from emp 
group by deptno


--2. ������̺��� ������ �ּ� ������ ���ϵ� ������  CLERK�� �͸� ����϶�. (having�� �̿�)
select job ,min(sal)
from emp 
group by job
having job = 'CLERK'



--3. Ŀ�̼��� å���� ����� ��� �� ���ΰ�?
select ename
from emp
where comm is not null;


--4. ������ 'SALESMAN'�̰� ������ 1000�̻��� �����
-- �̸��� ������ ����϶�.
select ename, sal 
from emp 
where job = 'SALESMAN' and sal >=1000


--5. �μ��� ��տ����� ����ϵ�, ��տ��ް� 2000����
-- ū �μ��� �μ���ȣ�� ��տ����� ����϶�.
select job , trunc(avg(sal))
from emp
group by job
having avg(sal)>=2000


--6. ������̺��� Ŀ�̼��� ���� ���� �޴� ����� 2��������
-- ����ϵ� ��ŷ�� �ߺ��� ��� ����ó���� �Ͽ� ����϶�.
--    (rank() over(������Ƽ��)�̿�)
select ename, comm, rank
from (select ename, comm, rank()over(order by nvl(comm,0) desc) as rank from emp)
where rank<3;

--7. ������ MANAGER�� ����� �̴µ� ������ ���� ���
-- ������ �̸�, ����, ������ ����϶�.
select ename,job,sal,
       first_value(sal) over(partition by department_id order by salary desc)
       "�μ����ְ�޿�", department_id
from employees
order by department_id asc;



--8. �� �������� �ѿ����� ����ϵ� ������ ���� ������ ����϶�.
select ename,job,
       first_value(sal) over(partition by job order by sal) "������ ���޼���"
       
from emp



--9. ������ �ѿ����� ����ϵ�, ������ 'MANAGER'�� ������� �����϶�. 
--   �׸��� �� �ѿ����� 5000���� ū ������ �ѿ��޸� ����϶�.

select job , sum(sal)
from emp
where job != 'MANAGER'
group by job
having sum(sal)> 5000


--10. ������ �ִ������ ����ϵ�, ������ 'CLERK'�� ������� �����϶�. 
--�׸��� �� �ִ������ 2000 �̻��� ������ �ִ������ �ִ� ������ 
--���� ������ �����Ͽ� ����϶�.

select job , max(sal)
from emp
where job != 'CLERK'
group by job
having max(sal)>= 2000
order by 2 desc;


