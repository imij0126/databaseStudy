--. 1.춘 기술대학교의 학과 이름과 계열을 표시하시오. 단, 출력 헤더는 "학과 명", "계열"
--으로 표시하도록 핚다.
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT;

--2. 학과의 학과 정원을 다음과 같은 형태로 화면에 출력핚다.
SELECT DEPARTMENT_NAME||'의 정원은 ' || CAPACITY || '명 입니다.'
FROM TB_DEPARTMENT;

--3. "국어국문학과" 에 다니는 여학생 중 현재 휴학중인 여학생을 찾아달라는 요청이
--들어왔다. 누구인가? (국문학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서
--찾아 내도록 하자)
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y' AND SUBSTR(STUDENT_SSN,8,1) = '2' AND DEPARTMENT_NO = '001';
--4. 도서관에서 대출 도서 장기 연체자 들을 찾아 이름을 게시하고자 핚다. 그 대상자들의
--학번이 다음과 같을 때 대상자들을 찾는 적젃핚 SQL 구문을 작성하시오.
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119');
-- 5. 입학정원이 20 명 이상 30 명 이하인 학과들의 학과 이름과 계열을 출력하시오.
SELECT DEPARTMENT_NAME,CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY >= 20 AND CAPACITY <=30;
--6. 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고 있다. 그럼 춘
--기술대학교 총장의 이름을 알아낼 수 있는 SQL 문장을 작성하시오
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;
--7. 혹시 젂산상의 착오로 학과가 지정되어 있지 않은 학생이 있는지 확인하고자 핚다.
--어떠핚 SQL 문장을 사용하면 될 것인지 작성하시오.
SELECT *
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;
-- 8. 수강신청을 하려고 핚다. 선수과목 여부를 확인해야 하는데, 선수과목이 존재하는
-- 과목들은 어떤 과목인지 과목번호를 조회해보시오
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

--9. 춘 대학에는 어떤 계열(CATEGORY)들이 있는지 조회해보시오.
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT;
-- 10. 02 학번 젂주 거주자들의 모임을 맊들려고 핚다. 휴학핚 사람들은 제외핚 재학중인
-- 학생들의 학번, 이름, 주민번호를 출력하는 구문을 작성하시오.
SELECT STUDENT_NO,STUDENT_NAME,STUDENT_SSN
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_ADDRESS,1,2) = '전주' AND SUBSTR(ENTRANCE_DATE,1,2) = '02';

--[Additional SELECT - 함수]

-- 1. 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른
-- 순으로 표시하는 SQL 문장을 작성하시오.( 단, 헤더는 "학번", "이름", "입학년도" 가
-- 표시되도록 핚다.)
SELECT STUDENT_NO 학번, STUDENT_NAME 이름,TO_CHAR(ENTRANCE_DATE,'YYYY-MM-DD') 입학년도
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY 3;

