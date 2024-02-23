-- day05

/*
    그룹함수
    ==> 여러행의 데이터를 하나로 만들어서 연산하고 결과를 알려주는 함수
    
        ***
        참고 ]
            그룹함수는 결과가 오직 한 개만 나오게 된다.
            따라서 그룹함수는 결과가 여러개 나오는 경우와
            혼용해서 사용할 수 없다.
            오직 여러 행의 결과가 한 행으로만 나오는 것과만 사용할 수 있다.
            
            예 ]
            SELECT
                ename
            FROM
                emp
            ;
            ==> 결과가 14개의 행이 발생한다.
            
            SELECT
                SUM(sal)
            FROM
                emp
            ;
            ==> SUM(sal) : 사원들의 급여의 합계를 계산해서 반환해주는 함수
                따라서 사원들의 합계는 여러 행의 값들이
                단일 값으로 계산되어서 만들어질 것이다.
                
                따라서 
                SELECT
                    sal, SUM(sal)
                FROM
                    emp
                ;
                는 사용할 수 없다.
                
            예 ]
                SELECT
                    ename, SUM(sal)
                FROM
                    emp
                ;
                이 질의명령 역시 불가능하다.
                
        참고 ]
            그룹함수끼리는 같이 사용할 수 있다.
                
        1. SUM()
            ==> 데이터의 합계를 구하는 함수
            
                형식 ]
                    SUM(컬럼이름)
                    
        2. AVG()
            ==> 데이터의 평균을 구하는 함수
            
                형식 ]
                    AVG(컬럼이름)
                
                참고]
                    NULL 데이터의 경우에는 평균을 계산한느 연산에서 완전히 제외된다.
                    
        3. COUNT()
            ==> 지정한 컬럼 중에서 데이터가 존재하는 컬럼의 수를 알려준다.
            
                참고 ]
                    데이터에 '*' 를 입력하면 행의 수를 조회한다.
                
                형식 ]
                    COUNT(컬럼이름)
                    
        4. MAX() / MIN()
            ==> 최대/최소값을 알려주는 함수
            
                형식 ]
                    MAX(컬럼이름)
                    MIN(컬럼이름)
        5. STDDEV()
        ==> 표준편차 반환해주는 함수
        
        6. VARIANCE()
        ==> 분산 반환해주는 함수
*/  

/*
    사원들의 총 급여 합계를 조회하세요
*/
SELECT
    SUM(sal) "총 급여 합계"
FROM
    emp
;

-- 사원들의 평균급여를 조회하세요
SELECT
    TRUNC(AVG(sal), 2) 평균급여
FROM
    emp   
;
-- 사원들의 총 급여와 평균급여를 조회하세요
SELECT
    SUM(sal) 총, 
    TRUNC(AVG(sal), 2) 평균
FROM
    emp
;
-- 사원들의 평균 커미션 
SELECT
    AVG(comm) 평균커미션 
-- NULL 데이터는 평균 구하는 연산에서 제외되므로 이렇게 조회하면 안된다.
-- 여기서의 의미는 커미션을 받는 사원들의 평균 커미션이 된다.
FROM
    emp
;
SELECT
    AVG(NVL(comm, 0))
FROM
    emp
;
-- 사원들 중 커미션을 받는 사원의 수를 조회하세요
SELECT
    COUNT(comm) commX
FROM
    emp
;
SELECT
    COUNT(*)
FROM
    emp
WHERE
    comm IS NOT NULL
;
-- 사원들 중 최대급여와 최소급여를 조회하세요
SELECT
    MAX(sal) 최대급여, MIN(sal) 최소급여
FROM
    emp
;   
-- 문자데이터도 최소, 최소값을 조회할 수 있다
SELECT
    MAX(ename), MIN(ename)
FROM
    emp
;

/*
    사원들의 직급의 갯수를 조회하세요
    
    ==> 직급을 중복없이 만들고
        그런 다음 갯수를 조회한다.
*/
SELECT
    COUNT(DISTINCT job) 직급갯수
FROM
    emp
;

