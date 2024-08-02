/*
    데이터 조회(추출) : SELECT
    SELECT 조회하고자 하는 정보 FROM 테이블명;
    SELECT * 또는 컬럼명1, 컬럼명2, ... FROM 테이블명;
*/
-- 모든 사원의 정보를 조회
SELECT * FROM EMPLOYEE;

-- 모든 사원의 이름, 주민등록번호, 핸드폰번호를 조회
SELECT EMP_NAME,EMP_NO,PHONE 
FROM EMPLOYEE;

-- JOB 테이블에서 직급이름만 조회
SELECT JOB_NAME FROM JOB;
-- DEPARTMENT 테이블의 모든 정보를 조회
SELECT * FROM department;

-- 직원 테이블의 사원명, 이메일, 연락처, 입사일, 급여 조회
SELECT EMP_NAME,EMAIL,PHONE,HIRE_DATE,SALARY FROM EMPLOYEE;

/*
    컬럼값에 산술 연산하기
    => SELECT절에 컬럼명 작성부분에 산술연산을 할 수 있음!
*/
-- 사원이름, 연봉 정보(SALARY * 12) 조회
SELECT EMP_NAME, SALARY ,SALARY * 12 FROM EMPLOYEE;     -- SALARY *12 : 컬럼데이터에 12FMF RHQGO WHGHL
-- 사원이름, 급여, 보너스, 연봉, 보너스 포함 연봉(급여 + (급여+보너스)) * 12
SELECT EMP_NAME, SALARY, BONUS , SALARY *12, (SALARY +(SALARY*BONUS))*12 FROM EMPLOYEE;

/*
    - 현재 날짜시간 정보 : SYSDATE
    - 가상 테이블(임시테이블) : DUAL
*/
-- 현재 시간 정보 조회
SELECT SYSDATE FROM DUAL;   -- YY/MM/DD 형식으로 조회됨!

-- 사원이름, 입사일, 근무일수 (현재날짜 - 입사일)조회
-- DATE타입 - DATE타입 -> 일로 표시됨!
SELECT EMP_NAME,HIRE_DATE,SYSDATE - HIRE_DATE FROM EMPLOYEE;
/*
    * 컬럼명 별칭 지정 : 연산식을 사용한 경우 의미파악이 어렵기 때문에, 별칭을 부여해 명확하고 깔끔하게 조회가능!
    [표현법] 1) 컬럼명 별칭
            2) 컬럼명 as 별칭
            3) 컬럼명 "별칭"
            4) 컬럼명 as "별칭"
*/
-- 사원이름, 급여, 보너스, 연봉, 보너스 포함 연봉(급여 + (급여+보너스)) * 12
SELECT EMP_NAME as 이름, SALARY as 월급, BONUS as 보너스 , SALARY *12 as 연봉, (SALARY +(SALARY*BONUS))*12 as total 
FROM EMPLOYEE;
/*
    * 리터럴 : 임의로 지정한 문자열 (' ')
      -> SELECT 절에 사용하는 경우 조회된 결과(Result set)에 번복적으로 표시됨
*/
-- 이름, 급여, '원' 출력
SELECT EMP_NAME 이름,SALARY 급여, '원' 단위
FROM EMPLOYEE;

/*
    연결 연산자 : || 
*/
SELECT SALARY || '원' AS 급여 FROM EMPLOYEE;

-- 사번, 이름, 급여일을 한번에(한 컬럼에) 조회
SELECT EMP_ID || EMP_NAME || SALARY FROM EMPLOYEE;

-- XXX 의 급여는 XXX원입니다.
SELECT EMP_NAME || '의 급여는 ' || SALARY || '원 입니다.' 급여정보 FROM EMPLOYEE;
-- 사원테이블에서 직급코드 조회 (중복제거)
SELECT JOB_CODE FROM EMPLOYEE;
/*
    * 중복제거 : DISTINCT
*/
SELECT DISTINCT JOB_CODE FROM EMPLOYEE;

-- 사원테이블에서 부서코드 조회(중복제거);
SELECT DISTINCT DEPT_CODE FROM EMPLOYEE;

-- DISTINCT 는 한번만 사용 가능
-- DISTINCT(JOB_CODE,DEFT_CODE)를 한 쌍으로 묶어서 중복을 제거해줌;
SELECT DISTINCT JOB_CODE, DEPT_CODE FROM EMPLOYEE;
--=============================================================================
/*
    * WHERE 절 : 조회하고자 하는 데이터를 특정 조건에 따라 추출하고자 할때 사용
    [표현법]
            SELECT 컬럼명, 컬럼:데이터 기준 연산식
            FROM 테이블명
            WHERE 조건;
            
    -비교연산자
        * 대소 비교 :  >,<, >=, ,=
        * 동등 비교 
            - 같은지 : = 
            - 다른지 : !=, <>, ^=
*/
-- 사원테이블에서 부서코드가 'D9'만 사원들만 조회
SELECT*               -- 전체컬럼을 조회할건데 
FROM EMPLOYEE         -- EMPLOYEE 테이블에서
WHERE DEPT_CODE ='D9';  -- DEPT_CODE의 값이 'D9'인 정보만 조회

-- 사원테이블에서 부서코드가 'D1'인 사원들의 사원명, 급여, 부서코드 조회
SELECT EMP_NAME,SALARY,DEPT_CODE FROM EMPLOYEE WHERE DEPT_CODE = 'D1';

-- 부서코드가 D1이 아닌 사원들의 정보 조회
SELECT * FROM EMPLOYEE WHERE DEPT_CODE != 'D1';

--급여가 400만원 이상인 사원의 사원명, 부서코드, 급여 정보를 조회
SELECT EMP_NAME, DEPT_CODE, SALARY FROM EMPLOYEE WHERE SALARY >= 4000000;
--1. 급여가 300만원 이상인 사원들의 사원명, 급여, 입사일, 연봉 조회
SELECT EMP_NAME AS 사원명,SALARY AS 급여,HIRE_DATE AS 입사날짜,SALARY*12 AS 연봉 FROM EMPLOYEE WHERE SALARY >=3000000;
--2. 연봉이 5천만원 이상인 사원들의 사원명,급여,연봉,부서코드 조회
SELECT EMP_NAME AS 사원명,SALARY AS 급여,SALARY*12 AS 연봉,DEPT_CODE AS 부서코드 FROM EMPLOYEE WHERE SALARY*12 >= 50000000;
--3. 직급코드 'j3'가 아닌 사원들의 사번, 사원명, 직급코드, 퇴사여부 조회
SELECT JOB_CODE AS 사번, EMP_NAME AS 사원명, DEPT_CODE AS 직급코드,ENT_YN AS 퇴사여부 FROM EMPLOYEE WHERE JOB_CODE != 'J3'; 
--4. 급여가 350만원 이상 600만원 이하인 모든 사원의 사원명, 사번, 급여 조회
SELECT EMP_NAME AS 사원명, JOB_CODE AS 사번, SALARY AS 급여 FROM EMPLOYEE WHERE 6000000>=SALARY AND SALARY >= 3500000 ;
/*
    * BETWEEN AND : 조건식에서 사용되는 구문
        => ~ 이상 ~ 이하인 범위에 대한 조건을 제시하는 구문
    [표현법]
            비교대상컬럼명 BETWEEN 최솟값 AND 최댓값
            => 해당 컬럼의 값이 최솟값 이상이고 최댓값 이하인 경우
*/            