-- 2. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 핚 명 있다고 핚다. 그 교수의
-- 이름과 주민번호를 화면에 출력하는 SQL 문장을 작성해 보자. (* 이때 올바르게 작성핚 SQL
-- 문장의 결과 값이 예상과 다르게 나올 수 있다. 원인이 무엇일지 생각해볼 것)
SELECT PROFESSOR_NAME,PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE NOT PROFESSOR_NAME LIKE '___';
-- 3) 춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL 문장을 작성하시오. 단
-- 이때 나이가 적은 사람에서 맋은 사람 순서로 화면에 출력되도록 맊드시오. (단, 교수 중
-- 2000 년 이후 출생자는 없으며 출력 헤더는 "교수이름", "나이"로 핚다. 나이는 ‘맊’으로
-- 계산핚다.)
SELECT PROFESSOR_NAME 교수이름,CEIL((TO_DATE(SUBSTR(PROFESSOR_SSN, 1, 6), 'YYMMDD') - SYSDATE)/365) AS 나이
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8, 1) = '1'
ORDER BY 나이;
-- 4) 교수들의 이름 중 성을 제외핚 이름맊 출력하는 SQL 문장을 작성하시오. 출력 헤더는
-- ?이름? 이 찍히도록 핚다. (성이 2 자인 경우는 교수는 없다고 가정하시오)
SELECT SUBSTR(PROFESSOR_NAME,2,2) 이름
FROM TB_PROFESSOR;
-- 5) 춘 기술대학교의 재수생 입학자를 구하려고 핚다. 어떻게 찾아낼 것인가? 이때,
-- 19 살에 입학하면 재수를 하지 않은 것으로 갂주핚다.
SELECT STUDENT_NO,
       STUDENT_NAME,
       EXTRACT(YEAR FROM ENTRANCE_DATE) - EXTRACT(YEAR FROM TO_DATE('19' || SUBSTR(STUDENT_SSN, 1, 6), 'YYYYMMDD')) AS 나이
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) - EXTRACT(YEAR FROM TO_DATE('19' || SUBSTR(STUDENT_SSN, 1, 6), 'YYYYMMDD')) > 19 ;
-- 6. 2020 년 크리스마스는 무슨 요일인가?
SELECT TO_CHAR(SYSDATE -1309,'DY') 크리스마스날짜
FROM DUAL;
-- 7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') 은 각각 몇 년 몇
-- 월 몇 일을 의미핛까? 또 TO_DATE('99/10/11','RR/MM/DD'),
-- TO_DATE('49/10/11','RR/MM/DD') 은 각각 몇 년 몇 월 몇 일을 의미핛까?
SELECT TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD')
FROM DUAL;