--------------------------------------------------------------------------------
/*
    GROUP BY 절
    ==> 그룹함수에 적용할 그룹을 지정하는 절
    
        예 ]
            부서별 급여의 합계를 조회하세요
            직급별 급여의 평균을 조회하세요
            
        형식 ]
            SELECT
                컬럼이름1, 컬럼이름2, 그룹함수들...
            FROM
                테이블이름
          [ WHERE
                조건식 ]
            GROUP BY
                컬럼이름1, 컬럼이름2, ....
            ;
            
        참고 ]
            그룹화 기준이 되는(GROUP BY 절에 기술한) 
            컬럼들과 그룹함수는 같이 조회될 수 있다.
            
        참고 ]
            조건절을 이용해서 그룹함수계산에 적용될 데이터를 고를 수 있다.
        
        참고 ]
            그룹화 기준은 컬럼 전체가 아니여도 된다.
            컬럼 중 일부분을 이용해도 그룹화가 가능하다.
            
--------------------------------------------------------------------------------
    
    HAVING 절
    ==> 그룹화한 경우 계산된 그룹 중에서 조회에 포함시킬 그룹을 지정하는 조건절
        그룹화한 결과를 걸러내는 절
        GROUP BY 절 없이 단독으로 사용할 수 없다.
        반드시 GROUP BY 절과 같이 사용해야 한다.
        
        형식 ]
            SELECT
                그룹함수들...
            FROM
                테이블 이름
            [ WHERE
                조건식 ]
            GROUP BY
                그룹화 기준 컬럼
            [ HAVING
                조건식 ] - 조건식이 여러개 나열될 경우 논리연산자(AND, OR)로 처리해준다.
            [ ORDER BY
                컬럼이름 ASC 또는 DESC, ... ]
*/

-- 부서별 부서번호, 최대급여, 최소급여, 평균급여, 급여합계, 사원수를 조회하세요
SELECT
    deptno 부서번호, 
    MAX(sal) 최대급여, 
    MIN(sal) 최소급여, 
    TRUNC(AVG(sal), 2) 평균급여, 
    SUM(sal) 급여합계, 
    COUNT(*) 사원수
FROM
    emp
GROUP BY
    deptno
;

-- 사원들 중 첫 문자별로 그룹화해서 급여의 합계를 조회하세요
SELECT
    SUBSTR(ename, 1, 1) 첫문자, SUM(sal) 급여합계
FROM
    emp
GROUP BY
    SUBSTR(ename, 1, 1)
;

-- 문제 ]
--   직급별로 사원수를 조회하세요.
SELECT
    job, COUNT(*)
FROM
    emp
GROUP BY
    job
;

-- 부서별 최소급여를 조회하세요
SELECT
    deptno 부서번호, MIN(sal) 최소급여
FROM
    emp
GROUP BY
    deptno
;
-- 각 직급별 급여합계와 평균급여를 조회하세요
SELECT
    job 직급, SUM(sal) 급여합계, TRUNC(AVG(sal), 2) 평균급여
FROM
    emp
GROUP BY
    job
;
-- 입사년도별 입사년도, 평균급여, 급여합계, 입사원수를 조회하세요
SELECT
    TO_CHAR(hiredate, 'YYYY') 입사년도, AVG(sal) 평균급여, SUM(sal) 급여합계, COUNT(*) 입사원수
FROM
    emp
GROUP BY
    TO_CHAR(hiredate, 'YYYY')
;


-- 사원들의 이름 글자 수가 4, 5 글자인 사원수를 조회하세요.
-- 1. 그룹화하지않고 처리하세요.
-- 2. GROUP BY 절을 이용해서 처리하세요.


SELECT
    LENGTH(ename) 이름글자수, COUNT(ename) 사원수
FROM
    emp
GROUP BY
    LENGTH(ename)
HAVING
    LENGTH(ename) IN (4, 5)
;
-- HAVING

-- 부서별로 평균 급여를 조회하세요
-- 단, 부서 평균 급여가 2000 이상인 부서만 조회하세요.
SELECT
    deptno 부서번호, TRUNC(AVG(sal), 2) 평균급여
FROM
    emp
GROUP BY
    deptno
HAVING
    AVG(sal) >= 2000
;


SELECT
    deptno 부서번호, TRUNC(AVG(sal), 2) 평균급여
FROM
    emp
WHERE
    AVG(sal) >= 2000 -- 그룹함수는 WHERE 절에 사용 할 수 없다.
GROUP BY
    deptno
;

-- 30번 부서 사원들의 직급별 급여 평균을 조회하세요
SELECT
    job 직급, AVG(sal) 급여평균
FROM
    emp
WHERE 
    deptno = 30
GROUP BY
    job
;
-- 직급별로 사원 수를 조회하세요.
-- 단 사원수가 1명인 직급은 조회에서 제외하세요
SELECT
    job 직급, COUNT(*) 사원수
FROM
    emp
GROUP BY
    job
HAVING
--    COUNT(*) NOT IN (1)
    COUNT(*) <> 1
;
-- 81년도 입사한 사원들의 급여 합계를 직급별로 조회하세요.
-- 단, 직급별 평균급여가 1000 미만인 직급은 조회되지 않게 하세요.
SELECT
    job, SUM(sal)
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'yy') = '81'
GROUP BY
    job
HAVING
    AVG(sal) >= 1000
;
/*
    81년도 입사한 사원들의 급여 합계를
    사원들의 이름 길이별로 그룹화하세요.
    단, 급여 합계가 2000미만인 그룹은 조회에서 제외하세요.
    급여합계가 기준 내림차순 조회되게 하세요.
*/
SELECT
    LENGTH(ename) 이름길이, SUM(sal) 급여합계
