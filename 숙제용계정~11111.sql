--1.
SELECT DEPARTMENT_NAME,CATEGORY
FROM TB_DEPARTMENT;
--2
SELECT DEPARTMENT_NAME ||'의 정원은 '|| CAPACITY || '명 입니다.' AS "학과별 정원"
FROM TB_DEPARTMENT;
--3
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y' AND DEPARTMENT_NO = 001 AND SUBSTR(STUDENT_SSN,8,1) = 2;
--4
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119');
--5
SELECT DEPARTMENT_NAME,CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY >= 20 AND CAPACITY <=30;
--6
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;
--7
SELECT CLASS_NO
FROM TB_CLASS
WHERE CLASS_NAME IS NULL;
--8
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;
--9
SELECT DISTINCT CATEGORY FROM TB_DEPARTMENT;
--10
SELECT STUDENT_NO,STUDENT_NAME,STUDENT_SSN
FROM TB_STUDENT
WHERE SUBSTR(ENTRANCE_DATE,1,2) = '02' AND SUBSTR(STUDENT_ADDRESS,1,2) = '전주' AND ABSENCE_YN ='N';
--1
SELECT STUDENT_NO "학번",STUDENT_NAME "이름",ENTRANCE_DATE "입학년도"
FROM TB_STUDENT WHERE DEPARTMENT_NO = 002;
--2
SELECT PROFESSOR_NAME,PROFESSOR_SSN FROM TB_PROFESSOR
WHERE PROFESSOR_NAME NOT LIKE '___';
--3
SELECT PROFESSOR_NAME,FLOOR((SYSDATE-TO_DATE('19' || SUBSTR(PROFESSOR_SSN,1,6)))/365)
FROM TB_PROFESSOR
ORDER BY 2;
--4
SELECT SUBSTR(PROFESSOR_NAME,2,2)
FROM TB_PROFESSOR;
--5
SELECT STUDENT_NO,STUDENT_NAME
FROM TB_STUDENT
WHERE (EXTRACT(YEAR FROM ENTRANCE_DATE)-EXTRACT(YEAR FROM TO_DATE(SUBSTR(STUDENT_SSN,1,6)))) >19;
--6
SELECT TO_CHAR(TO_DATE('20/12/25'), 'DAY')
FROM DUAL;
--7
SELECT TO_CHAR(TO_DATE('99/10/11','YY/MM/DD'),'YYMMDD')
    , TO_CHAR(TO_DATE('49/10/11','YY/MM/DD'))
FROM DUAL;
--8
SELECT STUDENT_NO,STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_NO,1,1) != 'A';
--9
SELECT ROUND(AVG(POINT),1) "평점" FROM TB_GRADE WHERE STUDENT_NO ='A517178';
--10
SELECT DEPARTMENT_NO,COUNT(DEPARTMENT_NO)
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;
--11
SELECT COUNT(*) FROM TB_STUDENT WHERE COACH_PROFESSOR_NO IS NULL;
--12
SELECT SUBSTR(TERM_NO,1,4) "년도",ROUND(AVG(POINT),1) AS "년도 별 평점"
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4);
--13
SELECT DEPARTMENT_NO,COUNT(CASE WHEN ABSENCE_YN ='Y' THEN 1 END)
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;
--14
SELECT STUDENT_NAME,COUNT(*)
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) > 1;
--15
SELECT SUBSTR(TERM_NO,1,4) "년도",SUBSTR(TERM_NO,5,2) "학기", ROUND(AVG(POINT),1)
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY TERM_NO;
--1
SELECT STUDENT_NAME,STUDENT_ADDRESS
FROM TB_STUDENT;
--2
SELECT STUDENT_NAME,STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY  2 DESC;
--3
SELECT STUDENT_NAME "학생이름", STUDENT_NO "학번이름", STUDENT_ADDRESS AS "거주지 주소"
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_ADDRESS,1,3) IN ('경기도','강원도') AND SUBSTR(ENTRANCE_DATE,1,1) != 9
ORDER BY 3 ASC;






