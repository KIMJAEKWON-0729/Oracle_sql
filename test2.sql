[������]
=  : ����
!=,  ^=,  <> : �����ʴ�
>=, <=, >, < : ũ�ų�����,�۰ų�����,ũ��,�۴�
and, or, between and, in, like, is null/is not null

�� select 
select  [distinct] [�÷�1, �÷�2.......][*][ ||���Ῥ����][AS ����]
from ���̺��
[where ������]
[order by �÷��� asc|desc ]

order by : ����
                asc  - ��������(��������)
                desc - ��������
�÷��� : ���ڷε� ����
=======================================================================================
--ex1) �����,�μ�ID,�Ի����� �μ����� �������� �����Ͻÿ�



--ex2) �����, �μ�ID, �Ի�����  �μ����� �������� �����Ͻÿ�
--     �����μ��� ��������  �Ի��ϼ����� �����Ͻÿ�



--ex3) ������� ������ ������ ���������� �������������Ͻÿ�   
--�� ��     �� ��     
-- ---------------
--King      28800


=======================================================================================
[������ �Լ�]
1. �����Լ� : mod(������), round(�ݿø�), trunc(����), ceil(�ø�) 
2. �����Լ� : lower, upper, length, substr, ltrim, rtrim, trim
3. ��¥�Լ� : sysdate, add_month, month_between
4. ��ȯ�Լ�
   (1) �Ͻ���(implict)��ȯ:�ڵ�
       VARCHAR2 �Ǵ� CHAR    ------>     NUMBER
       VARCHAR2 �Ǵ� CHAR    ------>     DATE
       NUMBER                       ------>     VARCHAR2
       DATE                            ------>     VARCHAR2   

    (2) �����(explict)��ȯ:����
    
               TO_NUMBER         TO_DATE
                 <------               ------>
     NUMBER       CHARACTER           DATE
                 ----->                <------
                 TO_CHAR              TO_CHAR

-��¥����-
YYYY : ���ڸ�����(����)         (ex.  2005)  
YEAR : ����(����)
MM : ���ڸ� ������ ��Ÿ�� ��    (ex.   01, 08, 12)
MONTH : �� ��ü�̸�             (ex.   January) 
MON : ���ڸ� ���� ��Ÿ�� ��   (ex.   Jan)  
DY : ���ڸ� ���� ��Ÿ�� ����  (ex. Mon) 
DAY : ������ü                  (ex. Monday) 
DD : ���ڷ� ��Ÿ�� ���� ��      (ex. 31, 01) 

-��������-
9 : ���ڸ� ǥ��
0 : 0�� ������ ǥ��
$ : �ε�$��ȣ�� ǥ��
L : �ε� ������ȭ��ȣ ǥ��(�ѱ�,�Ϻ�...)
.  : �Ҽ������
,  : õ���� ������ ���

5. �׷�(����)�Լ� : avg, sum, max, min, count
6. ��Ÿ�Լ� : nvl, dcode, case
=======================================================================================
--ex1)  �̸��� �ҹ��ڷ� �ٲ��� �˻�
--'Higgins'����� �����ȣ,�̸�,�μ���ȣ�� �˻��Ͻÿ�
SELECT * FROM EMPLOYEES;
SELECT EMPLOYEE_ID,  LAST_NAME , DEPARTMENT_ID
FROM EMPLOYEES
WHERE lower(LAST_NAME) = "higgins";

--ex2) 10�� 3���� ���� ������ ���Ͻÿ�(mod)
SELECT MOD(10,3) FROM DUAL; -- TABLE�� ������ DUAL

--ex3) 35765.357�� �ݿø�(round)
select round(35765.357, 2) from dual;       <---35765.36
select round(35765.357, 0) from dual;       <---35765
select round(35765.357, -3) from dual;      <---36000 

