--. 1.�� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭"
--���� ǥ���ϵ��� ����.
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT;

--2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 �������.
SELECT DEPARTMENT_NAME||'�� ������ ' || CAPACITY || '�� �Դϴ�.'
FROM TB_DEPARTMENT;

--3. "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û��
--���Դ�. �����ΰ�? (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ�
--ã�� ������ ����)
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y' AND SUBSTR(STUDENT_SSN,8,1) = '2' AND DEPARTMENT_NO = '001';
--4. ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� ����. �� ����ڵ���
--�й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119');
-- 5. ���������� 20 �� �̻� 30 �� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
SELECT DEPARTMENT_NAME,CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY >= 20 AND CAPACITY <=30;
--6. �� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�. �׷� ��
--������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;
--7. Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� ����.
--��� SQL ������ ����ϸ� �� ������ �ۼ��Ͻÿ�.
SELECT *
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;
-- 8. ������û�� �Ϸ��� ����. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ�
-- ������� � �������� �����ȣ�� ��ȸ�غ��ÿ�
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

--9. �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�.
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT;
-- 10. 02 �й� ���� �����ڵ��� ������ ������� ����. ������ ������� ������ ��������
-- �л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NO,STUDENT_NAME,STUDENT_SSN
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_ADDRESS,1,2) = '����' AND SUBSTR(ENTRANCE_DATE,1,2) = '02';

--[Additional SELECT - �Լ�]

-- 1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ����
-- ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.( ��, ����� "�й�", "�̸�", "���г⵵" ��
-- ǥ�õǵ��� ����.)
SELECT STUDENT_NO �й�, STUDENT_NAME �̸�,TO_CHAR(ENTRANCE_DATE,'YYYY-MM-DD') ���г⵵
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY 3;

