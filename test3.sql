�� select 
select [distinct] [�÷�1,�÷�2,.....][as ����][ || ������][*]  --- 6
from ���̺��     --- 1
[where ������]    --- 2
[group by�÷���]  --- 3
[having ������]   --- 4
[order by �÷��� asc|desc ]  --- 5

group by : �׷��Լ�(max,min,sum,avg,count..)�� ���� ���
having : ������� �׷��� ������
==================================================================================
--ex1) ������̺��� �޿��� ����� ���Ͻÿ�
--     ����)�Ҽ����ϴ� ����,���ڸ����� �޸�(,)
--     ����޿����
--     ------------
--            6,461
select to_char(trunc(avg(salary)),'99,999')
from employees


--ex2) �μ����� �޿������ ���ؼ� �μ�ID, �޿������ ����Ͻÿ�
select department_id ,to_char(trunc(avg( salary)),'99,999')
from employees
group by department_id
order by department_id;


--ex3) ����ID�� �޿��� �հ踦 ���ؼ� ����ID, �޿��հ踦 ����Ͻÿ�
select job_id ,to_char(sum( salary),'99,999,999')
from employees
group by job_id
order by job_id;




--ex4) �μ��� �޿������ ���ؼ� �����,�μ��� �޿������ ����Ͻÿ� (X)
select job_id ,department_id,to_char(sum( salary),'99,999,999')
from employees
group by department_id;




--ex5) group by / having��
-- �μ��� �޿������ ���ؼ� ��ձ޿���  6000�̻��� �μ��� ���  (8 ���ڵ�)
-- (��ձ޿��� �Ҽ��� ���� ����)
--      �μ�ID   ��ձ޿�
--     -----------------------
--        100       8600
select department_id, trunc(avg(salary)) 
from employees
group by department_id
having avg(salary) >=6000
order by 1;




--ex6)�μ��� �޿������ ���Ͻÿ�
--    ����1) �Ҽ����ϴ� �ݿø�
--    ����2) ���ڸ������޸�, ȭ����� �ܸ� ǥ��
--    ����3)  �μ��ڵ�        ��ձ޿�
--           ---------------------------
--             10              ��8,600
--    ����4) �μ����� �������������Ͻÿ� 
--    ����5) ��ձ޿��� 5000�̻��� �μ��� ǥ���Ͻÿ�
select department_id as "�μ��ڵ�", to_char(round(avg(salary),-2),'L99,999,999') as "��ձ޿�"
from employees
group by department_id
having avg(salary) >=5000
order by 1;





--ex7) ��ȿ������ having��
--10�� 20 �μ����� �ִ�޿��� �޴»���� �޿��� ���Ͻÿ�, �μ����� �������� �����Ͻÿ�
--department_id     max_salary
-----------------------------
-- 10                    4400
-- 20                    13000 

--(ȿ�������)
select department_id, max(salary) as "max_salary"
from employees
where  department_id in(10,20)
group by department_id
order by 1




--(��ȿ�������)
select department_id, max(salary) as "max_salary"
from employees
group by department_id
having department_id in(10,20)
order by 1


--ex8) having�� (where + group by + having)
--10�� 20 �μ����� �ִ�޿��� �޴»���� �޿��� ���Ͻÿ�.  --1��
--[����1] �μ����� �������� �����Ͻÿ�
--[����2] �ִ�޿��� 5000�̻��� �μ��� ����Ͻÿ�
--         department_id     max_salary
--         -----------------------------------
--           20                    13000 

select department_id , max(salary) as "max_salary"
from employees
where department_id in(10,20)
group by department_id
having max(salary) >= 5000




--ex9) 20~80�� �μ�����  �޿��� ���� ���� �޴� ����� �޿��� ����Ͻÿ� --7��
--      �μ��� ������������ �Ұ�
--      [���]    department_id     min_salary

--(ȿ�������)
select department_id, min(salary) as "min_salary"
from employees
where department_id between 20 and 80
group by department_id
order by department_id;



