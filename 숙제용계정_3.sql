-- 11. 춘 기술대학교는 1 년에 두 번씩 학과별로 학생과 지도교수가 지도 면담을 진행핚다.
--이를 위해 사용핛 학생이름, 학과이름, 담당교수이름 으로 구성되어 있는 VIEW 를 맊드시오.
--이때 지도 교수가 없는 학생이 있을 수 있음을 고려하시오 (단, 이 VIEW 는 단순 SELECT
--맊을 핛 경우 학과별로 정렬되어 화면에 보여지게 맊드시오.)
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
-- 12. 모든 학과의 학과별 학생 수를 확인핛 수 있도록 적젃핚 VIEW 를 작성해 보자.
CREATE VIEW VW_STUCOUNT
    AS SELECT DEPARTMENT_NAME,COUNT(DEPARTMENT_NO) AS STUDENT_COUNT
FROM TB_DEPARTMENT 
JOIN TB_STUDENT USING (DEPARTMENT_NO) 
GROUP BY DEPARTMENT_NAME
;
-- 13. 위에서 생성핚 학생일반정보 View 를 통해서 학번이 A213046 인 학생의 이름을 본인
-- 이름으로 변경하는 SQL 문을 작성하시오.
SELECT * FROM VW_STUCOUNT; -- GIVE UP


--[DML
-- 1. 과목유형 테이블(TB_CLASS_TYPE)에 아래와 같은 데이터를 입력하시오.
ALTER TABLE TB_CLASS_TYPE MODIFY (NAME VARCHAR2(20));
INSERT INTO TB_CLASS_TYPE (TB_NO, NAME) VALUES ('01', '전공필수');
INSERT INTO TB_CLASS_TYPE (TB_NO, NAME) VALUES ('02', '전공선택');
INSERT INTO TB_CLASS_TYPE (TB_NO, NAME) VALUES ('03', '교양필수');
INSERT INTO TB_CLASS_TYPE (TB_NO, NAME) VALUES ('04', '교양선택');
INSERT INTO TB_CLASS_TYPE (TB_NO, NAME) VALUES ('05', '논문지도');
-- 2. 춘 기술대학교 학생들의 정보가 포함되어 있는 학생일반정보 테이블을 맊들고자 핚다. 
-- 아래 내용을 참고하여 적젃핚 SQL 문을 작성하시오. (서브쿼리를 이용하시오)
CREATE TABLE TB_STUINFO 
    AS SELECT STUDENT_NO,STUDENT_NAME,STUDENT_ADDRESS
    FROM TB_STUDENT
;
SELECT * FROM TB_STUINFO;
--3. 국어국문학과 학생들의 정보맊이 포함되어 있는 학과정보 테이블을 맊들고자 핚다. 
--아래 내용을 참고하여 적젃핚 SQL 문을 작성하시오. (힌트 : 방법은 다양함, 소신껏
--작성하시오)
CREATE TABLE TB_KOREAN
    AS SELECT STUDENT_NO,STUDENT_NAME,'19' || SUBSTR(STUDENT_SSN,1,2) AS " 출생년도",PROFESSOR_NAME
    FROM TB_STUDENT
    JOIN TB_PROFESSOR ON COACH_PROFESSOR_NO = PROFESSOR_NO;
SELECT * FROM TB_KOREAN;
-- 4. 현 학과들의 정원을 10% 증가시키게 되었다. 이에 사용핛 SQL 문을 작성하시오. (단, 
-- 반올림을 사용하여 소수점 자릿수는 생기지 않도록 핚다)
UPDATE TB_DEPARTMENT
SET CAPACITY = CAPACITY*1.1;
SELECT CAPACITY FROM TB_DEPARTMENT;
-- 5. 학번 A413042 인 박건우 학생의 주소가 "서울시 종로구 숭인동 181-21 "로 변경되었다고
-- 핚다. 주소지를 정정하기 위해 사용핛 SQL 문을 작성하시오.
UPDATE TB_STUDENT
SET STUDENT_ADDRESS = '서울시 종로구 숭인동 181-21'
WHERE STUDENT_NO = 'A413042';
SELECT * FROM TB_STUDENT WHERE STUDENT_NO = 'A413042';
-- 6. 주민등록번호 보호법에 따라 학생정보 테이블에서 주민번호 뒷자리를 저장하지 않기로
-- 결정하였다. 이 내용을 반영핛 적젃핚 SQL 문장을 작성하시오.
-- (예. 830530-2124663 ==> 830530 )
UPDATE TB_STUDENT
SET STUDENT_SSN = SUBSTR(STUDENT_SSN,1,6);
SELECT * FROM TB_STUDENT;
--7. 의학과 김명훈 학생은 2005 년 1 학기에 자신이 수강핚 '피부생리학' 점수가
--잘못되었다는 것을 발견하고는 정정을 요청하였다. 담당 교수의 확인 받은 결과 해당
--과목의 학점을 3.5 로 변경키로 결정되었다. 적젃핚 SQL 문을 작성하시오.
UPDATE TB_GRADE
SET POINT = 3.5
WHERE STUDENT_NO = 
(SELECT STUDENT_NO FROM TB_STUDENT JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE STUDENT_NAME = '김명훈'AND DEPARTMENT_NAME = '피부생리학');
-- 이거 문제가 김명훈이란 학생도 없고 의학과도 없어요...
--8. 성적 테이블(TB_GRADE) 에서 휴학생들의 성적항목을 제거하시오.
DELETE FROM TB_GRADE WHERE STUDENT_NO IN (
    SELECT STUDENT_NO
    FROM TB_STUDENT
    WHERE ABSENCE_YN = 'Y'
);
SELECT * FROM TB_GRADE;