-- 2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� ����. �� ������
-- �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����. (* �̶� �ùٸ��� �ۼ��� SQL
-- ������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)
SELECT PROFESSOR_NAME,PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE NOT PROFESSOR_NAME LIKE '___';
-- 3) �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��
-- �̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�. (��, ���� ��
-- 2000 �� ���� ����ڴ� ������ ��� ����� "�����̸�", "����"�� ����. ���̴� ����������
-- �������.)
SELECT PROFESSOR_NAME �����̸�,CEIL((TO_DATE(SUBSTR(PROFESSOR_SSN, 1, 6), 'YYMMDD') - SYSDATE)/365) AS ����
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8, 1) = '1'
ORDER BY ����;
-- 4) �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��� �����
-- ?�̸�? �� �������� ����. (���� 2 ���� ���� ������ ���ٰ� �����Ͻÿ�)
SELECT SUBSTR(PROFESSOR_NAME,2,2) �̸�
FROM TB_PROFESSOR;
-- 5) �� ������б��� ����� �����ڸ� ���Ϸ��� ����. ��� ã�Ƴ� ���ΰ�? �̶�,
-- 19 �쿡 �����ϸ� ����� ���� ���� ������ �A������.
SELECT STUDENT_NO,
       STUDENT_NAME,
       EXTRACT(YEAR FROM ENTRANCE_DATE) - EXTRACT(YEAR FROM TO_DATE('19' || SUBSTR(STUDENT_SSN, 1, 6), 'YYYYMMDD')) AS ����
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) - EXTRACT(YEAR FROM TO_DATE('19' || SUBSTR(STUDENT_SSN, 1, 6), 'YYYYMMDD')) > 19 ;
-- 6. 2020 �� ũ���������� ���� �����ΰ�?
SELECT TO_CHAR(SYSDATE -1309,'DY') ũ����������¥
FROM DUAL;
-- 7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') �� ���� �� �� ��
-- �� �� ���� �ǹ�����? �� TO_DATE('99/10/11','RR/MM/DD'),
-- TO_DATE('49/10/11','RR/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ�����?
SELECT TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD')
FROM DUAL;

--8. �� ������б��� 2000 �⵵ ���� �����ڵ��� �й��� A �� �����ϰ� �Ǿ��ִ�. 2000 �⵵
--���� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NO,STUDENT_NAME
FROM TB_STUDENT
WHERE ENTRANCE_DATE < TO_DATE('00/03/01','YY/MM/DD');
--9. �й��� A517178 �� ���Ƹ� �л��� ���� �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��,
-- �̶� ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� ��
-- �ڸ������� ǥ������.
SELECT ROUND(AVG(POINT),1) ���
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';
-- 10. �а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)" �� ���·� ����� ����� �������
-- ��µǵ��� �Ͻÿ�.
SELECT DEPARTMENT_NO,COUNT(*)
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;
--11. ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ� �˾Ƴ��� SQL ����
--�ۼ��Ͻÿ�.
SELECT COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;
--12. �й��� A112113 �� ���� �л��� �⵵ �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��,
-- �̶� ��� ȭ���� ����� "�⵵", "�⵵ �� ����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ�
-- �Ҽ��� ���� �� �ڸ������� ǥ������.
SELECT SUBSTR(TERM_NO,1,4) �⵵, ROUND(AVG(POINT),1) "�⵵ �� ����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4);
--13. �а� �� ���л� ���� �ľ��ϰ��� ����. �а� ��ȣ�� ���л� ���� ǥ���ϴ� SQL ������
--�ۼ��Ͻÿ�.
SELECT DEPARTMENT_NO �а��ڵ��,COUNT(CASE WHEN ABSENCE_YN = 'Y' THEN 1 END) "���л� ��"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;
-- 14. �� ���б��� �ٴϴ� ��������(��٣���) �л����� �̸��� ã���� ����. � SQL
-- ������ ����ϸ� �����ϰڴ°�?
SELECT STUDENT_NAME �̸�,
       COUNT(*) AS �л���
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1
ORDER BY �̸� ASC;  
--15. �й��� A112113 �� ���� �л��� �⵵, �б� �� ������ �⵵ �� ���� ���� , ��
--������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ������� �ݿø��Ͽ�
--ǥ������.)
SELECT SUBSTR(TERM_NO,1,4) �⵵,SUBSTR(), ROUND(AVG(POINT),1) "����"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY TERM_NO; -- GIVE UP
--[Additional SELECT - Option]
-- 1. �л��̸��� �ּ����� ǥ���Ͻÿ�. ��, ��� ����� "�л� �̸�", "�ּ���"�� �ϰ�,
-- ������ �̸����� �������� ǥ���ϵ��� ����.
SELECT STUDENT_NAME "�л� �̸�",STUDENT_ADDRESS "�ּ���"
FROM TB_STUDENT
ORDER BY 1;
-- 2. �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ȭ�鿡 ����Ͻÿ�.
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;
-- 3. �ּ����� �������� ��⵵�� �л��� �� 1900 ��� �й��� ���� �л����� �̸��� �й�,
-- �ּҸ� �̸��� ������������ ȭ�鿡 ����Ͻÿ�. ��, ���������� "�л��̸�","�й�",
-- "������ �ּ�" �� ��µǵ��� ����.
SELECT STUDENT_NAME �л��̸�,STUDENT_NO �й�,STUDENT_ADDRESS "������ �ּ�"
FROM TB_STUDENT
WHERE STUDENT_ADDRESS LIKE '��⵵%' AND ENTRANCE_DATE < TO_DATE('00/03/01','YY/MM/DD')
ORDER BY 1 ASC;
--4. ���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ���� �� �ִ� SQL ������
--�ۼ��Ͻÿ�. (���а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã��
--������ ����)
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NO = '005';
-- 5. 2004 �� 2 �б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� ����. ������
-- ���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л����� ǥ���ϴ� ������
-- �ۼ��غ��ÿ�.
SELECT STUDENT_NO,POINT
FROM TB_GRADE
WHERE TERM_NO = 200402 AND CLASS_NO = 'C3118100'
ORDER BY 2 DESC;
--6. �л� ��ȣ, �л� �̸�, �а� �̸��� �л� �̸����� �������� �����Ͽ� ����ϴ� SQL
-- ���� �ۼ��Ͻÿ�.
SELECT STUDENT_NO,STUDENT_NAME,DEPARTMENT_NAME
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
ORDER BY STUDENT_NO ASC;
-- 7. �� ������б��� ���� �̸��� ������ �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO);
--8. ���� ���� �̸��� ã������ ����. ���� �̸��� ���� �̸��� ����ϴ� SQL ����
-- �ۼ��Ͻÿ�.
SELECT DISTINCT CLASS_NAME,PROFESSOR_NAME
FROM TB_CLASS
    JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
    JOIN TB_PROFESSOR USING (PROFESSOR_NO);
--9. 8 ���� ��� �� ���ι���ȸ�� �迭�� ���� ������ ���� �̸��� ã������ ����. �̿�
--�ش��ϴ� ���� �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
    JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
    JOIN TB_PROFESSOR USING (PROFESSOR_NO)