--(��ȿ�������)


=======================================================================================
[����(join)]

(employees)           (departments)                (join)
��       ��                ��        ��              ��     ��    ��
��       ��    +          ��        ��     =       ��     ��    ��
��       ��                ��        ��              ��     ��    ��
��       ȣ                ȣ        ��              ��     ȣ    ��

������
0. natural join(�ڿ�����) : �����÷��� ������ ������ ���� �÷� ��θ� and�����ؼ� ����
1. Inner join(��������) : ������ ������ ����
2. Outer join(�ܺ�����) : ������ ����(�������)�ؼ� ����
                                   left  join : �����÷� �������
                                   right join : �������÷� �������
3. full join : ����,������ ��� ����
4. self join : �ڱ��ڽ� ���̺�� ����
5. cross join : ��� ����� ���� ����
6. non equijoin : ������ ���ϴ��� ���θ� Ȯ��
7. n�� ���̺� ���� : �������� ���̺� ����

�ع��
1. ����Ŭ ��������
2. Ansiǥ�ر���


select * from employees;    --107 (�μ����� ��� 1��)
select * from departments;  --27

--ex1) inner join : �����ͳ����� ����
--������̺�� �μ����̺��� �μ��� ������� �����ȣ,�μ���ȣ,�μ��̸��� ����Ͻÿ�  -- 106��

--���1(����Ŭ���뱸��)
select employee_id, employees.department_id, department_name
from employees , departments 
where employees.department_id = departments.department_id;
-- emp depart �� �����Ͱ� ������ ��ģ�� 

--���2(����Ŭ���뱸��)


--���3(Ansiǥ��)

select employee_id, department_id, department_name
from employees
inner join departments using(department_id); 
-- �����Ϳ��� �÷� ���


--ex2)�μ����̺�� ��ġ���̺��� �����Ͽ� �μ��� ��ġ�� ���ø� �˾Ƴ��ÿ�(inner join)
--     (departments, locations)
--  department_id     city
----------------------------------
--  10                   Seattle

select * from departments;
select * from locations;

--����Ŭǥ��


--Ansiǥ��
select department_id ,city
from departments
inner join locations using(location_id);

--ex3) outer join(left) : ���� ���̺��� ��������Ͽ� ����
--������̺�� �μ����̺��� �μ���ȣ�� ���� ����� �����Ͻÿ� ==> 107���ڵ�
--���� 1) ����̸�, �μ�ID, �μ��̸��� ����Ͻÿ�
--���� 2) ������̺��� ��� ����� �����Ͻÿ�

--���1(����Ŭ���뱸��)


--���2(ansiǥ��)
select last_name, department_id, department_name
from employees
left join departments using(department_id); 



--ex4) outer join(right) : ������ ���̺��� ��������Ͽ� ����
--������̺�� �μ����̺��� �μ���ȣ�� ���� ����� �����Ͻÿ� ===> 122���ڵ�
--���� 1) ����̸�, �μ�ID, �μ��̸��� ����Ͻÿ�
--���� 2) �μ����̺��� ��� �μ��� �����Ͻÿ�

--���1(����Ŭ���뱸��)

select employee_id, employees.department_id, department_name
from employees , departments 
where employees.department_id(+) = departments.department_id;

--���2(ansiǥ��)

select employee_id, department_id, department_name
from employees
right join departments using(department_id); 


--ex5) full join : ����,������ ���̺��� ��������Ͽ� ����
--������̺�� �μ����̺��� �μ���ȣ�� ���� ����� �����Ͻÿ� ===> 123���ڵ�
--���� 1) ����̸�, �μ�ID, �μ��̸��� ����Ͻÿ�
--���� 2) ������̺��� ������� �μ����̺��� ��� �μ��� �����Ͻÿ�

--���1(����Ŭ���뱸��)
  X

--���2(ansiǥ��)
select employee_id, department_id, department_name
from employees
full join departments using(department_id); 


select * from locations;