FROM
    emp
WHERE
    TO_CHAR(hiredate, 'yy') = '81'
GROUP BY
    LENGTH(ename)
HAVING 
    AVG(sal) >= 2000
ORDER BY
    SUM(sal) DESC
;
/*
    사원들의 이름 길이가 4, 5글자인 사원들의 부서별 사원수를 조회하세요
    단, 사원수가 0인 부서는 조회에서 제외하세요
    부서번호 기준 오름차순 정렬하세요.
*/
SELECT
    deptno 부서번호, COUNT(*) 부서별사원수
FROM
    emp
WHERE
    LENGTH(ename) IN (4, 5)
GROUP BY
    deptno
HAVING
    COUNT(*) <> 0
ORDER BY
    deptno ASC
;
SELECT
    deptno 부서번호, COUNT(*) 부서사원
FROM
    emp
WHERE
    ename LIKE '____' OR ename LIKE '_____'
GROUP BY
    deptno
HAVING
    COUNT(deptno) NOT IN (0)
ORDER BY
    deptno ASC
;
--------------------------------------------------------------------------------
/*
    참고 ]
        DECODE 함수와 그룹함수의 조합
        
    부서별로 급여를 계산하는데
    10번 부서는 평균을
    20번 부서는 급여합계를
    30번 부서는 최대급여를 
    조회하세요
*/
SELECT
    deptno 부서번호, DECODE(deptno, 10, TRUNC(AVG(sal), 2), 
                                    20, SUM(sal), 
                                    30, MAX(sal)) 결과
FROM
    emp
GROUP BY
    deptno
;

--------------------------------------------------------------------------------
/*
    서브질의(Sub Query, 부질의)
    ==> 질의명령 내에 다시 질의명령이 포함될 수 있는데
        이 포함딘 질의명령을 서브질의라 한다.
        
        참고 ]
            서브질의는 어느 곳에서나 사용가능한데..
            
            SELECT 절에 포함된 서브질의는 
            반드시 단일행, 단일컬럼으로 결과가 만들어져야한다.
*/

-- SMITH 사원과 같은 부서 사원들의 
-- 사원이름, 부서번호, 직급을 조회하세요.
SELECT
    ename 사원이름, deptno 부서번호, job 직급
FROM
    emp
WHERE
    deptno = (
                SELECT
                    deptno
                FROM    
                    emp
                WHERE   
                    ename = 'SMITH'
            )
;
SELECT
    deptno
FROM    
    emp
WHERE   
    ename = 'SMITH'
;

SELECT
    ename, job, (
        SELECT
            job
        FROM
            emp
        WHERE
            ename = 'MILLER'
                ) 동료
FROM
    emp
WHERE
    ename = 'KING'
;
-- SELECT 절에 들어가는 서브질의
-- 반드시 단일행 단일컬럼으로 조회되어야 한다.
-- 'SMITH'의 사원이름, 직급, 부서번호, 소속부서평균급여를 조회하세요.
SELECT
    ename 사원이름, 
    job 직급, 
    deptno 부서번호, 
    (
        SELECT
            AVG(sal)
        FROM
            emp
        GROUP BY
            deptno 
        HAVING
            deptno = e.deptno
    
     ) 소속부서평균급여
FROM
    emp e
WHERE
    ename = 'SMITH'
;

-- SMITH 사원의 부서평균급여
SELECT
    AVG(sal)
FROM
    emp
WHERE
    deptno = (
                SELECT
                    deptno
                FROM
                    emp
                WHERE
                    ename = 'SMITH'
    
    
    )
;
SELECT
    AVG(sal)
FROM
    emp
GROUP BY
    deptno
HAVING
    deptno = (SELECT
                    deptno
                FROM
                    emp
                WHERE
                    ename = 'SMITH'
            )
;
-- 사원들의 사원이름, 부서번호, 부서최대급여, 부서원수 를 조회하세요.
SELECT
    e.ename 사원이름, 
    e.deptno 부서번호, 
    (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            deptno = e.deptno
    ) 부서최대급여,
    (
        SELECT
            COUNT(*)
        FROM
            emp
        WHERE
            deptno = e.deptno
    ) 부서원수
    
FROM
    emp e
;

--------------------------------------------------------------------------------

-- 사원들 중 소속부서 평균급여보다 급여가 적은 사원들의
-- 사원이름, 부서번호, 부서평균급여를 조회하세요.
SELECT
    e.ename 사원이름, 
    e.deptno 부서번호, 
    (
    SELECT
        TRUNC(AVG(sal), 2)
    FROM
        emp
    WHERE
        deptno = e.deptno
    
    ) 부서평균급여,
    e.sal 급여
FROM
    emp e
WHERE
    e.sal < (
            SELECT
                AVG(sal)
            FROM
                emp
            WHERE
                deptno = e.deptno
            )
;