WHERE CATEGORY = '�ι���ȸ';
--10. �������а��� �л����� ������ ���Ϸ��� ����. �����а� �л����� "�й�", "�л� �̸�",
--"��ü ����"�� ����ϴ� SQL ������ �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ�������
--�ݿø��Ͽ� ǥ������.)
SELECT STUDENT_NO �й�,STUDENT_NAME "�л� �̸�",POINT "����"
FROM TB_STUDENT
JOIN TB_GRADE USING(STUDENT_NO)
JOIN TB_CLASS USING(CLASS_NO)
WHERE CLASS_NAME = '�����а�'; -- GIVE UP
--11. �й��� A313047 �� �л��� �б��� ������ ���� �ʴ�. ���� �������� ������ �����ϱ�
--���� �а� �̸�, �л� �̸��� ���� ���� �̸��� �ʿ��ϴ�. �̶� ����� SQL ����
--�ۼ��Ͻÿ�. ��, �������� ?�а��̸�?, ?�л��̸�?, ?���������̸�?����
--��µǵ��� ����.
SELECT DEPARTMENT_NAME "�а��̸�", STUDENT_NAME "�л��̸�",PROFESSOR_NAME "���������̸�"
FROM TB_DEPARTMENT
JOIN TB_STUDENT USING (DEPARTMENT_NO)
JOIN TB_PROFESSOR ON COACH_PROFESSOR_NO = PROFESSOR_NO
WHERE STUDENT_NO = 'A313047';
-- 12. 2007 �⵵�� '�΁A�����' ������ ������ �л��� ã�� �л��̸��� �����б⸧ ǥ���ϴ�
-- SQL ������ �ۼ��Ͻÿ�.
SELECT STUDENT_NAME,TERM_NO "TERM_NAME"
FROM TB_STUDENT
JOIN TB_GRADE USING(STUDENT_NO)
JOIN TB_CLASS USING(CLASS_NO)
WHERE CLASS_NAME = '�ΰ������' AND TERM_NO IN (200701,200703) ;
-- 13. ��ü�� �迭 ���� �� ���� ��米���� �� �� �������� ���� ������ ã�� �� ����
-- �̸��� �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
     LEFT JOIN TB_CLASS_PROFESSOR USING(CLASS_NO)
     LEFT JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE CATEGORY = '��ü��'
      AND PROFESSOR_NO IS NULL; -- GIVE UP
--14. �� ������б� ���ݾƾ��а� �л����� ���������� �Խ��ϰ��� ����. �л��̸���
--�������� �̸��� ã�� ���� ���� ������ ���� �л��� ��� "�������� ������?����
--ǥ���ϵ��� �ϴ� SQL ���� �ۼ��Ͻÿ�. ��, �������� ?�л��̸�?, ?��������?��
--ǥ���ϸ� ���й� �л��� ���� ǥ�õǵ��� ����.

SELECT TB_STUDENT.STUDENT_NAME �л��̸�, TB_PROFESSOR.PROFESSOR_NAME
FROM TB_STUDENT
JOIN TB_PROFESSOR ON TB_STUDENT.COACH_PROFESSOR_NO = TB_PROFESSOR.PROFESSOR_NO
JOIN TB_DEPARTMENT ON TB_STUDENT.DEPARTMENT_NO = TB_DEPARTMENT.DEPARTMENT_NO
WHERE TB_DEPARTMENT.DEPARTMENT_NAME = '���ݾƾ��а�';
-- 15. ���л��� �ƴ� �л� �� ������ 4.0 �̻��� �л��� ã�� �� �л��� �й�, �̸�, �а�
-- �̸�, ������ ����ϴ� SQL ���� �ۼ��Ͻÿ�.
SELECT STUDENT_NO �й�,STUDENT_NAME �̸�,CLASS_NAME "�а� �̸�",AVG(TB_GRADE.POINT) ���� 
FROM TB_STUDENT 
JOIN TB_CLASS ON TB_STUDENT.DEPARTMENT_NO = TB_CLASS.DEPARTMENT_NO
JOIN TB_GRADE ON TB_CLASS.CLASS_NO = TB_GRADE.CLASS_NO
WHERE ABSENCE_YN = 'N' AND AVG(TB_GRADE.POINT) >= 4.0; -- GIVE UP
-- 16. �Q�������а� ����������� ���� �� ������ �ľ��� �� �ִ� SQL ���� �ۼ��Ͻÿ�
SELECT TB_CLASS.CLASS_NO, TB_CLASS.CLASS_NAME,AVG(TB_GRADE.POINT)
FROM TB_CLASS
JOIN TB_GRADE ON TB_CLASS.CLASS_NO = TB_GRADE.CLASS_NO
JOIN TB_STUDENT ON TB_GRADE.STUDENT_NO = TB_STUDENT.STUDENT_NO
JOIN TB_DEPARTMENT ON TB_STUDENT.DEPARTMENT_NO = TB_DEPARTMENT.DEPARTMENT_NO
WHERE TB_DEPARTMENT.DEPARTMENT_NAME = 'ȯ�������а�'AND CLASS_TYPE LIKE '����%'
GROUP BY TB_CLASS.CLASS_NO,TB_CLASS.CLASS_NAME;