select * from departments;
--ex6) departments ��  locations �ڿ������� ��(�����÷� : location_id)  ==> 27���ڵ�
--        �ΰ��� ���̺��� �����ؼ� �μ���ġ(location_id), ����(city), �μ��̸�(department_name)�� ����Ͻÿ�

--���1(natural  join)


--���2(inner join)
select location_id, city, department_name
from departments
join locations using(location_id)


--ex7) inner join,  natural join : �ΰ��� �÷��� ��ġ�ϴ°��
--        �μ�ID�� �Ŵ���ID��  ���� ����� �����Ͻÿ�
--       (�������̺� : departments, employees)  : 32 ���ڵ�

--        last_name     department_id   manager_id
--        ------------------------------------------

--���1(����Ŭ���뱸��)
select last_name, e.department_id,e.manager_id
from employees e , departments d 
where e.department_id = d.department_id and e.manager_id = d.manager_id;

--���2(ansiǥ��)
select last_name, department_id,manager_id
from employees
join departments using(department_id,manager_id)


--���3(natural�����̿�)


--ex8) ������ ������ �÷����� �ٸ���쿡 �������� �����ϱ�
--       departments(location_id) , locations2(loc_id)
        
--      �μ�ID    �μ���             ����
--      -----------------------------------------------------
--      60	      IT	             Southlake
--      50	     Shipping	South San Francisco
--      10	     Administration	Seattle


create table locations2 
as select * from locations;     -- ���̺���

select * from tab;
select * from locations2;

alter table locations2 rename column location_id to loc_id;   
--location_id�� loc_id�� ����

--���1(����Ŭǥ��)
SELECT DEPARTMENT_ID , DEPARTMENT_NAME,CITY
FROM DEPARTMENTS , LOCATIONS2
WHERE DEPARTMENTS.LOCATION_ID = LOCATIONS2.LOC_ID


--���2(Ansiǥ��)

SELECT DEPARTMENT_ID, DEPARTMENT_NAME, CITY
FROM DEPARTMENTS
JOIN LOCATIONS2 ON(LOCATION_ID = LOC_ID)
--�÷����� �ٸ����� ON ���Ἥ ���ٰ� �������ش�



--ex9) self ���� : �ڱ��ڽ��� ���̺�� �����ϴ°��
--        ����� �����ڸ� �����Ͻÿ�, ��� ����� ǥ���Ͻÿ�

--        �����ȣ   ����̸�      ������
--        ----------------------------------
--        101      Kochhar      King   

select * from emp;
--���1(����Ŭǥ��)
select e.employee_id, e.last_name, m.last_name
from employees e, employees m
where e.manager_id = m.employee_id(+);

--���2(Ansiǥ��)
select e.employee_id as "�����ȣ", e.last_name as "����̸�", m.last_name as "������"
from employees e
left join employees m on(e.manager_id = m.employee_id)


--ex10) cross join: ����࿡ ���� ������ ��������� �����ϴ� ����
select count(*) from countries;     -- 25
select count(*) from locations;     -- 23

select * from countries; 
select * from locations; 

--���1(����Ŭǥ��)
--������� : ����->ȯ�漳��->�����ͺ��̽�->���->SQL�迭 ����ũ�� : 1000
select * from countries,locations;  <--- 575 ���ڵ�

--���2(Ansiǥ��)


--ex11) Non Equijoin (�� ��ť����) 
--        : �÷����� ������찡 �ƴ� ������ ���ϴ��� ���θ� Ȯ���Ҷ�
--        [����]  on ( �÷��� between �÷���1 and �÷���2)

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



--ex12) �ڽ��� �޴� �޿��� ������������ Ȯ���Ͻÿ�
--    ����1) Ÿ��Ʋ�� ����̸�, �޿�, �޿����
--    ����2) �޿��� ������������ �����Ͻÿ�
--           ����̸�       �޿�      �޿����
--           ------------------------------------
--            King	       24000	       A
--            De Haan      17000	       B

