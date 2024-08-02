-- 11. �� ������б��� 1 �⿡ �� ���� �а����� �л��� ���������� ���� ����� ��������.
--�̸� ���� ����� �л��̸�, �а��̸�, ��米���̸� ���� �����Ǿ� �ִ� VIEW �� ����ÿ�.
--�̶� ���� ������ ���� �л��� ���� �� ������ ����Ͻÿ� (��, �� VIEW �� �ܼ� SELECT
--���� �� ��� �а����� ���ĵǾ� ȭ�鿡 �������� ����ÿ�.)
GRANT SELECT ON TB_STUDENT TO C##WORKBOOK;
GRANT SELECT ON TB_DEPARTMENT TO C##WORKBOOK;
GRANT SELECT ON TB_PROFESSOR TO C##WORKBOOK;
GRANT CREATE VIEW TO C##WORKBOOK;
CREATE VIEW VW_JIDO
    AS SELECT STUDENT_NAME,DEPARTMENT_NAME,PROFESSOR_NAME
    FROM TB_STUDENT
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
    JOIN TB_PROFESSOR ON COACH_PROFESSOR_NO = PROFESSOR_NO;
SELECT * FROM VW_JIDO;
-- 12. ��� �а��� �а��� �л� ���� Ȯ���� �� �ֵ��� ������ VIEW �� �ۼ��� ����.
CREATE VIEW VW_STUCOUNT
    AS SELECT DEPARTMENT_NAME,COUNT(DEPARTMENT_NO) AS STUDENT_COUNT
FROM TB_DEPARTMENT 
JOIN TB_STUDENT USING (DEPARTMENT_NO) 
GROUP BY DEPARTMENT_NAME
;
-- 13. ������ ������ �л��Ϲ����� View �� ���ؼ� �й��� A213046 �� �л��� �̸��� ����
-- �̸����� �����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT * FROM VW_STUCOUNT; -- GIVE UP


--[DML
-- 1. �������� ���̺�(TB_CLASS_TYPE)�� �Ʒ��� ���� �����͸� �Է��Ͻÿ�.
ALTER TABLE TB_CLASS_TYPE MODIFY (NAME VARCHAR2(20));
INSERT INTO TB_CLASS_TYPE (TB_NO, NAME) VALUES ('01', '�����ʼ�');
INSERT INTO TB_CLASS_TYPE (TB_NO, NAME) VALUES ('02', '��������');
INSERT INTO TB_CLASS_TYPE (TB_NO, NAME) VALUES ('03', '�����ʼ�');
INSERT INTO TB_CLASS_TYPE (TB_NO, NAME) VALUES ('04', '���缱��');
INSERT INTO TB_CLASS_TYPE (TB_NO, NAME) VALUES ('05', '������');
-- 2. �� ������б� �л����� ������ ���ԵǾ� �ִ� �л��Ϲ����� ���̺��� ������� ����. 
-- �Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�. (���������� �̿��Ͻÿ�)
CREATE TABLE TB_STUINFO 
    AS SELECT STUDENT_NO,STUDENT_NAME,STUDENT_ADDRESS
    FROM TB_STUDENT
;
SELECT * FROM TB_STUINFO;
--3. ������а� �л����� �������� ���ԵǾ� �ִ� �а����� ���̺��� ������� ����. 
--�Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�. (��Ʈ : ����� �پ���, �ҽŲ�
--�ۼ��Ͻÿ�)
CREATE TABLE TB_KOREAN
    AS SELECT STUDENT_NO,STUDENT_NAME,'19' || SUBSTR(STUDENT_SSN,1,2) AS " ����⵵",PROFESSOR_NAME
    FROM TB_STUDENT
    JOIN TB_PROFESSOR ON COACH_PROFESSOR_NO = PROFESSOR_NO;
SELECT * FROM TB_KOREAN;
-- 4. �� �а����� ������ 10% ������Ű�� �Ǿ���. �̿� ����� SQL ���� �ۼ��Ͻÿ�. (��, 
-- �ݿø��� ����Ͽ� �Ҽ��� �ڸ����� ������ �ʵ��� ����)
UPDATE TB_DEPARTMENT
SET CAPACITY = CAPACITY*1.1;
SELECT CAPACITY FROM TB_DEPARTMENT;
-- 5. �й� A413042 �� �ڰǿ� �л��� �ּҰ� "����� ���α� ���ε� 181-21 "�� ����Ǿ��ٰ�
-- ����. �ּ����� �����ϱ� ���� ����� SQL ���� �ۼ��Ͻÿ�.
UPDATE TB_STUDENT
SET STUDENT_ADDRESS = '����� ���α� ���ε� 181-21'
WHERE STUDENT_NO = 'A413042';
SELECT * FROM TB_STUDENT WHERE STUDENT_NO = 'A413042';
-- 6. �ֹε�Ϲ�ȣ ��ȣ���� ���� �л����� ���̺��� �ֹι�ȣ ���ڸ��� �������� �ʱ��
-- �����Ͽ���. �� ������ �ݿ��� ������ SQL ������ �ۼ��Ͻÿ�.
-- (��. 830530-2124663 ==> 830530 )
UPDATE TB_STUDENT
SET STUDENT_SSN = SUBSTR(STUDENT_SSN,1,6);
SELECT * FROM TB_STUDENT;
--7. ���а� ����� �л��� 2005 �� 1 �б⿡ �ڽ��� ������ '�Ǻλ�����' ������
--�߸��Ǿ��ٴ� ���� �߰��ϰ�� ������ ��û�Ͽ���. ��� ������ Ȯ�� ���� ��� �ش�
--������ ������ 3.5 �� ����Ű�� �����Ǿ���. ������ SQL ���� �ۼ��Ͻÿ�.
UPDATE TB_GRADE
SET POINT = 3.5
WHERE STUDENT_NO = 
(SELECT STUDENT_NO FROM TB_STUDENT JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE STUDENT_NAME = '�����'AND DEPARTMENT_NAME = '�Ǻλ�����');
-- �̰� ������ ������̶� �л��� ���� ���а��� �����...
--8. ���� ���̺�(TB_GRADE) ���� ���л����� �����׸��� �����Ͻÿ�.
DELETE FROM TB_GRADE WHERE STUDENT_NO IN (
    SELECT STUDENT_NO
    FROM TB_STUDENT
    WHERE ABSENCE_YN = 'Y'
);
SELECT * FROM TB_GRADE;



