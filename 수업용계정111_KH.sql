SET SERVEROUTPUT ON;
declare
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    JCODE EMPLOYEE.JOB_CODE%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
    DTITLE DEPARTMENT.DEPT_TITLE%TYPE;
BEGIN
    SELECT EMP_ID,EMP_NAME,JOB_CODE,SALARY,DEPT_TITLE
    INTO EID,ENAME,JCODE,SAL,DTITLE
    FROM EMPLOYEE JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
    WHERE EMP_ID = &사번;
    DBMS_OUTPUT.PUT_LINE ('EID = ' || EID);
    DBMS_OUTPUT.PUT_LINE ('ENAME = ' || ENAME);
    DBMS_OUTPUT.PUT_LINE ('JCODE = ' || JCODE);
    DBMS_OUTPUT.PUT_LINE ('SAL = ' || SAL);
    DBMS_OUTPUT.PUT_LINE ('DTITLE = ' || DTITLE);
END;
/

DECLARE 
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
    BONUS EMPLOYEE.BONUS%TYPE;
BEGIN 
    SELECT EMP_ID,EMP_NAME,SALARY,BONUS
    INTO EID,ENAME,SAL,BONUS
    FROM EMPLOYEE WHERE EMP_ID = &사번;
    IF BONUS IS NULL THEN DBMS_OUTPUT.PUT_LINE('보너스를 받지 않는 사원');
    ELSE 
    DBMS_OUTPUT.PUT_LINE('EID = ' || EID || ', ENAME = ' || ENAME || ', SALARY = ' || SAL || ' BONUS = ' || BONUS);
    END IF;
END;
/

DECLARE
    SCORE NUMBER;
    GRADE CHAR(1);
BEGIN
    SCORE := &점수;
    IF SCORE >= 90 THEN GRADE := 'A';
    ELSIF SCORE >= 80 THEN GRADE := 'B';
    ELSIF SCORE >= 70 THEN GRADE := 'C';
    ELSIF SCORE >= 60 THEN GRADE := 'D';
    ELSE GRADE := 'F';
    END IF;
    DBMS_OUTPUT.PUT_LINE('당신의 점수는 ' || GRADE || '에요');
    IF GRADE = 'F' THEN DBMS_OUTPUT.PUT_LINE('불합격이에요');
    END IF;
END;
/

BEGIN
    FOR I IN 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/

DROP TABLE TEST;
DROP SEQUENCE SEQ_TNO;
CREATE TABLE TEST(
    TNO NUMBER PRIMARY KEY,
    TDATE DATE
);

CREATE SEQUENCE SEQ_TNO
INCREMENT BY 2
MAXVALUE 1500
NOCYCLE
NOCACHE;

BEGIN 
    FOR I IN 1..100 LOOP
    INSERT INTO TEST VALUES(SEQ_TNO.NEXTVAL,SYSDATE);
    END LOOP;
END;
/
SELECT * FROM TEST;

DECLARE 
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_ID,EMP_NAME INTO EID,ENAME FROM EMPLOYEE WHERE EMP_ID = &사번;
    DBMS_OUTPUT.PUT_LINE('EID = ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME = ' || ENAME);
EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('없는 데이터입니다.');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('이상한거 입력하지 말랬지!');
END;
/
ROLLBACK;