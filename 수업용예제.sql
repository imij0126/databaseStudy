--sql
-- ���� ����� ���� ���� �� �Ʒ� ������ �ۼ����ּ���.
-- ID/PW  :  C##TESTUSER / 1234
CREATE USER C##TESTUSER IDENTIFIED BY "1234";
GRANT CONNECT, RESOURCE TO C##TESTUSER;
-- �Ʒ� ������ �߰��ϱ� ���� ���̺��� �������ּ���.
-- �� �÷��� ������ �߰����ּ���.
--=========================================================
/*
	- �л� ���� ���̺� : STUDENT
	- ���� ����
	  - �л� �̸�, ��������� NULL���� ������� �ʴ´�.
	  - �̸����� �ߺ��� ������� �ʴ´�.
	- ���� ������
		+ �л� ��ȣ ex) 1, 2, 3, ...
		+ �л� �̸� ex) '�踻��', '�ƹ���', ...
		+ �̸���    ex) 'kim12@kh.or.kr', 'dogdog@kh.or.kr', ...
		+ �������  ex) '24/07/25', '00/02/20', '88/12/25', ...
*/
create table STUDENT(
    STU_NUMBER NUMBER,
    STU_NAME VARCHAR2(100) NOT NULL,
    EMAIL VARCHAR2(100) UNIQUE,
    BIRTH DATE NOT NULL
    --, UNIQUE(EMAIL) -- ���̺������
);
COMMENT ON COLUMN STUDENT.STU_NUMBER IS '�л� ��ȣ';
COMMENT ON COLUMN STUDENT.STU_NAME IS '�л� �̸�';
COMMENT ON COLUMN STUDENT.EMAIL IS '�̸���';
COMMENT ON COLUMN STUDENT.BIRTH IS '�������';
    DROP TABLE STUDENT;

INSERT INTO STUDENT 
    VALUES(1,'��ٿ�', 'KIDAWUN.OR.KR','95/04/01');
    
INSERT INTO STUDENT 
    VALUES(2,'NULL','INCHANG@.OR.KR',NULL); -->STU_NAME �÷��� NOT NULL ���࿡ �����

INSERT INTO STUDENT
    VALUES(3,'���ǿ�', 'KIDAWUN.OR.KR','99/09/28'); --> EMAIL �÷��� UNIQUE ���࿡ �����!
------------------------------------------------------------
/*
	- ���� ���� ���̺� : BOOK
	- ���� ����
	  - ����� ���ڸ��� NULL���� ������� �ʴ´�.
	  - ISBN ��ȣ�� �ߺ��� ������� �ʴ´�.
	- ���� ������
	  + ���� ��ȣ ex) 1, 2, 3, ...
	  + ���� ex) '�ﱹ��', '�����', '�ڽ���', ...
	  + ���� ex) '����', '�������丮', 'Į ���̰�', ...
	  + ������ ex) '14/02/14', '22/09/19', ...
	  + ISBN��ȣ ex) '9780394502946', '9780152048044', ...
*/
CREATE TABLE BOOK(
    BOOK_NUMBER NUMBER,
    BOOK_TITLE VARCHAR2(200) NOT NULL, 
    BOOK_AUTHOR VARCHAR2(200) NOT NULL,
    PUB_DATE DATE,
    BOOK_ISBN VARCHAR(20) CONSTRAINT ISBN_UQ UNIQUE
    --, UNIQUE(BOOK_ISBN)
);
DROP TABLE BOOK;

COMMENT ON COLUMN BOOK.BOOK_NUMBER IS '���� ��ȣ';
COMMENT ON COLUMN BOOK.BOOK_TITLE IS '���� ����';
COMMENT ON COLUMN BOOK.BOOK_AUTHOR IS '���ڸ�';
COMMENT ON COLUMN BOOK.PUB_DATE IS '������';
COMMENT ON COLUMN BOOK.BOOK_ISBN IS '�Ϸù�ȣ(ISBN)';

INSERT INTO BOOK
VALUES(1,'�����','�������丮','24/07/25','9780152048044');
INSERT INTO BOOK
VALUES(2,'�����2','�������丮','34/07/25','9780152048044');
    --> ISBNĮ���� UNIQUE ���࿡ �����. ���� ���뿡 ������ �������Ǹ����� ǥ�õ�!
-- COMMIT;  -- ������ ����
-- ROLLBACK;  -- ������ �������� ����
    
------------------------------------------------------------
```