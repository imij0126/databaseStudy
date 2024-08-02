/*
    ������ ��ȸ(����) : SELECT
    SELECT ��ȸ�ϰ��� �ϴ� ���� FROM ���̺��;
    SELECT * �Ǵ� �÷���1, �÷���2, ... FROM ���̺��;
*/
-- ��� ����� ������ ��ȸ
SELECT * FROM EMPLOYEE;

-- ��� ����� �̸�, �ֹε�Ϲ�ȣ, �ڵ�����ȣ�� ��ȸ
SELECT EMP_NAME,EMP_NO,PHONE 
FROM EMPLOYEE;

-- JOB ���̺��� �����̸��� ��ȸ
SELECT JOB_NAME FROM JOB;
-- DEPARTMENT ���̺��� ��� ������ ��ȸ
SELECT * FROM department;

-- ���� ���̺��� �����, �̸���, ����ó, �Ի���, �޿� ��ȸ
SELECT EMP_NAME,EMAIL,PHONE,HIRE_DATE,SALARY FROM EMPLOYEE;

/*
    �÷����� ��� �����ϱ�
    => SELECT���� �÷��� �ۼ��κп� ��������� �� �� ����!
*/
-- ����̸�, ���� ����(SALARY * 12) ��ȸ
SELECT EMP_NAME, SALARY ,SALARY * 12 FROM EMPLOYEE;     -- SALARY *12 : �÷������Ϳ� 12FMF RHQGO WHGHL
-- ����̸�, �޿�, ���ʽ�, ����, ���ʽ� ���� ����(�޿� + (�޿�+���ʽ�)) * 12
SELECT EMP_NAME, SALARY, BONUS , SALARY *12, (SALARY +(SALARY*BONUS))*12 FROM EMPLOYEE;

/*
    - ���� ��¥�ð� ���� : SYSDATE
    - ���� ���̺�(�ӽ����̺�) : DUAL
*/
-- ���� �ð� ���� ��ȸ
SELECT SYSDATE FROM DUAL;   -- YY/MM/DD �������� ��ȸ��!

-- ����̸�, �Ի���, �ٹ��ϼ� (���糯¥ - �Ի���)��ȸ
-- DATEŸ�� - DATEŸ�� -> �Ϸ� ǥ�õ�!
SELECT EMP_NAME,HIRE_DATE,SYSDATE - HIRE_DATE FROM EMPLOYEE;
/*
    * �÷��� ��Ī ���� : ������� ����� ��� �ǹ��ľ��� ��Ʊ� ������, ��Ī�� �ο��� ��Ȯ�ϰ� ����ϰ� ��ȸ����!
    [ǥ����] 1) �÷��� ��Ī
            2) �÷��� as ��Ī
            3) �÷��� "��Ī"
            4) �÷��� as "��Ī"
*/
-- ����̸�, �޿�, ���ʽ�, ����, ���ʽ� ���� ����(�޿� + (�޿�+���ʽ�)) * 12
SELECT EMP_NAME as �̸�, SALARY as ����, BONUS as ���ʽ� , SALARY *12 as ����, (SALARY +(SALARY*BONUS))*12 as total 
FROM EMPLOYEE;
/*
    * ���ͷ� : ���Ƿ� ������ ���ڿ� (' ')
      -> SELECT ���� ����ϴ� ��� ��ȸ�� ���(Result set)�� ���������� ǥ�õ�
*/
-- �̸�, �޿�, '��' ���
SELECT EMP_NAME �̸�,SALARY �޿�, '��' ����
FROM EMPLOYEE;

/*
    ���� ������ : || 
*/
SELECT SALARY || '��' AS �޿� FROM EMPLOYEE;

-- ���, �̸�, �޿����� �ѹ���(�� �÷���) ��ȸ
SELECT EMP_ID || EMP_NAME || SALARY FROM EMPLOYEE;

-- XXX �� �޿��� XXX���Դϴ�.
SELECT EMP_NAME || '�� �޿��� ' || SALARY || '�� �Դϴ�.' �޿����� FROM EMPLOYEE;
-- ������̺��� �����ڵ� ��ȸ (�ߺ�����)
SELECT JOB_CODE FROM EMPLOYEE;
/*
    * �ߺ����� : DISTINCT
*/
SELECT DISTINCT JOB_CODE FROM EMPLOYEE;

-- ������̺��� �μ��ڵ� ��ȸ(�ߺ�����);
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;

-- DISTINCT �� �ѹ��� ��� ����
-- DISTINCT(JOB_CODE,DEFT_CODE)�� �� ������ ��� �ߺ��� ��������;
SELECT DISTINCT JOB_CODE, DEPT_CODE FROM EMPLOYEE;
--=============================================================================
/*
    * WHERE �� : ��ȸ�ϰ��� �ϴ� �����͸� Ư�� ���ǿ� ���� �����ϰ��� �Ҷ� ���
    [ǥ����]
            SELECT �÷���, �÷�:������ ���� �����
            FROM ���̺��
            WHERE ����;
            
    -�񱳿�����
        * ��� �� :  >,<, >=, ,=
        * ���� �� 
            - ������ : = 
            - �ٸ��� : !=, <>, ^=
*/
-- ������̺��� �μ��ڵ尡 'D9'�� ����鸸 ��ȸ
SELECT*               -- ��ü�÷��� ��ȸ�Ұǵ� 
FROM EMPLOYEE         -- EMPLOYEE ���̺���
WHERE DEPT_CODE ='D9';  -- DEPT_CODE�� ���� 'D9'�� ������ ��ȸ

-- ������̺��� �μ��ڵ尡 'D1'�� ������� �����, �޿�, �μ��ڵ� ��ȸ
SELECT EMP_NAME,SALARY,DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE = 'D1';

-- �μ��ڵ尡 D1�� �ƴ� ������� ���� ��ȸ
SELECT * FROM EMPLOYEE WHERE DEPT_CODE != 'D1';

--�޿��� 400���� �̻��� ����� �����, �μ��ڵ�, �޿� ������ ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE SALARY >= 4000000;
--1. �޿��� 300���� �̻��� ������� �����, �޿�, �Ի���, ���� ��ȸ
SELECT EMP_NAME AS �����,SALARY AS �޿�,HIRE_DATE AS �Ի糯¥,SALARY*12 AS ���� FROM EMPLOYEE WHERE SALARY >=3000000;
--2. ������ 5õ���� �̻��� ������� �����,�޿�,����,�μ��ڵ� ��ȸ
SELECT EMP_NAME AS �����,SALARY AS �޿�,SALARY*12 AS ����,DEPT_CODE AS �μ��ڵ� FROM EMPLOYEE WHERE SALARY*12 >= 50000000;
--3. �����ڵ� 'j3'�� �ƴ� ������� ���, �����, �����ڵ�, ��翩�� ��ȸ
SELECT JOB_CODE AS ���, EMP_NAME AS �����, DEPT_CODE AS �����ڵ�,ENT_YN AS ��翩�� FROM EMPLOYEE WHERE JOB_CODE != 'J3'; 
--4. �޿��� 350���� �̻� 600���� ������ ��� ����� �����, ���, �޿� ��ȸ
SELECT EMP_NAME AS �����, JOB_CODE AS ���, SALARY AS �޿� FROM EMPLOYEE WHERE 6000000>=SALARY AND SALARY >= 3500000 ;
/*
    * BETWEEN AND : ���ǽĿ��� ���Ǵ� ����
        => ~ �̻� ~ ������ ������ ���� ������ �����ϴ� ����
    [ǥ����]
            �񱳴���÷��� BETWEEN �ּڰ� AND �ִ�
            => �ش� �÷��� ���� �ּڰ� �̻��̰� �ִ� ������ ���
*/            