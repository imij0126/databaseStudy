/*
    * BETWEEN AND : 조건식에서 사용되는 구문
        => ~ 이상 ~ 이하인 범위에 대한 조건을 제시하는 구문
    [표현법]
            비교대상컬럼명 BETWEEN 최솟값 AND 최댓값
            => 해당 컬럼의 값이 최솟값 이상이고 최댓값 이하인 경우
*/     
-- 급여가 350만 이상이고 600만 이하인 사원의
SELECT EMP_NAME 사원명, EMP_ID 사번, SALARY 급여
FROM EMPLOYEE
WHERE 3500000 <= SALARY AND 6000000 >= SALARY;

/*
    * NOT : 오라클에서의 논리부정연산자
*/
-- 급여가 350만원 미만 또는 600만원 초과인 사원의 사원명,사번,급여 조회
SELECT EMP_NAME 사원명, EMP_ID 사번, SALARY 급여
FROM EMPLOYEE
WHERE SALARY < 3500000 OR SALARY > 6000000;

SELECT EMP_NAME 사원명, EMP_ID 사번, SALARY 급여
FROM EMPLOYEE
--WHERE SALARY NOT BETWEEN 3500000 AND 6000000;
WHERE NOT SALARY BETWEEN 3500000 AND 6000000;
--NOT은 BETWEEN 앞에 붙이거나 컬럼명 앞에 붙여서 사용 가능!

/*
    * IN : 비교대상컬럼값이 제사한 값들 중에 일치하는 값이 있는 경우 조회하는 연산자
    [표현법]
            비교대상컬럼명 IN ('값1', '값2', '값3', ....)
*/
-- 부서코드가 D6이거나 D8이거나 D5인 사원들의 사원명, 부서코드, 급여를 조회
SELECT EMP_NAME "사원명",DEPT_CODE "부서 코드",SALARY "급여" FROM EMPLOYEE
WHERE DEPT_CODE IN ('D6', 'D8', 'D5');
--WHERE DEPT_CODE = 'D5' OR DEPT_CODE = 'D6' OR DEPT_CODE = 'D8';

SELECT EMP_NAME,DEPT_CODE,HIRE_DATE 
FROM EMPLOYEE 
WHERE DEPT_CODE IN('D9','D5')AND HIRE_DATE < '2002/01/01'  ;
/*
    *Like : 비교하고자하는 컬럼의 값이 제시한 특정 패턴에 만족할 경우 조회
        => 특정 패턴 : '%', '_' 를 와일드카드 사용
            * '%' : 0글자 이상
              ex) 비교대상컬럼명 Like '문자%' => 비교대상컬럼의 값에 문자로 시작되는 것을 조회
                  비교대상컬럼명 Like '%문자' => 비교대상컬럼의 값이 문자로 "끝"나는 것을 조회
                  비교대상컬럼명 Like '%문자%'=> 비교대상컬럼의 값에 문자가 "포함"되는 것을 조회
            * '_' : 1글자
              ex) 비교대상컬럼명 Like '_문자' => 비교대상컬럼의 값에 문자 앞에 무조건 한글자가 올 경우 조회
                  비교대상컬럼명 Like '__문자' => 비교대상컬럼의 값에 문자 앞에 무조건 두글자가 올 경우 조회
                  비교대상컬럼명 Like '_문자_' => 비교대상컬럼의 값에서 문자, 앞, 뒤에 무조건 한글자씩 있을 경우 조회
*/
-- 사원들 중에 전씨인 사원의 사원명,급여,입사일 조회
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '전%';

-- 사원 이름에 허가 포함된 사원의 사원명, 주민번호, 연락처 조회
SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%';
-- 사원 이름의 가운데 글자가 하인 사원의 사원명, 연락처 조회 (이름 3글자만 있다면..)

SELECT EMP_NAME, EMP_NO, PHONE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_하_';

--사원들중 연락처 3번째 자리가 1인 사원의 사번,사원명,연락처,이메일 조회
SELECT EMP_ID,EMP_NAME,PHONE,EMAIL
FROM EMPLOYEE
WHERE PHONE LIKE '__1%';

-- 사원들 중 이메일에 _가 있으면 해당 문자 앞이 3글자인 사원의 사번,이름,이메일 조회
SELECT EMP_ID,EMP_NAME,PHONE,EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '____%';
--> 와일드카드로 사용되는 문자와 컬럶에 담긴 문자가 동일하기 때문에 모두 와일드카드로 인식됨!
--  따라서, 구분을 해줘야함 ! (=> 나만의 와일드카드 사용하기! ESCAPE를 사용해 등록 후 적용!)
SELECT EMP_ID,EMP_NAME,PHONE,EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___$_%' ESCAPE '$';
/*
    IS NULL / IS NOT NULL : 컬럼값에 NULL이 있을 경우 NULL값을 비교할때 사용하는 연산자
*/
-- 보너스를 받지 않는 사원(BONUS값이 NULL!)들의 사번,이름,급여,보너스 조회
SELECT EMP_ID,EMP_NAME,SALARY,BONUS
FROM EMPLOYEE
WHERE BONUS IS NULL ;

