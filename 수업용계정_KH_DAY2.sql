/*
    * BETWEEN AND : ���ǽĿ��� ���Ǵ� ����
        => ~ �̻� ~ ������ ������ ���� ������ �����ϴ� ����
    [ǥ����]
            �񱳴���÷��� BETWEEN �ּڰ� AND �ִ�
            => �ش� �÷��� ���� �ּڰ� �̻��̰� �ִ� ������ ���
*/     
-- �޿��� 350�� �̻��̰� 600�� ������ �����
SELECT EMP_NAME �����, EMP_ID ���, SALARY �޿�
FROM EMPLOYEE
WHERE 3500000 <= SALARY AND 6000000 >= SALARY;

/*
    * NOT : ����Ŭ������ ������������
*/
-- �޿��� 350���� �̸� �Ǵ� 600���� �ʰ��� ����� �����,���,�޿� ��ȸ
SELECT EMP_NAME �����, EMP_ID ���, SALARY �޿�
FROM EMPLOYEE
WHERE SALARY < 3500000 OR SALARY > 6000000;

SELECT EMP_NAME �����, EMP_ID ���, SALARY �޿�
FROM EMPLOYEE
--WHERE SALARY NOT BETWEEN 3500000 AND 6000000;
WHERE NOT SALARY BETWEEN 3500000 AND 6000000;
--NOT�� BETWEEN �տ� ���̰ų� �÷��� �տ� �ٿ��� ��� ����!

/*
    * IN : �񱳴���÷����� ������ ���� �߿� ��ġ�ϴ� ���� �ִ� ��� ��ȸ�ϴ� ������
    [ǥ����]
            �񱳴���÷��� IN ('��1', '��2', '��3', ....)
*/
-- �μ��ڵ尡 D6�̰ų� D8�̰ų� D5�� ������� �����, �μ��ڵ�, �޿��� ��ȸ
SELECT EMP_NAME "�����",DEPT_CODE "�μ� �ڵ�",SALARY "�޿�" FROM EMPLOYEE
WHERE DEPT_CODE IN ('D6', 'D8', 'D5');
--WHERE DEPT_CODE = 'D5' OR DEPT_CODE = 'D6' OR DEPT_CODE = 'D8';

SELECT EMP_NAME,DEPT_CODE,HIRE_DATE 
FROM EMPLOYEE 
WHERE DEPT_CODE IN('D9','D5')AND HIRE_DATE < '2002/01/01'  ;
/*
    *Like : ���ϰ����ϴ� �÷��� ���� ������ Ư�� ���Ͽ� ������ ��� ��ȸ
        => Ư�� ���� : '%', '_' �� ���ϵ�ī�� ���
            * '%' : 0���� �̻�
              ex) �񱳴���÷��� Like '����%' => �񱳴���÷��� ���� ���ڷ� ���۵Ǵ� ���� ��ȸ
                  �񱳴���÷��� Like '%����' => �񱳴���÷��� ���� ���ڷ� "��"���� ���� ��ȸ
                  �񱳴���÷��� Like '%����%'=> �񱳴���÷��� ���� ���ڰ� "����"�Ǵ� ���� ��ȸ
            * '_' : 1����
              ex) �񱳴���÷��� Like '_����' => �񱳴���÷��� ���� ���� �տ� ������ �ѱ��ڰ� �� ��� ��ȸ
                  �񱳴���÷��� Like '__����' => �񱳴���÷��� ���� ���� �տ� ������ �α��ڰ� �� ��� ��ȸ
                  �񱳴���÷��� Like '_����_' => �񱳴���÷��� ������ ����, ��, �ڿ� ������ �ѱ��ھ� ���� ��� ��ȸ
*/
-- ����� �߿� ������ ����� �����,�޿�,�Ի��� ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '��%';

-- ��� �̸��� �㰡 ���Ե� ����� �����, �ֹι�ȣ, ����ó ��ȸ
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%';
-- ��� �̸��� ��� ���ڰ� ���� ����� �����, ����ó ��ȸ (�̸� 3���ڸ� �ִٸ�..)

SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_��_';

--������� ����ó 3��° �ڸ��� 1�� ����� ���,�����,����ó,�̸��� ��ȸ
SELECT EMP_ID,EMP_NAME,PHONE,EMAIL
FROM EMPLOYEE
WHERE PHONE LIKE '__1%';

-- ����� �� �̸��Ͽ� _�� ������ �ش� ���� ���� 3������ ����� ���,�̸�,�̸��� ��ȸ
SELECT EMP_ID,EMP_NAME,PHONE,EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '____%';
--> ���ϵ�ī��� ���Ǵ� ���ڿ� �Î��� ��� ���ڰ� �����ϱ� ������ ��� ���ϵ�ī��� �νĵ�!
--  ����, ������ ������� ! (=> ������ ���ϵ�ī�� ����ϱ�! ESCAPE�� ����� ��� �� ����!)
SELECT EMP_ID,EMP_NAME,PHONE,EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___$_%' ESCAPE '$';
/*
    IS NULL / IS NOT NULL : �÷����� NULL�� ���� ��� NULL���� ���Ҷ� ����ϴ� ������
*/
-- ���ʽ��� ���� �ʴ� ���(BONUS���� NULL!)���� ���,�̸�,�޿�,���ʽ� ��ȸ
SELECT EMP_ID,EMP_NAME,SALARY,BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL ;

-- ���ʽ� �޴� ���
SELECT EMP_ID,EMP_NAME,SALARY,BONUS
FROM EMPLOYEE
--WHERE BONUS IS NOT NULL ;
WHERE NOT BONUS IS NULL;

-- ����� ���� ��� (MANAGER_ID�� ���� NULL!)���� �����, ������(MANAGER_ID), �μ��ڵ� ��ȸ
SELECT EMP_NAME,MANAGER_ID,DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL; 

--�μ� ��ġ�� ���� �ʾҰ�, ���ʽ��� �ް� �ִ� �����,���ʽ�,�μ��ڵ� ��ȸ
--�μ� �ڵ尡 ����, ���ʽ� �ް��ִ� ���
SELECT EMP_NAME,BONUS,DEPT_CODE
FROM EMPLOYEE
WHERE BONUS IS NOT NULL AND DEPT_CODE IS NULL;

/*
    * ������ �켱����
      (0) () 
      (1) ��������� : * / + -
      (2) ���Ῥ���� : ||
      (3) �񱳿����� : > < >= <= != ..
      (4) IS NULL / LIKE '����' / IN
      (5) BETWEEN AND
      (6) NOT
      (7) AND
      (8) OR
*/
-- �����ڵ尡 J7�̰ų� J2�� ����� �� �޿��� 200���� �̻��� ����� ��� ������ ��ȸ
SELECT *
FROM EMPLOYEE
--WHERE JOB_CODE IN('J2','J7') AND SALARY >=2000000;
WHERE (JOB_CODE = 'J2' OR JOB_CODE = 'J7') AND SALARY >= 2000000;
/*
    * ORDER BY : SELECT ���� ���� ������ �ٿ� �ۼ�, ������� ���� �������� ����
    (ǥ����)
            SELECT ��ȸ�� �÷� ....
            FROM ���̺��
            WHERE ���ǽ�
            ORDER BY ���ı����� �Ǵ� �÷�|��Ī|�÷����� [ASC|DESC] [NULLS FIRST|NULLS LAST]
            
            * ASC : �������� ���� (�⺻��)
            * DESC  : �������� ����
            * NULLS FIRST : �����ϰ����ϴ� �÷��� ���� NULL�� ��� �ش� �����͸� �� �տ� ��ġ (DESC�� ��� �⺻��)
            * NULLS LAST : �����ϰ����ϴ� �÷��� ���� NULL�� ��� �ش� �����͸� �� �ڿ� ��ġ (ASC�� ��� �⺻��)
            => NULL ���� ū ������ �з��Ǿ� ���ĵ�!
*/
--��� ����� �����, ���� ��ȸ (������ �������� ����)
SELECT EMP_NAME �����,SALARY*12 ����
FROM EMPLOYEE
--ORDER BY SALARY *12 DESC; ���ı����̵Ǵ� �÷�(�����)
--ORDER BY ���� DESC;  -- ��Ī ��� ����
ORDER BY 2 DESC;       -- �÷� ���� ��� ���� (����Ŭ���� 1���� ����!)

-- ���ʽ� �������� ���� �غ���
SELECT *
FROM EMPLOYEE
--ORDER BY BONUS;  -- �⺻�� (ASC, NULLS LAST)
--ORDER BY BONUS ASC;
--ORDER BY BONUS ASC NULLS LAST;
--ORDER BY BONUS DESC; -- NULLS FIRST (DESC ������ ��� �⺻��)
ORDER BY BONUS DESC, SALARY ASC; -- ���ʽ��� �������� �޿��� �������� => ���ʽ� ���� �������� �����ϴµ�, ���� ���� ��� �޿��� ���� �������� ���� 

-- 1. EMPLOYEE ���̺� ������� 90/01/01~01/01/01 �� ����� ��ü ������ ��ȸ
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01'; 
-- 2. EMPLOYEE ���̺��� �̸� ���� '��'���� ������ ����� �̸� ��ȸ
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��' ;
-- 3. EMPLOYEE ���̺��� ��ȭ��ȣ ó�� 3�ڸ��� 010�� �ƴ� ����� �̸�,��ȭ��ȣ�� ��ȸ
SELECT EMP_NAME �̸�,PHONE ��ȭ��ȣ
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';

--WHERE EMAIL LIKE '___$_%' ESCAPE '$';
-- 4. EMPLOYEE ���̺��� �����ּ� '_'�� ���� 4���̸鼭 DEPT_CODE D9 �Ǵ� D6�̰�
--     ������� 90/01/01 ~ 00/12/01 �̰�, �޿��� 270�� �̻��� ����� ��ü�� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE (HIRE_DATE BETWEEN '90/01/01' AND '00/12/01') AND (SALARY >= 2700000) AND EMAIL LIKE '____$_%' ESCAPE '$';


--SELECT EMP_ID,EMP_NAME,PHONE,EMAIL
--FROM EMPLOYEE
--WHERE EMAIL LIKE '___$_%' ESCAPE '$';