select last_name as "������", salary as "�޿�", salvel as "���"
from employees
left join salgrade on(salary between lowst and highst )
order by 2 desc

--ex13) n(����)���� ���̺��� ����
--����ID���� ������� ����̸�,��������,�μ��̸��� ����Ͻÿ�
--(employees, jobs,departments���̺��� ����)

--[�м�]
--employees           jobs            departments
----------------------------------------------------
--department_id      job_id          department_id
--job_id

--[����]
--1. �μ��̸� ������ ���� �μ��̸��� ��� ���������� �������� �����Ͻÿ�
--2. ����̸�, �μ��̸�, �������� �̸����� ����Ͻÿ�

--[���]
--����̸�      �μ��̸�                 ������    ===> employees   departments   jobs
----------------------------------------------------
--Higgins	Accounting Manager	 Accounting
--Gietz		Public Accountant	 Accounting

------------------------------------------------------------------------------------
--[����1] manager_id�� ���� ����� �����Ͽ� 
--        �̸�(last_name), �μ��̸�, �Ŵ���ID�� ����Ͻÿ�   -4��
--        (�������̺� : employees, departments)

--  ����1)�μ��̸��� IT�� ����� ����Ͻÿ�
--  ����2)�̸����� �������� ����Ͻÿ�
--  ����3)Ansiǥ���� �̿��Ͽ� join�Ͻÿ�

--  �̸�   �μ��̸�   �Ŵ���ID
--  ----------------------------
--Austin	IT	103
--Ernst	IT	103
--Lorentz	IT	103
--Pataballa	IT	103


------------------------------------------------------------------------------------
--[����2] �μ����̺�� ��ġ���̺��� �����Ͽ� ���ø� �˾Ƴ��ÿ�   --21��
--        (�������̺� : departments, locations)

--����1) ���ð� 'Seattle'�� ����Ͻÿ�
--����2) �μ�ID�� �������� �����Ͻÿ�

-- department_id      city
-- -----------------------------
-- 10                      Seattle

select * from locations;
select * from departments;


------------------------------------------------------------------------------------
--[����3] �μ���ȣ�� ���� ����� Ansiǥ������ �����Ͻÿ�  --9��
--        (�������̺� : departments, employees)
--  ����1) Ÿ��Ʋ��  ����̸�(last_name), �μ�ID, �μ��̸����� ����Ͻÿ�
--  ����2) �μ���ȣ�� 30�� �Ǵ� 90���� ����鸸 ����Ͻÿ�
--  ����3) ����̸��� �������� �����Ͻÿ�


------------------------------------------------------------------------------------
--[����4] ��ġID�� �����ؼ� ����̸�,����,�μ��̸��� ����Ͻÿ�  ==> 52���ڵ�
--        (�������̺� : employees, locations2, departments)

--	����1 : ����̸� ,����,�μ��̸��� ������ ǥ���Ͻÿ�	
--	����2 : Seattle �Ǵ� Oxford ���� �ٹ��ϴ� ���
--	����3 : ���ü����� �������������Ͻÿ� 
--	����4 : ��� ����� �����Ѵ�

--  ����̸�      ��    ��     �μ��̸�
-- ----------------------------------
--   Hall        Oxford       Sales

--[�м�]
--employees                departments            locations2
-- -----------------------------------------------------------
--department_id            department_id
--                               location_id              loc_id            


------------------------------------------------------------------------------------
--[����5] �μ�ID,����ID,�μ���ġ�� �����ؼ� ������ ���� �ϼ��Ͻÿ�   -- 1 ���ڵ�
--        (�������̺� : employees,locations2, departments,countries)
--      ����1 : �����ȣ,����̸�,�μ��̸�,����,�����ּ�(street_address),������ ������ ǥ���Ͻÿ�
--      ����2 : �����ּҿ�  Vi �Ǵ� St�� ���ԵǾ� �ִ� �����͸� ǥ���Ͻÿ�
--      ����3 : �����, ���ú��� �������������Ͻÿ�
--      ����4 : ������� �����Ѵ�











