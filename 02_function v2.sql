-- ** �Լ� �ι�° ���� **
/*
    �����Լ� 
        * DECODE (�񱳴��(�÷�/�����/�Լ���), �񱳰�1, �����1, �񱳰�2, �����2,...)
        
        -- �ڹٿ��� SWITCH
        SWITCH(�񱳴��){
            CASE �񱳰� : �����
            CASE �񱳰� : ����� 
            ...
        }
*/
-- ���, �����, �ֹι�ȣ, ���� ��ȸ (������ ������ ���� ǥ��)(1: '��', 2:'��', 3:'����', 4:'����', '�˼�����')
SELECT EMP_ID ���,EMP_NAME �����, EMP_NO �ֹι�ȣ
        ,DECODE(SUBSTR(EMP_NO, 8,1), 1, '��', 2, '��', 3, '����', 4, '����', '�˼�����') ����
FROM EMPLOYEE;

-- �����, �����޿�, �λ�� �޿� ��ȸ
/*
    ������ J7�� ����� 10% �λ� 
          J6         15% �λ�
          J5         20% �λ�
    �� �ܿ���          5% �λ�
*/
SELECT EMP_NAME �����,SALARY �����޿�, 
DECODE(JOB_CODE, 'J5',SALARY *1.2 ,'J6',SALARY*1.15,'J7',SALARY*1.1,SALARY *1.05) "�λ�� �޿�"
FROM EMPLOYEE;
/*
    CASE WHEN THEN : ���ǽĿ� ���� ������� ��ȯ���ִ� �Լ�
    
    [ǥ����]
            CASS 
                WHEN ���ǽ�1 THEN �����1
                WHEN ���ǽ�2 THEN �����2
                ...
                ELSE ����� 
            END 
*/
-- �����, �޿�, �޿��� ���� ��� ��ȸ
/*
    �޿��� ..
    500���� �̻� '���'
    350���� �̻� '�߱�'
    �� �� '�ʱ�'
*/
SELECT EMP_NAME �����, SALARY �޿�, 
        CASE
            WHEN SALARY >= 5000000 THEN '���'
            WHEN SALARY >= 3500000 THEN '�߱�'
            ELSE '�ʱ�'
        END "�޿��� ���� ���"
FROM EMPLOYEE;
--===============================================================================
--======= �׷� �Լ� ===========
/*
    * SUM : �ش� �÷��� ������ �� ���� ��ȯ���ִ� �Լ�
    
    [ǥ����]
            SUM(����Ÿ���÷�)
*/
-- ��ü ������� �� �޿��� ��ȸ
SELECT SUM(SALARY) FROM EMPLOYEE;
-- 'XXX,XXX,XXX' �������� ǥ���Ѵٸ�...?
SELECT TO_CHAR(SUM(SALARY), 'L999,999,999') �ѱ޿� FROM EMPLOYEE;

-- ���ڻ������ �� �޿�
SELECT TO_CHAR(SUM(SALARY),'L999,999,999') "���ڻ�� �ѱ޿�" FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8,1) IN ('1','3');
-- ���ڻ������ �� �޿�
SELECT TO_CHAR(SUM(SALARY),'L999,999,999') "���ڻ�� �ѱ޿�" FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8,1) IN ('2','4');

-- �μ��ڵ尡 'D5'�� ������� �� ����
SELECT TO_CHAR(SUM(SALARY*12),'L999,999,999')
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';

/*
    AVG : �ش� �÷��� ������ ����� ��ȯ���ִ� �Լ�
    
    [ǥ����]
            AVG(����Ÿ���÷�) 
*/
-- ��ü ������� ��� �޿� ��ȸ (�ݿø� ���� : ROUND)
SELECT ROUND(AVG(SALARY)) "��ü ��� ��� �޿�"
FROM EMPLOYEE;

/*
    MIN : �ش� �÷��� ���� �� ���� ���� �� ��ȯ���ִ� �Լ�
    
    [ǥ����] MIN(���Ÿ��) 
*/
SELECT MIN(EMP_NAME) "����Ÿ�� �ּڰ�", MIN(SALARY) "����Ÿ�� �ּڰ�", MIN(HIRE_DATE) "��¥Ÿ�� �ּڰ�"
FROM EMPLOYEE;

/*
    MAX : �ش� �÷��� ���� �� ���� ū ���� ��ȯ���ִ� �Լ�
    [ǥ����] MAX(���Ÿ��)
*/
SELECT MAX(EMP_NAME) "����Ÿ�� �ִ�", MAX(SALARY) "����Ÿ�� �ִ�", MAX(HIRE_DATE) "��¥Ÿ�� �ִ�"
FROM EMPLOYEE;

/*
    COUNT : ���� ������ ��ȯ���ִ� �Լ� (��, ������ ���� ��� �ش� ���ǿ� �´� ���� ������ ��ȯ)
    
    [ǥ����]
            COUNT(*) : ��ȸ�� ����� ��� ���� ������ ��ȯ
            COUNT(�÷�) : �ش� �÷����� NULL�� �ƴ� �͸� ���� ������ ���� ��ȯ
            COUNT(DISTINCT �÷�) : �ش� �÷����� �ߺ��� ������ ���� ���� ������ ���� ��ȯ
                    => �ߺ� ���� �� NULL �� �������� �ʰ� ������ ������!
*/
-- ��ü ��� �� ��ȸ
SELECT COUNT(*) "��ü ��� ��" FROM EMPLOYEE;

-- ���� ��� �� ��ȸ
SELECT COUNT(*) FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN ('1','3');

-- ���ʽ� �޴� ��� �� ��ȸ
SELECT COUNT(BONUS) FROM EMPLOYEE;

SELECT COUNT(*) FROM EMPLOYEE WHERE BONUS IS NOT NULL;

-- �μ� ��ġ ���� ��� �� ��ȸ -> �μ��ڵ尡 NULL�� �ƴ� ���� ����
SELECT COUNT (DEPT_CODE) FROM EMPLOYEE;

SELECT COUNT(DISTINCT DEPT_CODE) FROM EMPLOYEE;

SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;
