--ex4) 35765.357�� ����(trunc)
select trunc(35765.357, 2) from dual;       <---35765.35
select trunc(35765.357, 0) from dual;       <---35765
select trunc(35765.357, -3) from dual;      <---35000 

select ceil(35765.357) from dual;       <--- 35766 (ceil�� ������ ����)

--ex5) concat('���ڿ�1','���ڿ�2') : ���ڿ��� ����(���ڿ�1+���ڿ�2)
select concat('Hello',' World') from dual;    <--- Hello World

--ex6) length('���ڿ�')  : ���ڿ�(ĳ����)�� ����
--     lengthb('���ڿ�') : ���ڿ�(BYTE)�� ����
  
--     ��뿹)  ����Ʈ , ����Ʈ
--                          char(20)           varchar2(20)
--           length           14                  3            <---- ����Ʈ
--           lengthb          20                  9            <---- ����Ʈ


--     ��뿹)  elite , elite
--                          char(20)           varchar2(20)
--           length           20                  5             <---- elite
--           lengthb          20                  5             <---- elite

create table text (str1 char(20),str2 varchar2(20));
insert into text(str1,str2) values('����Ʈ','����Ʈ');
insert into text(str1,str2) values('elite','elite');
commit;

select * from tab;
select * from text;
select length(str1),length(str2) from text where str1='����Ʈ';     --14   3
select lengthb(str1),lengthb(str2) from text where str1='����Ʈ';    --20   9

select length(str1),length(str2) from text where str1='elite';     --20   5
select lengthb(str1),lengthb(str2) from text where str1='elite';   --20   5

--ex7) 
select length('korea') from dual;       <----5
select length('�ڸ���') from dual;      <----3
select lengthb('korea') from dual;      <----5
select lengthb('�ڸ���') from dual;     <----9


--ex8) �����ѹ��ڿ�ã�� : instr(ǥ����,ã�¹���,[��ġ]) 1:��(��������), -1:��
select  instr('HelloWorld','W') from dual;               <---6
select  instr('HelloToWorld','o', -1) from dual;         <---9

--ex9) ������ ������ ���ڿ��� ���� : substr(ǥ����,����,[����])
select  substr('I am very happy', 6, 4) from dual;      <--- very
select  substr('I am very happy', 6) from dual;         <--- very happy

--ex10) employees ���̺��� ���ǿ� �°� �˻��Ͻÿ�(concat,  length)   -- 19���ڵ�
--      ����1) �̸��� ���� �����Ͻÿ�(concat)
--      ����2) ������ �̸��� ���̸� ���Ͻÿ�(length)
--      ����3) ���� n���� ������ ���(substr)
SELECT employee_id, concat(first_name,last_name) AS NAME,length(concat(first_name,last_name)) as length
FROM EMPLOYEES
WHERE substr(last_name,-1,1) = 'n';


--employee_id        name           length
-- -----------------------------------------------
--  102              LexDeHaan       10


--ex11) ������ ���� ������ �������� �����ġ : width_bucket(ǥ����,�ּҰ�,�ִ밪,����)
--�ּ�-�ִ밪�� �����ϰ� 10���� ������ ������ ��ġã��
--0-100������ ������ ������ 74�� ���ԵǾ��ִ±����� ǥ���Ͻÿ�
SELECT WIDTH_BUCKET(74,0,100,10) FROM DUAL;

 
--ex12) �������� : ltrim(��), rtrim(����), trim(����)
SELECT RTRIM('TEST  ')||LTRIM('  EXAM') FROM DUAL;

--ex13) sysdate : �ý��ۿ� ������ �ð�ǥ��
select sysdate from dual;
select to_char(sysdate,'YYYY"��" MM"��" DD"��"')as ���ó�¥ from dual;-- ' ' " " �����ؾ��� 

select to_char(to_date('15/01/05'),'YYYY"��"fmMM"��"DD"��"') from dual;   
-- 2015�� 1�� 5��

select to_char(to_date('15/01/05'),'YYYY"��"fmMM"��"fmDD"��"') from dual;   
-- 2015�� 1�� 05��

--ex14) add_months(date, �޼�):��¥�� �޼� ���ϱ�
select add_months(sysdate,7) from dual;

--ex15) last_day(date) : �ش���� ��������
select last_day(sysdate) from dual;            <---- 2018-08-31
select last_day('2004-02-01') from dual;    <---- 2004-02-29
select last_day('2005-02-01') from dual;    <---- 2005-02-28

--ex16) ���ú��� �̹��� ������ �� ���� ������ ���Ͻÿ�
SELECT LAST_DAY(SYSDATE)- SYSDATE FROM DUAL;



--ex17) months_between(date1,date2) : �� ��¥������ �޼�

select round(months_between('2014-02-10','2013-10-21')) from dual;

select round(months_between('2013-10-21','2014-02-10')) from dual;


--ex18) �Ͻ����� ��ȯ(�ڵ�)
desc employees;             -- employees�� ����Ȯ��

select employee_id,last_name 
from employees
where department_id='90';   <---        number --> varchar2(�ڵ� ��ȯ)

select months_between('15-10-21','14-10-20') from dual;   <----12.033333
                      -- date --> number(�ڵ� ��ȯ)

--ex19) ������� ��ȯ(����)     number --> character
select last_name, salary
from employees
where last_name='King';

select last_name, to_char(salary,'L99,999.00')
from employees
where last_name='King';

--ex20) fm���� : ���İ� �����Ͱ� �ݵ�� ��ġ�ؾ���(fm - fm���̰��� ��ġ)
select  last_name,hire_date   from employees   where hire_date='05/06/25';   --05/06/25
select  last_name,hire_date   from employees   where hire_date='05/6/25';     --05/06/25

select  last_name,hire_date   from employees where last_name='Austin';


select  to_char(to_date('15-04-07'),'YYYY-MM-DD') from dual;         --2015-04-07
select  to_char(to_date('15-04-07'),'YYYY-fmMM-DD') from dual;      --2015-4-7
select  to_char(to_date('15-04-07'),'YYYY-fmMM-fmDD') from dual;   --2015-4-07   

--ex)2007-02-07�� �Ի��� ����� �˻��Ͻÿ�

select * from employees where hire_date='07/02/07';             ==> ��� ����

select * 
from employees
where  to_char(hire_date,'YY-MM-DD')
        =to_char(to_date('07/02/07','YY-MM-DD'),'YY-MM-DD');    ==> ��� ����

select * 
from employees
where to_char(hire_date,'YY-MM-DD')                                          
        =to_char(to_date('07/02/07','YY-MM-DD'),'YY-fmMM-DD');   ==> ��� �ȳ���(07/02/07 = 07/2/7)           


--ex21) RR, YY����

   (��ȯ��:����⵵�� ����)                  �����ѿ���(�� ���ڸ�)
                                -----------------------------------------------------
                                                      0 - 49                      50 - 99     
   ===================================================================================
   ���翬�� (�� ���ڸ�)    0 - 49     ��ȯ���� ���缼��       ��ȯ���� ��������
                            ----------------------------------------------------------
                                  50 - 99    ��ȯ���� ��������      ��ȯ���� ���缼��


   ��)  ����⵵            �����ѳ�¥          RR����            YY����
        -----------------------------------------------------------------
           1995              27-oct-95               1995               1995  
           1995              27-oct-17               2017               1917
           2001              27-oct-17               2017               2017
           2001              27-oct-95               1995               2095

