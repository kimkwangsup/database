/*
    1.
    사원들의
        사원이름, 부서번호
    를 조회하세요.
*/
SELECT
    ename 사원이름, deptno 부서번호
FROM
    emp
;
/*
    2.
    사원들의 부서번호를 조회하세요.
    단, 중복되는 부서번호는 한번만 조회되게 하세요.
*/
SELECT
    DISTINCT deptno
FROM
    emp
;
/*
    3.
    사원들의
        사원이름, 직급, 연봉을 조회하세요.
    연봉은 급여 * 12로 계산하세요.
*/
SELECT
    ename 사원이름, job 직급, sal * 12 연봉
FROM
    emp
;
/*
    4.
    사원들의 사원이름, 급여, 커미션, 연봉을 조회하세요.
    연봉은 급여 * 12 + 커미션으로 계산하세요.
    커미션이 없는 사원은 커미션을 50을 지급하는 것으로 계산하세요.
    NVL() 로 처리하는 문제  
*/
SELECT
    ename 사원이름, sal 급여, NVL(comm , 50) 커미션, sal * 12 + NVL(comm , 50) 연봉 
FROM
    emp
;

SELECT
    ename 사원이름, sal 급여, comm 커미션, sal * 12 + NVL(comm , 50) 연봉 
FROM
    emp
;
/*
    5.
    사원들의 사원번호, 사원이름, 직급을 조회하세요.
    사원이름은 이름 뒤에 ' 사원' 이 붙여져셔 조회하세요.
*/
SELECT
    empno 사원번호, ename ||' 사원' 사원이름, job 직급
FROM
    emp
;
--------------------------------------------------------------------------------
/*
    6. 
    부서번호가 20번인 사원들의
    사원번호, 사원이름, 직급, 부서번호를 조회하세요.    
*/
SELECT
    empno 사원번호, ename 사원이름, job 직급, deptno 부서번호
FROM
    emp
WHERE
--    deptno = 20
    deptno NOT IN (10, 30, 40)
;
/*
    7. 
    직급이 'SALESMAN' 인 사원들의
    사원이름, 직급, 부서번호를 조회하세요.
*/
SELECT
    ename 사원이름, job 직급, deptno 부서번호
FROM
    emp
WHERE
    job = 'SALESMAN'
;
/*
    8. 
    급여가 1000 미만인 사원들의
    사원번호, 사원이름, 급여를 조회하세요.
*/
SELECT
    empno 사원번호, ename 사원이름, sal 급여
FROM
    emp
WHERE
    sal < 1000
;
/*
    9.
    입사일이 81년 9월 8일인 사원의
    사원이름, 직급, 입사일을 조회하세요
*/
SELECT
    ename 사원이름, job 직급, hiredate 입사일
FROM
    emp
WHERE
    hiredate = '81/09/08'
;
/*
    10.
    사원의 이름이 'M' 이후 문자로 시작하는 사원중 
    급여가 1000 이상인 사원의
    사원이름, 직급, 급여를 조회하세요
*/
SELECT
    ename 사원이름, job 직급, sal 급여
FROM
    emp
WHERE
    ename >= 'N' 
    AND sal >= 1000
;
/*
    11.
    직급이 'MANAGER' 이고 급여가 1000보다 높고
    부서번호가 10번인 사원의
    사원이름, 직급, 급여, 부서번호를 조회하세요
*/
SELECT
    ename 사원이름, job 직급, sal 급여, deptno 부서번호
FROM
    emp
WHERE
    job = 'MANAGER'
    AND sal > 1000
    AND deptno = 10
;
/*
    12.
    직급이 'MANAGER' 가 아닌 사원들의
    사원이름, 직급, 입사일을 조회하세요.
    
    NOT 연산자 사용해서 처리하세요
*/
SELECT
    ename 사원이름, job 직급, hiredate 입사일
FROM
    emp
WHERE
--    job NOT IN ('MANAGER') 
    NOT job = 'MANAGER'
;
/*
    13.
    사원이름이 'C' 로 시작하는 것보다 크고
    'M' 으로 시작하는 것보다 작은 사원의
    사원이름, 직급, 급여를 조회하세요
    
    BETWEEN - AND 연산자 사용하세요
*/
SELECT
    ename 사원이름, job 직급, sal 급여
FROM
    emp
WHERE
    ename BETWEEN 'D' AND 'LZZZZZZZZZZZZZZZZZZZZZZZZZZ'
;
/*
    14.
    급여가 800, 950이 아닌 사원들의
    사원이름, 직급, 급여를 조회하세요
    
    NOT IN 연산자 사용해서 처리하세요.
*/
SELECT
    ename 사원이름, job 직급, sal 급여
FROM
    emp
WHERE
    sal NOT IN(800, 950)
;
/*
    15.
    사원이름이 'S' 로 시작하고
    이름 글자수가 5글자인 사원들의
    사원이름, 직급을 조회하세요
*/
SELECT
    ename 사원이름, job 직급
FROM
    emp
WHERE
    ename LIKE 'S____'
;
/*
    16.
    입사일이 3일인 사원들의
    사원이름, 직급, 입사일을 조회하세요
*/
SELECT
    ename 사원이름, job 직급, hiredate 입사일
FROM
    emp
WHERE
--    hiredate LIKE '%/__/03'
    hiredate LIKE '%/03'
;
/*
    17.
    사원이름이 4글자 또는 5글자인 사원들의
    사원이름, 직급, 급여를 조회하세요.
*/
SELECT
    ename 사원이름, job 직급, sal 급여
FROM
    emp
WHERE
    ename LIKE '_____' 
    OR ename LIKE '____'
;
/*
    `8.
    입사년도가 81년 이거나 82년인 사원들의
    사원이름, 급여, 입사일을 조회하세요.
    단, 급여는 현재 급여보다 10% 인상된 급여로 조회하세요.
*/
SELECT
    ename 사원이름, sal * 1.1 급여, hiredate 입사일
FROM
    emp
WHERE
    hiredate LIKE '81%' OR hiredate LIKE '82%'
;
/*
    19.
    이름이 'S' 로 끝나는 사원들의
    사원이름, 급여, 커미션을 조회하세요.
    단, 커미션은 현재 커미션보다 100 증가된 커미션으로 하고
    커미션이 없는 사원은 50으로 조회되게 하세요.
*/
SELECT
    ename 사원이름, sal 급여, NVL(comm + 100 , 50) 커미션
FROM
    emp
WHERE
    ename LIKE '%S'
;