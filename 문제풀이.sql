-- 1. EMPLOYEE���̺��� ��� ��� ������ �ֹι�ȣ�� �̿��Ͽ� ����, ����, ���� ��ȸ
SELECT EMP_NAME, SUBSTR(EMP_NO,1,2) "����", SUBSTR(EMP_NO,3,2) "����", SUBSTR(EMP_NO,5,2) "����"
FROM EMPLOYEE;
-- 2. EMPLOYEE���̺��� �����, �ֹι�ȣ ��ȸ (��, �ֹι�ȣ�� ������ϸ� ���̰� �ϰ�, '-'���� ���� '*'�� �ٲٱ�)
SELECT EMP_NAME, SUBSTR(EMP_NO,1,7) || RPAD('*',8,'*')
FROM EMPLOYEE;
-- 3. EMPLOYEE���̺��� �����, �Ի���-����, ����-�Ի��� ��ȸ
--     (��, �� ��Ī�� �ٹ��ϼ�1, �ٹ��ϼ�2�� �ǵ��� �ϰ� ��� ����(����), ����� �ǵ��� ó��)

-- 4. EMPLOYEE���̺��� ����� Ȧ���� �������� ���� ��� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE MOD(EMP_ID,2) = 1;
-- 5. EMPLOYEE���̺��� �ٹ� ����� 20�� �̻��� ���� ���� ��ȸ
SELECT EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
FROM EMPLOYEE
WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE) >= 20;
-- 6. EMPLOYEE ���̺��� �����, �޿� ��ȸ (��, �޿��� '\9,000,000' �������� ǥ��)
SELECT EMP_NAME, TO_CHAR(SALARY, 'L9,000,000')
FROM EMPLOYEE;
-- 7. EMPLOYEE���̺��� ���� ��, �μ��ڵ�, �������, ����(��) ��ȸ
--     (��, ��������� �ֹι�ȣ���� �����ؼ� 00�� 00�� 00�Ϸ� ��µǰ� �ϸ�
--     ���̴� �ֹι�ȣ���� ����ؼ� ��¥�����ͷ� ��ȯ�� ���� ���)


-- 8. EMPLOYEE���̺��� �μ��ڵ尡 D5, D6, D9�� ����� ��ȸ�ϵ� D5�� �ѹ���, D6�� ��ȹ��, D9�� �����η� ó��
--     (��, �μ��ڵ� ������������ ����)
SELECT EMP_NAME,DEPT_CODE,
CASE WHEN DEPT_CODE = 'D5' THEN '�ѹ���' WHEN DEPT_CODE = 'D6' THEN '��ȹ��' WHEN DEPT_CODE = 'D9' THEN '������' ELSE '��Ÿ' END
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5','D6','D9');
-- 9. EMPLOYEE���̺��� ����� 201���� �����, �ֹι�ȣ ���ڸ�, �ֹι�ȣ ���ڸ�,
--     �ֹι�ȣ ���ڸ��� ���ڸ��� �� ��ȸ
SELECT EMP_NAME, SUBSTR(EMP_NO,1,6), SUBSTR(EMP_NO,8,7), SUBSTR(EMP_NO,1,6) + SUBSTR(EMP_NO,8,7)
FROM EMPLOYEE
WHERE EMP_ID = 201;
-- 10. EMPLOYEE���̺��� �μ��ڵ尡 D5�� ������ ���ʽ� ���� ���� �� ��ȸ
SELECT SUM(SALARY + (SALARY*NVL(BONUS,0)))
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';
-- 11. �������� �Ի��Ϸκ��� �⵵�� ������ �� �⵵�� �Ի� �ο��� ��ȸ
-- ��ü ���� ��, 1999��, 2000��, 2001��, 2004��
SELECT COUNT(*), COUNT(CASE WHEN SUBSTR(HIRE_DATE,1,2) = 99 THEN 1 END),
COUNT(CASE WHEN SUBSTR(HIRE_DATE,1,2) = 00 THEN 1 END),
COUNT(CASE WHEN SUBSTR(HIRE_DATE,1,2) = 01 THEN 1 END),
COUNT(CASE WHEN SUBSTR(HIRE_DATE,1,2) = 04 THEN 1 END)
FROM EMPLOYEE;


select emp_name,emp_no,dept_code,job_code,salary,bonus,EMAIL
from employee
where (job_code = 'J6' or job_code = 'J7') and (salary >= 2000000) AND (SUBSTR(EMP_NO,8,1)='2') and (bonus != 0) AND EMAIL LIKE '__%' ;

select emp_name,salary,bonus,JOB_code
from employee
where bonus != 0; -- BONUS IS NOT NULL;

select *
from employee
where email LIKE  '__m%';

select COUNT(*)
from employee
where substr(emp_no,8,1) IN (2,4);

select TO_CHAR(SUM(SALARY),'L9,999,999,999')
from employee
where ent_yn = 'N';

select COUNT(*)
from employee
where EXTRACT (MONTH FROM HIRE_DATE) = 9; 

select emp_name,salary,bonus,job_code
from employee
where bonus IS NOT NULL ;

select emp_name,emp_no,dept_code,job_code,salary,bonus,email
		from employee
		where 
        (job_code IN ('J6','J7')) 
        and (salary >= 2000000) 
        and substr(emp_no,8,1) IN (2,4) 
        and email like '___#_%' escape '#'
        and bonus != 0;
-- ���� :  �̰� ������ BONUS IS NULL�� �ƴ϶� NOT �� �ƴ���? �׸��� EMAIL LIKE�� 3���� ���� ���� 