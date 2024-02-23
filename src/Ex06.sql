/*
    1. 
        ������ 'MANAGER' �� �������
        ����̸�, ����, �Ի���, �޿�, �μ��̸�
        �� ��ȸ�ϼ���
*/
SELECT
    ename ����̸�, job ����, hiredate �Ի���, sal �޿�, dname �μ��̸�
FROM
    emp e, dept d
WHERE
    job = 'MANAGER'
    AND e.deptno = d.deptno
    
;
/*
    2.
        �޿��� ���� ���� ����� 
        ����̸�, ����, �Ի���, �޿�, �μ��̸�, �μ���ġ
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, 
    job ����, 
    hiredate �Ի���, 
    sal �޿�, 
    dname �μ��̸�, 
    loc �μ���ġ    
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
        �������
            ����̸�, ����, �Ի�⵵, �μ���ȣ, �μ��̸�, �޿�, �޿����, 
            ����̸�, �������, ���޿�, ���޿����
        �� ��ȸ�ϼ���. 
        ��, 81�� �Ի��� ����� ��ȸ�ϼ���.
*/
SELECT
    e.ename ����̸�, 
    e.job ����, 
    e.hiredate �Ի�⵵, 
    e.deptno �μ���ȣ, 
    dname �μ��̸�, 
    e.sal �޿�, 
    g.grade �޿����, 
    s.ename ����̸�, 
    s.job �������, 
    s.sal ���޿�, 
    r.grade ���޿����
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
        �̸��� ���� ���� 5�� �������
            ����̸�, ����, �Ի���, �޿�, �޿����
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, 
    job ����, 
    hiredate �Ի���, 
    sal �޿�, 
    grade �޿����
FROM
    emp, salgrade
WHERE
    sal BETWEEN losal AND hisal
    AND LENGTH(ename) = 5
;

/*
    5. 
        ����� �� �Ի�⵵�� 81���̰� ������ 'MANAGER'�� �������
            ����̸�, ����, �Ի���, �޿�, �޿����,
            �μ��̸�, �μ���ġ
        �� ��ȸ�ϼ���.
*/
SELECT
    e.ename ����̸�, 
    e.job ����, 
    e.hiredate �Ի���, 
    e.sal �޿�, 
    grade �޿����,
    d.dname �μ��̸�, 
    d.loc �μ���ġ
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
        �������
            ����̸�, ����, �޿�, ����̸�, �޿����
        �� ��ȸ�ϼ���.
*/
SELECT
    e.ename ����̸�, 
    e.job ����, 
    e.sal �޿�, 
    s.ename ����̸�, 
    grade �޿����
FROM
    emp e, emp s, salgrade
WHERE
    e.mgr = s.empno(+)
    AND e.sal BETWEEN losal AND hisal
;

/*
    7. 
        �������
            ����̸�, ����, �޿�, ����̸�, �μ��̸�, �μ���ġ, �޿����
        �� ��ȸ�ϼ���.
        ��, �޿��� ��ü��ձ޿����� ���� ����� ��ȸ�ϼ���.
*/
SELECT
    e.ename ����̸�, 
    e.job ����, 
    e.sal �޿�, 
    NVL(s.ename, '����') ����̸�, 
    d.dname �μ��̸�, 
    d.loc �μ���ġ, 
    grade �޿����
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

--- ���⼭���� �ζ��� �並 �̿��ؼ� ó���� ��.
/*
    8. 
        ����� �� �μ� �ּұ޿��ڵ���
            �����ȣ, ����̸�, ����, ����̸�, �޿�, �޿����, �μ��̸�,
            �μ���ձ޿�, �μ��ּұ޿�, �μ�����
        �� ��ȸ�ϼ���.
*/
SELECT
    e.empno �����ȣ, 
    e.ename ����̸�, 
    e.job ����, 
    s.ename ����̸�, 
    e.sal �޿�, 
    grade �޿����, 
    d.dname �μ��̸�,
    avg ��ձ޿�, 
    min �ּұ޿�, 
    cnt �μ�����
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
        ����� �� �μ������� ���� ���� �μ��� ���� �������
            ����̸�, �޿�, �޿����, �μ��޿��հ�, �μ�����
        �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, 
    sal �޿�, 
    grade �޿����, 
    sum �μ��޿��հ�, 
    cnt �μ�����
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
        ����� �� �μ���ձ޿����� �޿��� ���� �������
            ����̸�, ����, �޿�, �μ��̸�, �μ���ձ޿�, �μ�����
        �� ��ȸ�ϼ���.
*/
SELECT
    e.ename ����̸�, 
    e.job ����, 
    e.sal �޿�, 
    d.dname �μ��̸�, 
    avg �μ���ձ޿�, 
    cnt �μ�����
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