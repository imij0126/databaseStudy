/*
    * 함수 (function)
        : 전달된 컬럼값을 읽어서 함수를 실행한 결과를 반환
        
        -단일행 함수 : N개의 값을 읽어서 N개의 결과값을 리턴 (행마다 함수를 실행한 결과를 반환)
        -그룹 함수 : N개의 값을 읽어서 1개의 결과값을 리턴 (그룹을 지어 그룹별로 함수를 실행한 결과를 반환)
        + SELECT절에 단일행 함수랑 그룹함수를 함께 사용할 수 없음!
         => 결과 행의 개수가 다르기 때문에
        +함수식을 사용할 수 있는 위치 : SELECT절, WHERE 절, ORDER BY절, GROUB BY 절, HAVING 절
*/
/*
    * 문자타입의 데이터 처리 함수
        => VARCHAR2, CHAR
    * LENGTH(컬럼명 | '문자열') : 해당 문자열의 글자수를 반환
      LENGTHB(컬럼명 | '문자열') : 해당 문자열의 바이트수를 반환 
        => 영문자, 숫자, 특수문자 글자당 1BYTE
            한글은 글자당 3BYTE '김', 'ㄱ', '나'
*/
-- '오라클' 단어의 글자수와 바이트수를 확인해보자
SELECT LENGTH('오라클') 글자수, LENGTHB('오라클') 바이트수
FROM DUAL;
SELECT LENGTH('ORACLE') 글자수, LENGTHB('ORACLE') 바이트수
FROM DUAL;
-- EMPLOYEE 테이블에서 사원명, 사원명(글자수), 사원명(바이트수),이메일,이메일(글자수),이메일(바이트수)
SELECT EMP_NAME 사원명, LENGTH (EMP_NAME) "사원명 글자수", LENGTHB(EMP_NAME) "사원명 바이트수", 
EMAIL 이메일, LENGTH(EMAIL) "이메일 글자수", LENGTHB(EMAIL) "이메일 바이트수"
FROM EMPLOYEE