-- 보너스 받는 사원
SELECT EMP_ID,EMP_NAME,SALARY,BONUS
FROM EMPLOYEE
--WHERE BONUS IS NOT NULL ;
WHERE NOT BONUS IS NULL;

-- 사수가 없는 사원 (MANAGER_ID의 값이 NULL!)들의 사원명, 사수사번(MANAGER_ID), 부서코드 조회
SELECT EMP_NAME,MANAGER_ID,DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL; 

--부서 배치를 받지 않았고, 보너스를 받고 있는 사원명,보너스,부서코드 조회
--부서 코드가 없고, 보너스 받고있는 사람
SELECT EMP_NAME,BONUS,DEPT_CODE
FROM EMPLOYEE
WHERE BONUS IS NOT NULL AND DEPT_CODE IS NULL;

/*
    * 연산자 우선순위
      (0) () 
      (1) 산술연산자 : * / + -
      (2) 연결연산자 : ||
      (3) 비교연산자 : > < >= <= != ..
      (4) IS NULL / LIKE '패턴' / IN
      (5) BETWEEN AND
      (6) NOT
      (7) AND
      (8) OR
*/
-- 직급코드가 J7이거나 J2인 사원들 중 급여가 200만원 이상인 사원의 모든 정보를 조회
SELECT *
FROM EMPLOYEE
--WHERE JOB_CODE IN('J2','J7') AND SALARY >=2000000;
WHERE (JOB_CODE = 'J2' OR JOB_CODE = 'J7') AND SALARY >= 2000000;
/*
    * ORDER BY : SELECT 문의 가장 마지막 줄에 작성, 실행순서 또한 마지막에 실행
    (표현법)
            SELECT 조회할 컬럼 ....
            FROM 테이블명
            WHERE 조건식
            ORDER BY 정렬기준이 되는 컬럼|별칭|컬럼순번 [ASC|DESC] [NULLS FIRST|NULLS LAST]
            
            * ASC : 오름차순 정렬 (기본값)
            * DESC  : 내림차순 정렬
            * NULLS FIRST : 정렬하고자하는 컬럼의 값이 NULL인 경우 해당 데이터를 맨 앞에 배치 (DESC인 경우 기본값)
            * NULLS LAST : 정렬하고자하는 컬럼의 값이 NULL인 경우 해당 데이터를 맨 뒤에 배치 (ASC인 경우 기본값)
            => NULL 값은 큰 값으로 분류되어 정렬됨!
*/
--모든 사원의 사원명, 연봉 조회 (연봉별 내림차순 정렬)
SELECT EMP_NAME 사원명,SALARY*12 연봉
FROM EMPLOYEE
--ORDER BY SALARY *12 DESC; 정렬기준이되는 컬럼(연산식)
--ORDER BY 연봉 DESC;  -- 별칭 사용 가능
ORDER BY 2 DESC;       -- 컬럼 순번 사용 가능 (오라클에서 1부터 시작!)

-- 보너스 기준으로 정렬 해보기
SELECT *
FROM EMPLOYEE
--ORDER BY BONUS;  -- 기본값 (ASC, NULLS LAST)
--ORDER BY BONUS ASC;
--ORDER BY BONUS ASC NULLS LAST;
--ORDER BY BONUS DESC; -- NULLS FIRST (DESC 정렬인 경우 기본값)
ORDER BY BONUS DESC, SALARY ASC; -- 보너스는 내림차순 급여는 오름차순 => 보너스 값을 내림차순 정렬하는데, 같은 값인 경우 급여의 값을 오름차순 정렬 

-- 1. EMPLOYEE 테이블에 고용일이 90/01/01~01/01/01 인 사원의 전체 내용을 조회
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01'; 
-- 2. EMPLOYEE 테이블에서 이름 끝이 '연'으로 끝나는 사원의 이름 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%연' ;
-- 3. EMPLOYEE 테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름,전화번호를 조회
SELECT EMP_NAME 이름,PHONE 전화번호
FROM EMPLOYEE
WHERE PHONE NOT LIKE '010%';

--WHERE EMAIL LIKE '___$_%' ESCAPE '$';
-- 4. EMPLOYEE 테이블에서 메일주소 '_'의 앞이 4자이면서 DEPT_CODE D9 또는 D6이고
--     고용일이 90/01/01 ~ 00/12/01 이고, 급여가 270만 이상인 사원의 전체를 조회
SELECT *
FROM EMPLOYEE
WHERE (HIRE_DATE BETWEEN '90/01/01' AND '00/12/01') AND (SALARY >= 2700000) AND EMAIL LIKE '____$_%' ESCAPE '$';


--SELECT EMP_ID,EMP_NAME,PHONE,EMAIL
--FROM EMPLOYEE
--WHERE EMAIL LIKE '___$_%' ESCAPE '$';