select  to_char(to_date('97/9/30','YY-MM-DD'),'YYYY-MM-DD') from dual; <--2097
select  to_char(to_date('97/9/30','RR-MM-DD'),'RRRR-MM-DD') from dual; <--1997
select  to_char(to_date('57/9/30','YY-MM-DD'),'YYYY-MM-DD') from dual; <--2057
select  to_char(to_date('57/9/30','RR-MM-DD'),'RRRR-MM-DD') from dual; <--1957
-- RR������ �´� 
--ex22)
select to_char(to_date('97/9/30'), 'YYYY-MON-DD') from dual;
select to_char(to_date('9/30/97','MM-DD-YY'), 'YYYY-MON-DD') from dual;  <--2097
select to_char(to_date('9/30/97','MM-DD-RR'), 'RRRR-MON-DD') from dual;  <--1997

--ex23)2005�� ���Ŀ� ���� ����� ã���ÿ�
--last_name     hire_date
------------------------------------
--King           17-Jan-1987
--Kochhar        21-sep-1989
--Whalen         17-sep-1987

select last_name,to_char(hire_date,'dd-mon-yyyy')
from employees
where hire_date>=to_char(to_date('2005-01-01','yy-mm-dd'),'yy-mm-dd');
                     
select last_name,to_char(hire_date,'yyyy-mm-dd')
from employees
where hire_date>='2005-01-01';

--**�׷��Լ�    
--ex24) count(�÷���), max(�÷���), min(�÷���),avg(�÷���),sum(�÷���) �Լ�
--employees���̺��� �޿��� �ִ�,�ּ�,���,���� ���Ͻÿ�
--����) ����� �Ҽ���������,���� ���ڸ����� �޸���� \ǥ��
select count(salary) as count ,max(salary) as max, count(salary) as min, trunc(avg(salary)) as avg, to_char(sum(salary),'L99,999,999')as sum
from employees;

--ex25) Ŀ�̼��� ���� �ʴ� ����� �ο����� ���Ͻÿ�
select *from employees;

select count(*)
from employees
where commission_pct is  null;

--ex26) employees���̺��� ���� �μ� �����ؼ� �� �μ��� ���� ���Ͻÿ�(�� : 12��)
--      (nvl���) 



select distinct  department_id from employees;

select count(distinct  department_id) from employees; --11

select distinct  nvl(department_id,1000) from employees;   --- nvl�� null���� ��� 1000���� ��ġ

--����) ���������� ����Ͻÿ�
--        ����1) ����̸�, �޿�, Ŀ�̼�, ������ ����Ͻÿ�
--        ����2) ���� = �޿�*12 + (�޿�*12)*Ŀ�̼����� �Ѵ�
--        ����3) Ŀ�̼��� ���� �ʴ°�쿡�� 0���� ǥ���Ѵ�

select last_name, salary, commission_pct, salary*12 +(salary + 12) *nvl(commission_pct , 0) as "�� ��" 
from employees;



--ex27) �� decode(ǥ����,�˻�1,���1,�˻�2,���2....[default])
--           : ǥ���İ� �˻��� ���Ͽ� ��� ���� ��ȯ �ٸ��� default
--        �� case  [value]  when  ǥ����  then  ����1
--                       when  ǥ����  then   ����2
--                                        :
--                        else  ����3
--        end

--ex28)���� id�� 'SA_MAN'�Ǵ¡�SA_REP'�̸� 'Sales Dept' �� �� �μ��̸� 'Another'�� ǥ��
--����) �з����� ������������
--        ����          �з�
--       --------------------------
--       SA_MAN    Sales Dept
--       SA_REP      Sales Dept
--       IT_PROG    Another

--���1
select job_id as "����",
	decode(job_id,'SA_MAN','Sales Dept','SA_REP','Sales Dept','Another') as "�з�"--saman �̸�  sales dept  sa_ret�̸� sales_dept 
 					
from employees
order by 2;
--���2
select job_id as "����",
		case job_id when 'SA_MAN' then 'Sales Dept'
					when 'SA_REP' then 'Sales Dept'
					else 'Another'
			end as "�� ��"
from employees

			

