-- 1. EMPLOYEE테이블에서 사원 명과 직원의 주민번호를 이용하여 생년, 생월, 생일 조회
SELECT EMP_NAME, SUBSTR(EMP_NO,1,2) "생년", SUBSTR(EMP_NO,3,2) "생월", SUBSTR(EMP_NO,5,2) "생일"
FROM EMPLOYEE;
-- 2. EMPLOYEE테이블에서 사원명, 주민번호 조회 (단, 주민번호는 생년월일만 보이게 하고, '-'다음 값은 '*'로 바꾸기)
SELECT EMP_NAME, SUBSTR(EMP_NO,1,7) || RPAD('*',8,'*')
FROM EMPLOYEE;
-- 3. EMPLOYEE테이블에서 사원명, 입사일-오늘, 오늘-입사일 조회
--     (단, 각 별칭은 근무일수1, 근무일수2가 되도록 하고 모두 정수(내림), 양수가 되도록 처리)

-- 4. EMPLOYEE테이블에서 사번이 홀수인 직원들의 정보 모두 조회
SELECT *
FROM EMPLOYEE
WHERE MOD(EMP_ID,2) = 1;
-- 5. EMPLOYEE테이블에서 근무 년수가 20년 이상인 직원 정보 조회
SELECT EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
FROM EMPLOYEE
WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE) >= 20;
-- 6. EMPLOYEE 테이블에서 사원명, 급여 조회 (단, 급여는 '\9,000,000' 형식으로 표시)
SELECT EMP_NAME, TO_CHAR(SALARY, 'L9,000,000')
FROM EMPLOYEE;
-- 7. EMPLOYEE테이블에서 직원 명, 부서코드, 생년월일, 나이(만) 조회
--     (단, 생년월일은 주민번호에서 추출해서 00년 00월 00일로 출력되게 하며
--     나이는 주민번호에서 출력해서 날짜데이터로 변환한 다음 계산)


-- 8. EMPLOYEE테이블에서 부서코드가 D5, D6, D9인 사원만 조회하되 D5면 총무부, D6면 기획부, D9면 영업부로 처리
--     (단, 부서코드 오름차순으로 정렬)
SELECT EMP_NAME,DEPT_CODE,
CASE WHEN DEPT_CODE = 'D5' THEN '총무부' WHEN DEPT_CODE = 'D6' THEN '기획부' WHEN DEPT_CODE = 'D9' THEN '영업부' ELSE '기타' END
FROM EMPLOYEE
WHERE DEPT_CODE IN ('D5','D6','D9');
-- 9. EMPLOYEE테이블에서 사번이 201번인 사원명, 주민번호 앞자리, 주민번호 뒷자리,
--     주민번호 앞자리와 뒷자리의 합 조회
SELECT EMP_NAME, SUBSTR(EMP_NO,1,6), SUBSTR(EMP_NO,8,7), SUBSTR(EMP_NO,1,6) + SUBSTR(EMP_NO,8,7)
FROM EMPLOYEE
WHERE EMP_ID = 201;
-- 10. EMPLOYEE테이블에서 부서코드가 D5인 직원의 보너스 포함 연봉 합 조회
SELECT SUM(SALARY + (SALARY*NVL(BONUS,0)))
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';
-- 11. 직원들의 입사일로부터 년도만 가지고 각 년도별 입사 인원수 조회
-- 전체 직원 수, 1999년, 2000년, 2001년, 2004년
SELECT COUNT(*), COUNT(CASE WHEN SUBSTR(HIRE_DATE,1,2) = 99 THEN 1 END),
COUNT(CASE WHEN SUBSTR(HIRE_DATE,1,2) = 00 THEN 1 END),
COUNT(CASE WHEN SUBSTR(HIRE_DATE,1,2) = 01 THEN 1 END),
COUNT(CASE WHEN SUBSTR(HIRE_DATE,1,2) = 04 THEN 1 END)
FROM EMPLOYEE;


select emp_name,emp_no,dept_code,job_code,salary,bonus,EMAIL
from employee
where (job_code = 'J6' or job_code = 'J7') and (salary >= 2000000) AND (SUBSTR(EMP_NO,8,1)='2') and (bonus != 0) AND EMAIL LIKE '__%' ;

select emp_name,salary,bonus,JOB_code
from employee
where bonus != 0; -- BONUS IS NOT NULL;

select *
from employee
where email LIKE  '__m%';

select COUNT(*)
from employee
where substr(emp_no,8,1) IN (2,4);

select TO_CHAR(SUM(SALARY),'L9,999,999,999')
from employee
where ent_yn = 'N';

select COUNT(*)
from employee
where EXTRACT (MONTH FROM HIRE_DATE) = 9; 

select emp_name,salary,bonus,job_code
from employee
where bonus IS NOT NULL ;

select emp_name,emp_no,dept_code,job_code,salary,bonus,email
		from employee
		where 
        (job_code IN ('J6','J7')) 
        and (salary >= 2000000) 
        and substr(emp_no,8,1) IN (2,4) 
        and email like '___#_%' escape '#'
        and bonus != 0;
-- 원인 :  이거 마지막 BONUS IS NULL이 아니라 NOT 이 아닌지? 그리고 EMAIL LIKE가 3글자 앞이 더라도 