-- DDL
-- 1. �迭 ������ ������ ī�װ� ���̺��� ������� ����. ������ ���� ���̺���
-- �ۼ��Ͻÿ�.
CREATE TABLE TB_CATEGORY (
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y'
);
--2���� ������ ������ ���̺��� ������� ����. ������ ���� ���̺��� �ۼ��Ͻÿ�.
CREATE TABLE TB_CLASS_TYPE(
    NO VARCHAR2(5) PRIMARY KEY,
    NAME VARCHAR2(10)
);
-- 3. TB_CATAGORY ���̺��� NAME �÷��� PRIMARY KEY �� �����Ͻÿ�.
-- (KEY �̸��� �������� �ʾƵ� ������. ���� KEY �̸� �����ϰ��� ���ٸ� �̸��� ������
-- �˾Ƽ� ������ �̸��� �������.)
ALTER TABLE TB_CATEGORY ADD PRIMARY KEY(NAME);
--4. TB_CLASS_TYPE ���̺��� NAME �÷��� NULL ���� ���� �ʵ��� �Ӽ��� �����Ͻÿ�.
ALTER TABLE TB_CLASS_TYPE MODIFY NAME NOT NULL;
--5. �� ���̺��� �÷� ���� NO �� ���� ���� Ÿ���� �����ϸ鼭 ũ��� 10 ����, �÷�����
-- NAME �� ���� ���C������ ���� Ÿ���� �����ϸ鼭 ũ�� 20 ���� �����Ͻÿ�.
ALTER TABLE TB_CLASS_TYPE MODIFY NO CHAR(10);
ALTER TABLE TB_CATEGORY MODIFY NAME VARCHAR(20);
-- 6. �� ���̺��� NO �÷��� NAME �÷��� �̸��� �� �� TB_ �� ������ ���̺� �̸��� �տ�
-- ���� ���·� ��������.
ALTER TABLE TB_CATEGORY RENAME COLUMN NAME TO TB_NAME;
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NO TO TB_NO;
--7. TB_CATAGORY ���̺�� TB_CLASS_TYPE ���̺��� PRIMARY KEY �̸��� ������ ����
-- �����Ͻÿ�. Primary Key �� �̸��� ?PK_ + �÷��̸�?���� �����Ͻÿ�. (ex. PK_CATEGORY_NAME )
ALTER TABLE TB_CATEGORY DROP CONSTRAINT SYS_C008461;
ALTER TABLE TB_CATEGORY ADD CONSTRAINT PK_CATEGORY_NAME PRIMARY KEY (TB_NAME);
--8. ������ ���� INSERT ���� ��������.
INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('�ڿ�����','Y');
INSERT INTO TB_CATEGORY VALUES ('����','Y');
INSERT INTO TB_CATEGORY VALUES ('��ü��','Y');
INSERT INTO TB_CATEGORY VALUES ('�ι���ȸ','Y');
COMMIT; 
-- 9.TB_DEPARTMENT �� CATEGORY �÷��� TB_CATEGORY ���̺��� CATEGORY_NAME �÷��� �θ�
-- ������ �����ϵ��� FOREIGN KEY �� �����Ͻÿ�. �� �� KEY �̸���
-- FK_���̺��̸�_�÷��̸����� ��������. (ex. FK_DEPARTMENT_CATEGORY )
ALTER TABLE TB_CATEGORY ADD FOREIGN KEY(TB_NAME) REFERENCES TB_DEPARTMENT;
--10. �� ������б� �л����� �������� ���ԵǾ� �ִ� �л��Ϲ����� VIEW �� ������� ����.
-- �Ʒ� ������ �����Ͽ� ������ SQL ���� �ۼ��Ͻÿ�.
CREATE VIEW VW_STU_INFO
    AS SELECT STUDENT_NO , STUDENT_NAME, STUDENT_ADDRESS
    FROM TB_STUDENT;