--ex28) �޿��� 10000�̸��̸� �ʱ�, 20000�̸��̸� �߱� �� ���̸� ����� ����Ͻÿ� 
--      ����1) �÷�����  '����'���� �Ͻÿ�
--      ����2) ������ �����ȣ, �����, ��  ��
--      ����3) ����(��������)���� �����ϰ�, ���а��� ������ �����(��������)���� �����Ͻÿ�

select employee_id as "�����ȣ", last_name as "�����",salary,
			case when salary<10000 then '�ʱ�'
				 when salary<20000 then '�߱�'
				 else '���'
			end as ����
from employees
order by 4 ,2;

1

--rank�Լ� : ��ü���� ������� ������ ����
--rank(ǥ����) within group(order by ǥ����)     ---> �κ�
--rank() over(������Ƽ��)                                ---> ��ü������ ǥ��


--ex29)�޿��� 3000�� ����� ���� �޿������� ���Ͻÿ�
select rank(3000) within group(order by salary desc) as "rank"
from employees;


--ex30)��ü����� �޿������� ���Ͻÿ�
select employee_id,salary, rank() over(order by salary desc) "rank" from employees;

--first_value�Լ� : ���ĵ� �� �߿��� ù��°�� ��ȯ
--first_value(ǥ����) over(������Ƽ��)

--ex31)��ü����� �޿��� �Բ� ���μ��� �ְ�޿��� ��Ÿ���� ���Ͻÿ�
select employee_id,salary,
       first_value(salary) over(partition by department_id order by salary desc)
       "�μ����ְ�޿�", department_id
from employees
order by department_id asc;


select employee_id,salary,job_id,
       first_value(salary) over(partition by job_id order by salary )
       "�μ��������޿�"
from employees
where job_id in('ST_CLERK','SA_REP');




--ex32)����ID�� 'ST_CLERK' �Ǵ� 'SA_REP'�� ������ ������� �޿��� �Բ� �� ����ID�� �����޿��� ��Ÿ���� ���Ͻÿ�
-- employee_id  job_id  ����ID�������޿�   salary
-- ----------------------------------------------
--173	        SA_REP       	6100	 6100
--179           SA_REP	        6100	 6200
--167	        SA_REP	        6100	 6200
--166	        SA_REP     	6100	 6400




===========================================================================================
--[����1] ������̺��� �����ȣ, �̸�, �޿�, Ŀ�̼�, ������ ����Ͻÿ�
--        ����1) ������ $ ǥ�ÿ� ���ڸ����� �޸��� ����Ͻÿ�
--        ����2) ���� = �޿� * 12 + (�޿� * 12 * Ŀ�̼�) 
--        ����3) Ŀ�̼��� ���� �ʴ� ����� �����ؼ� ����Ͻÿ�

select employee_id, last_name, 
		to_char(salary,'$99,999,999') as "�޿�",
		nvl(commission_pct, 0) as commission  , 
		salary*12 +(salary + 12) *nvl(commission_pct , 0) as "�� ��" 
from employees;



--[����2] �Ŵ����� ���� ����� �Ŵ��� id��, 1000���� ǥ��
--        ����1) ������ �����ȣ,�̸�,�Ŵ���ID
--        ����2) ��� ����� ǥ���Ͻÿ�       
--                �����ȣ     �̸�       �Ŵ���ID
--	          ---------------------------------
--	           100           King        1000 

select employee_id as "�����ȣ",
		last_name as "�̸�",
		nvl(manager_id,1000) as"�Ŵ��� id"
	from employees;



--[����3] �޿���  7000�̻��̸� '���'  3000�̻��̸� '�߱�'  3000�̸��̸� '�ʱ�'�� ���
--          grade���� �������� �����Ͻÿ�  
--                last_name        salary       grade
--              --------------------------------------------
--                 King               24000      ���

select last_name, salary,
	case when salary >=7000 then '���'
		 when salary >=3000 then '�߱�'
		 else '�ʱ�'
		 end as "grade"
from employees
order by 3;