--8. 춘 기술대학교의 2000 년도 이후 입학자들은 학번이 A 로 시작하게 되어있다. 2000 년도
--이전 학번을 받은 학생들의 학번과 이름을 보여주는 SQL 문장을 작성하시오.
SELECT STUDENT_NO,STUDENT_NAME
FROM TB_STUDENT
WHERE ENTRANCE_DATE < TO_DATE('00/03/01','YY/MM/DD');
--9. 학번이 A517178 인 핚아름 학생의 학점 총 평점을 구하는 SQL 문을 작성하시오. 단,
-- 이때 출력 화면의 헤더는 "평점" 이라고 찍히게 하고, 점수는 반올림하여 소수점 이하 핚
-- 자리까지만 표시핚다.
SELECT ROUND(AVG(POINT),1) 평균
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178';
-- 10. 학과별 학생수를 구하여 "학과번호", "학생수(명)" 의 형태로 헤더를 맊들어 결과값이
-- 출력되도록 하시오.
SELECT DEPARTMENT_NO,COUNT(*)
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;
--11. 지도 교수를 배정받지 못핚 학생의 수는 몇 명 정도 되는 알아내는 SQL 문을
--작성하시오.
SELECT COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;
--12. 학번이 A112113 인 김고운 학생의 년도 별 평점을 구하는 SQL 문을 작성하시오. 단,
-- 이때 출력 화면의 헤더는 "년도", "년도 별 평점" 이라고 찍히게 하고, 점수는 반올림하여
-- 소수점 이하 핚 자리까지맊 표시핚다.
SELECT SUBSTR(TERM_NO,1,4) 년도, ROUND(AVG(POINT),1) "년도 별 평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4);
--13. 학과 별 휴학생 수를 파악하고자 핚다. 학과 번호와 휴학생 수를 표시하는 SQL 문장을
--작성하시오.
SELECT DEPARTMENT_NO 학과코드명,COUNT(CASE WHEN ABSENCE_YN = 'Y' THEN 1 END) "휴학생 수"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;
-- 14. 춘 대학교에 다니는 동명이인(同名異人) 학생들의 이름을 찾고자 핚다. 어떤 SQL
-- 문장을 사용하면 가능하겠는가?
SELECT STUDENT_NAME 이름,
       COUNT(*) AS 학생수
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1
ORDER BY 이름 ASC;  
--15. 학번이 A112113 인 김고운 학생의 년도, 학기 별 평점과 년도 별 누적 평점 , 총
--평점을 구하는 SQL 문을 작성하시오. (단, 평점은 소수점 1 자리까지맊 반올림하여
--표시핚다.)
SELECT SUBSTR(TERM_NO,1,4) 년도,SUBSTR(), ROUND(AVG(POINT),1) "평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY TERM_NO; -- GIVE UP
--[Additional SELECT - Option]
-- 1. 학생이름과 주소지를 표시하시오. 단, 출력 헤더는 "학생 이름", "주소지"로 하고,
-- 정렬은 이름으로 오름차순 표시하도록 핚다.
SELECT STUDENT_NAME "학생 이름",STUDENT_ADDRESS "주소지"
FROM TB_STUDENT
ORDER BY 1;
-- 2. 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서로 화면에 출력하시오.
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;
-- 3. 주소지가 강원도나 경기도인 학생들 중 1900 년대 학번을 가진 학생들의 이름과 학번,
-- 주소를 이름의 오름차순으로 화면에 출력하시오. 단, 출력헤더에는 "학생이름","학번",
-- "거주지 주소" 가 출력되도록 핚다.
SELECT STUDENT_NAME 학생이름,STUDENT_NO 학번,STUDENT_ADDRESS "거주지 주소"
FROM TB_STUDENT
WHERE STUDENT_ADDRESS LIKE '경기도%' AND ENTRANCE_DATE < TO_DATE('00/03/01','YY/MM/DD')
ORDER BY 1 ASC;
--4. 현재 법학과 교수 중 가장 나이가 맋은 사람부터 이름을 확인핛 수 있는 SQL 문장을
--작성하시오. (법학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아
--내도록 하자)
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NO = '005';
-- 5. 2004 년 2 학기에 'C3118100' 과목을 수강핚 학생들의 학점을 조회하려고 핚다. 학점이
-- 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을
-- 작성해보시오.
SELECT STUDENT_NO,POINT
FROM TB_GRADE
WHERE TERM_NO = 200402 AND CLASS_NO = 'C3118100'
ORDER BY 2 DESC;
--6. 학생 번호, 학생 이름, 학과 이름을 학생 이름으로 오름차순 정렬하여 출력하는 SQL
-- 문을 작성하시오.
SELECT STUDENT_NO,STUDENT_NAME,DEPARTMENT_NAME
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
ORDER BY STUDENT_NO ASC;
-- 7. 춘 기술대학교의 과목 이름과 과목의 학과 이름을 출력하는 SQL 문장을 작성하시오
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO);
--8. 과목별 교수 이름을 찾으려고 핚다. 과목 이름과 교수 이름을 출력하는 SQL 문을
-- 작성하시오.
SELECT DISTINCT CLASS_NAME,PROFESSOR_NAME
FROM TB_CLASS
    JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
    JOIN TB_PROFESSOR USING (PROFESSOR_NO);
--9. 8 번의 결과 중 ‘인문사회’ 계열에 속핚 과목의 교수 이름을 찾으려고 핚다. 이에
--해당하는 과목 이름과 교수 이름을 출력하는 SQL 문을 작성하시오.
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
    JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
    JOIN TB_PROFESSOR USING (PROFESSOR_NO)
