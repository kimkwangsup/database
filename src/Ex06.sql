/*
    1. 
        직급이 'MANAGER' 인 사원들의
        사원이름, 직급, 입사일, 급여, 부서이름
        을 조회하세요
*/
SELECT
    ename 사원이름, job 직급, hiredate 입사일, sal 급여, dname 부서이름
FROM
    emp e, dept d
WHERE
    job = 'MANAGER'
    AND e.deptno = d.deptno
    
;
/*
    2.
        급여가 가장 낮은 사원의 
        사원이름, 직급, 입사일, 급여, 부서이름, 부서위치
        를 조회하세요.
*/
SELECT
    ename 사원이름, 
    job 직급, 
    hiredate 입사일, 
    sal 급여, 
    dname 부서이름, 
    loc 부서위치    
FROM
    emp e, dept d
WHERE
    e.deptno = d.deptno 
    AND sal = (
                SELECT
                    MIN(sal)
                FROM
                    emp
    
                )
;
/*
    3. 
        사원들의
            사원이름, 직급, 입사년도, 부서번호, 부서이름, 급여, 급여등급, 
            상사이름, 상사직급, 상사급여, 상사급여등급
        을 조회하세요. 
        단, 81년 입사한 사원만 조회하세요.
*/
SELECT
    e.ename 사원이름, 
    e.job 직급, 
    e.hiredate 입사년도, 
    e.deptno 부서번호, 
    dname 부서이름, 
    e.sal 급여, 
    g.grade 급여등급, 
    s.ename 상사이름, 
    s.job 상사직급, 
    s.sal 상사급여, 
    r.grade 상사급여등급
FROM
    emp e,
    dept d,
    salgrade g,
    emp s,
    salgrade r
    
    
WHERE
   
    e.mgr = s.empno(+)
    AND e.sal BETWEEN g.losal AND g.hisal
    AND s.sal BETWEEN r.losal AND r.hisal
    AND e.deptno = d.deptno
    AND TO_CHAR(e.hiredate, 'yy') = '81'
;  
/*
    4. 
        이름의 글자 수가 5인 사원들의
            사원이름, 직급, 입사일, 급여, 급여등급
        을 조회하세요.
*/
SELECT
    ename 사원이름, 
    job 직급, 
    hiredate 입사일, 
    sal 급여, 
    grade 급여등급
FROM
    emp, salgrade
WHERE
    sal BETWEEN losal AND hisal
    AND LENGTH(ename) = 5
;

/*
    5. 
        사원들 중 입사년도가 81년이고 직급이 'MANAGER'인 사원들의
            사원이름, 직급, 입사일, 급여, 급여등급,
            부서이름, 부서위치
        를 조회하세요.
*/
SELECT
    e.ename 사원이름, 
    e.job 직급, 
    e.hiredate 입사일, 
    e.sal 급여, 
    grade 급여등급,
    d.dname 부서이름, 
    d.loc 부서위치
FROM
    emp e, dept d, salgrade
WHERE
    e.deptno = d.deptno
    AND sal BETWEEN losal AND hisal
    AND TO_CHAR(e.hiredate, 'yy') = '81'
    AND job = 'MANAGER'
;
/*
    6. 
        사원들의
            사원이름, 직급, 급여, 상사이름, 급여등급
        을 조회하세요.
*/
SELECT
    e.ename 사원이름, 
    e.job 직급, 
    e.sal 급여, 
    s.ename 상사이름, 
    grade 급여등급
FROM
    emp e, emp s, salgrade
WHERE
    e.mgr = s.empno(+)
    AND e.sal BETWEEN losal AND hisal
;

/*
    7. 
        사원들의
            사원이름, 직급, 급여, 상사이름, 부서이름, 부서위치, 급여등급
        을 조회하세요.
        단, 급여가 전체평균급여보다 많은 사원만 조회하세요.
*/
SELECT
    e.ename 사원이름, 
    e.job 직급, 
    e.sal 급여, 
    NVL(s.ename, '사장') 상사이름, 
    d.dname 부서이름, 
    d.loc 부서위치, 
    grade 급여등급
FROM
    emp e, emp s, dept d, salgrade
WHERE
    e.deptno = d.deptno
    AND e.mgr = s.empno(+)
    AND e.sal BETWEEN losal AND hisal
    AND e.sal >(
                SELECT
                    AVG(sal)
                FROM
                    emp
                )
;

--- 여기서부터 인라인 뷰를 이용해서 처리할 것.
/*
    8. 
        사원들 중 부서 최소급여자들의
            사원번호, 사원이름, 직급, 상사이름, 급여, 급여등급, 부서이름,
            부서평균급여, 부서최소급여, 부서원수
        를 조회하세요.
*/
SELECT
    e.empno 사원번호, 
    e.ename 사원이름, 
    e.job 직급, 
    s.ename 상사이름, 
    e.sal 급여, 
    grade 급여등급, 
    d.dname 부서이름,
    avg 평균급여, 
    min 최소급여, 
    cnt 부서원수
FROM
    emp e, 
    salgrade,
    emp s, 
    dept d,
    (
        SELECT
            deptno dno, MIN(sal) min, TRUNC(AVG(sal),2) avg, COUNT(*) cnt
        FROM
            emp
        GROUP BY
            deptno
    ) 
WHERE
    e.mgr = s.empno(+)
    AND e.deptno = d.deptno
    AND e.deptno = dno
    AND e.sal BETWEEN losal AND hisal
    AND e.sal = min
;
/*
    9. 
        사원들 중 부서원수가 제일 적은 부서에 속한 사원들의
            사원이름, 급여, 급여등급, 부서급여합계, 부서원수
        를 조회하세요.
*/
SELECT
    ename 사원이름, 
    sal 급여, 
    grade 급여등급, 
    sum 부서급여합계, 
    cnt 부서원수
FROM
    emp,
    salgrade,
    (
        SELECT
            deptno dno, COUNT(*) cnt, SUM(sal) sum
        FROM
            emp
        GROUP BY
            deptno
    )
WHERE
    deptno = dno
    AND sal BETWEEN losal AND hisal
    AND cnt = (
            SELECT
                MIN(COUNT(*))
            FROM
                emp
            GROUP BY
                deptno
        )
;
/*
    10.
        사원들 중 부서평균급여보다 급여가 적은 사원들의
            사원이름, 직급, 급여, 부서이름, 부서평균급여, 부서원수
        를 조회하세요.
*/
SELECT
    e.ename 사원이름, 
    e.job 직급, 
    e.sal 급여, 
    d.dname 부서이름, 
    avg 부서평균급여, 
    cnt 부서원수
FROM
    emp e, 
    dept d,
    (
        SELECT
            deptno dno, TRUNC(AVG(sal)) avg, COUNT(*) cnt
        FROM
            emp
        GROUP BY   
            deptno
    )
WHERE
    e.deptno = d.deptno
    AND e.deptno = dno
    AND e.sal < avg
;