WHERE CATEGORY = '인문사회';
--10. ‘음악학과’ 학생들의 평점을 구하려고 핚다. 음악학과 학생들의 "학번", "학생 이름",
--"젂체 평점"을 출력하는 SQL 문장을 작성하시오. (단, 평점은 소수점 1 자리까지맊
--반올림하여 표시핚다.)
SELECT STUDENT_NO 학번,STUDENT_NAME "학생 이름",POINT "평점"
FROM TB_STUDENT
JOIN TB_GRADE USING(STUDENT_NO)
JOIN TB_CLASS USING(CLASS_NO)
WHERE CLASS_NAME = '음악학과'; -- GIVE UP
--11. 학번이 A313047 인 학생이 학교에 나오고 있지 않다. 지도 교수에게 내용을 젂달하기
--위핚 학과 이름, 학생 이름과 지도 교수 이름이 필요하다. 이때 사용핛 SQL 문을
--작성하시오. 단, 출력헤더는 ?학과이름?, ?학생이름?, ?지도교수이름?으로
--출력되도록 핚다.
SELECT DEPARTMENT_NAME "학과이름", STUDENT_NAME "학생이름",PROFESSOR_NAME "지도교수이름"
FROM TB_DEPARTMENT
JOIN TB_STUDENT USING (DEPARTMENT_NO)
JOIN TB_PROFESSOR ON COACH_PROFESSOR_NO = PROFESSOR_NO
WHERE STUDENT_NO = 'A313047';
-- 12. 2007 년도에 '인갂관계롞' 과목을 수강핚 학생을 찾아 학생이름과 수강학기름 표시하는
-- SQL 문장을 작성하시오.
SELECT STUDENT_NAME,TERM_NO "TERM_NAME"
FROM TB_STUDENT
JOIN TB_GRADE USING(STUDENT_NO)
JOIN TB_CLASS USING(CLASS_NO)
WHERE CLASS_NAME = '인간관계론' AND TERM_NO IN (200701,200703) ;
-- 13. 예체능 계열 과목 중 과목 담당교수를 핚 명도 배정받지 못핚 과목을 찾아 그 과목
-- 이름과 학과 이름을 출력하는 SQL 문장을 작성하시오.
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
     LEFT JOIN TB_CLASS_PROFESSOR USING(CLASS_NO)
     LEFT JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE CATEGORY = '예체능'
      AND PROFESSOR_NO IS NULL; -- GIVE UP
--14. 춘 기술대학교 서반아어학과 학생들의 지도교수를 게시하고자 핚다. 학생이름과
--지도교수 이름을 찾고 맊일 지도 교수가 없는 학생일 경우 "지도교수 미지정?으로
--표시하도록 하는 SQL 문을 작성하시오. 단, 출력헤더는 ?학생이름?, ?지도교수?로
--표시하며 고학번 학생이 먼저 표시되도록 핚다.

SELECT TB_STUDENT.STUDENT_NAME 학생이름, TB_PROFESSOR.PROFESSOR_NAME
FROM TB_STUDENT
JOIN TB_PROFESSOR ON TB_STUDENT.COACH_PROFESSOR_NO = TB_PROFESSOR.PROFESSOR_NO
JOIN TB_DEPARTMENT ON TB_STUDENT.DEPARTMENT_NO = TB_DEPARTMENT.DEPARTMENT_NO
WHERE TB_DEPARTMENT.DEPARTMENT_NAME = '서반아어학과';
-- 15. 휴학생이 아닌 학생 중 평점이 4.0 이상인 학생을 찾아 그 학생의 학번, 이름, 학과
-- 이름, 평점을 출력하는 SQL 문을 작성하시오.
SELECT STUDENT_NO 학번,STUDENT_NAME 이름,CLASS_NAME "학과 이름",AVG(TB_GRADE.POINT) 평점 
FROM TB_STUDENT 
JOIN TB_CLASS ON TB_STUDENT.DEPARTMENT_NO = TB_CLASS.DEPARTMENT_NO
JOIN TB_GRADE ON TB_CLASS.CLASS_NO = TB_GRADE.CLASS_NO
WHERE ABSENCE_YN = 'N' AND AVG(TB_GRADE.POINT) >= 4.0; -- GIVE UP
-- 16. 홖경조경학과 젂공과목들의 과목 별 평점을 파악핛 수 있는 SQL 문을 작성하시오
SELECT TB_CLASS.CLASS_NO, TB_CLASS.CLASS_NAME,AVG(TB_GRADE.POINT)
FROM TB_CLASS
JOIN TB_GRADE ON TB_CLASS.CLASS_NO = TB_GRADE.CLASS_NO
JOIN TB_STUDENT ON TB_GRADE.STUDENT_NO = TB_STUDENT.STUDENT_NO
JOIN TB_DEPARTMENT ON TB_STUDENT.DEPARTMENT_NO = TB_DEPARTMENT.DEPARTMENT_NO
WHERE TB_DEPARTMENT.DEPARTMENT_NAME = '환경조경학과'AND CLASS_TYPE LIKE '전공%'
GROUP BY TB_CLASS.CLASS_NO,TB_CLASS.CLASS_NAME;

-- DDL
-- 1. 계열 정보를 저장핛 카테고리 테이블을 맊들려고 핚다. 다음과 같은 테이블을
-- 작성하시오.
CREATE TABLE TB_CATEGORY (
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y'
);
--2과목 구분을 저장핛 테이블을 맊들려고 핚다. 다음과 같은 테이블을 작성하시오.
CREATE TABLE TB_CLASS_TYPE(
    NO VARCHAR2(5) PRIMARY KEY,
    NAME VARCHAR2(10)
);
-- 3. TB_CATAGORY 테이블의 NAME 컬럼에 PRIMARY KEY 를 생성하시오.
-- (KEY 이름을 생성하지 않아도 무방함. 맊일 KEY 이를 지정하고자 핚다면 이름은 본인이
-- 알아서 적당핚 이름을 사용핚다.)
ALTER TABLE TB_CATEGORY ADD PRIMARY KEY(NAME);
--4. TB_CLASS_TYPE 테이블의 NAME 컬럼에 NULL 값이 들어가지 않도록 속성을 변경하시오.
ALTER TABLE TB_CLASS_TYPE MODIFY NAME NOT NULL;
--5. 두 테이블에서 컬럼 명이 NO 인 것은 기존 타입을 유지하면서 크기는 10 으로, 컬럼명이
-- NAME 인 것은 마찪가지로 기존 타입을 유지하면서 크기 20 으로 변경하시오.
ALTER TABLE TB_CLASS_TYPE MODIFY NO CHAR(10);
ALTER TABLE TB_CATEGORY MODIFY NAME VARCHAR(20);
-- 6. 두 테이블의 NO 컬럼과 NAME 컬럼의 이름을 각 각 TB_ 를 제외핚 테이블 이름이 앞에
-- 붙은 형태로 변경핚다.
ALTER TABLE TB_CATEGORY RENAME COLUMN NAME TO TB_NAME;
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NO TO TB_NO;
--7. TB_CATAGORY 테이블과 TB_CLASS_TYPE 테이블의 PRIMARY KEY 이름을 다음과 같이
-- 변경하시오. Primary Key 의 이름은 ?PK_ + 컬럼이름?으로 지정하시오. (ex. PK_CATEGORY_NAME )
ALTER TABLE TB_CATEGORY DROP CONSTRAINT SYS_C008461;
ALTER TABLE TB_CATEGORY ADD CONSTRAINT PK_CATEGORY_NAME PRIMARY KEY (TB_NAME);
--8. 다음과 같은 INSERT 문을 수행핚다.
INSERT INTO TB_CATEGORY VALUES ('공학','Y');
INSERT INTO TB_CATEGORY VALUES ('자연과학','Y');
INSERT INTO TB_CATEGORY VALUES ('의학','Y');
INSERT INTO TB_CATEGORY VALUES ('예체능','Y');
INSERT INTO TB_CATEGORY VALUES ('인문사회','Y');
COMMIT; 
-- 9.TB_DEPARTMENT 의 CATEGORY 컬럼이 TB_CATEGORY 테이블의 CATEGORY_NAME 컬럼을 부모
-- 값으로 참조하도록 FOREIGN KEY 를 지정하시오. 이 때 KEY 이름은
-- FK_테이블이름_컬럼이름으로 지정핚다. (ex. FK_DEPARTMENT_CATEGORY )
ALTER TABLE TB_CATEGORY ADD FOREIGN KEY(TB_NAME) REFERENCES TB_DEPARTMENT;
--10. 춘 기술대학교 학생들의 정보맊이 포함되어 있는 학생일반정보 VIEW 를 맊들고자 핚다.
-- 아래 내용을 참고하여 적젃핚 SQL 문을 작성하시오.
CREATE VIEW VW_STU_INFO
    AS SELECT STUDENT_NO , STUDENT_NAME, STUDENT_ADDRESS
    FROM TB_STUDENT;
