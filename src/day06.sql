-- day06

/*
    WHERE ���� ���Ǵ� ��������
        1. ���������� ����� ������ �����÷����� ��ȸ�Ǵ� ���
        ==> �Ϲ� ������ �Է��ϴ� �������� ����ϸ� �ȴ�.
        
            �� ]
                'SMITH' ����� ���� �μ��� ����� 
                    ����̸�, ����, �μ���ȣ�� ��ȸ�ϼ���.
                    
                SELECT
                    ename ����̸�, job ����, deptno �μ���ȣ
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
        2. ���������� ����� ������ �����÷����� ��ȸ�Ǵ� ��� 
        ==> �����Ͱ� ������ ��ȸ�Ǵ� ��� �̹Ƿ�
            ���߰� �� �����ڷ� ó���ؾ� �Ѵ�.
            
            IN
            ==> �������� ������ �� �ϳ��� ������ �Ǵ� ���
                ����� �� �ִ� �����ڴ� ����
                ���������� ����񱳿����� �Ѵ�.
                
                ���� ]
                    �÷��̸� IN (��������)
            
            ANY
            ==> �������� ������ �� �ϳ��� ������ �Ǵ� ���
                ����� �� �ִ� �����ڴ� ��� �񱳿����ڸ� ����� �� �ִ�.
                
                ���� ]
                    �÷��̸� = ANY (������ �����÷� ��������)
                    �÷��̸� > ANY (������ �����÷� ��������)
            ALL
            ==> �������� �����Ͱ� ��� ���ǿ� �¾ƾ� �Ǵ� ���
            
                ���� ]
                ����ó���� ũ��(>), �۴�(<) ���� �񱳸� ��� ����� �� �ִ�.
            
        3. ���������� ����� ������ �����÷����� ��ȸ�Ǵ� ���
        
            EXISTS
            ==> ���������� ����� �����ϸ� TRUE�� ó���ǰ�
                ������ FALSE�� ó���Ǵ� ������
                ���� �÷��� ������� �ʴ´�.
                
*/

-- 10���μ� ������ ���� ������ ������� 
--      ����̸�, ���� �� ��ȸ�ϼ���
SELECT
    ename ����̸�, job ����
FROM
    emp
WHERE
    job IN (
            SELECT
                job
            FROM
                emp
            WHERE
                deptno = 10
    
            )
;

-- ��� �μ��� ��ձ޿��� �� �޿��� �޿��� ���� ����� ����̸�, ����, �޿��� ��ȸ�ϼ���
SELECT
    ename ����̸�, job ����, sal �޿�
FROM
    emp
WHERE
    sal > ANY (
                SELECT
                    AVG(sal)
                FROM
                    emp
                GROUP BY
                    deptno
               )     
;
-- ��� �μ��� ��� �޿����� �޿��� ���� ������� ����̸�, ����, �޿��� ��ȸ�ϼ���
SELECT
    ename ����̸�, job ����, sal �޿�
FROM
    emp
WHERE
    sal > ALL (
                SELECT
                    AVG(sal)
                FROM
                    emp
                GROUP BY
                    deptno
               )     
;
-- �̹��� Ŀ�̼��� ������ �����ε� 'smith' ����� �ٹ��ϰ� ������ 
-- ��� ����� Ŀ�̼��� 20% �λ��ؼ� �����ϰ� ������ �������� �ʽ��ϴ�.
-- ��, Ŀ�̼��� ���� ����� 200���� �ϰ� ����ϱ�� �Ѵ�.
SELECT
    ename ����̸�, sal �޿�, NVL2(comm, comm * 1.2, 200 * 1.2) ����Ŀ�̼�
FROM
    emp
WHERE
    EXISTS (
            SELECT
                *
            FROM
                emp
            WHERE
                ename = 'smith'
            )
    
;
/*
    ������ 'MANAGER' �� ����麸�� �޿��� �Ѹ��̶� �޿��� ���� �����
        ����̸�, ����, �޿��� ��ȸ�ϼ���
*/
SELECT
    ename ����̸�, job ����, sal �޿�
FROM
    emp
WHERE
    sal > ANY(  
                SELECT
                    sal
                FROM
                    emp
                WHERE
                    job = 'MANAGER'
                )
;
/*
    ������ 'MANAGER' �� ��� ������� �޿����� �޿��� ���� �����
        ����̸�, ����, �޿��� ��ȸ�ϼ���
*/
SELECT
    ename ����̸�, job ����, sal �޿�
FROM
    emp
WHERE
    sal > All (  
                SELECT
                    sal
                FROM
                    emp
                WHERE
                    job = 'MANAGER'
                )
;

--------------------------------------------------------------------------------
/*
    ���������� ����� ���̺�ó�� ����� �� �ִ�.
    �̷��� FROM ���� ���Ե� �������Ǹ� ������ "�ζ��� ��" ��� �θ���.
    
    ���� ]
        SELECT
            �÷��̸���...
        FROM
            (��������) [��Ī]
        ;
        
    ���� ]
        �ζ��� ���� SELECT ���� �Լ��� ���ɶ��� �ݵ�� ��Ī�� �ο��ؾ� �Ѵ�.
        �ζ��� ���� SELECT ���� ��Ī���� �ٿ�����
        �÷��̸��� ��Ī���� �����ȴ�.
        
        
        
*/

-- �μ��� �μ���ȣ, �޿��հ�, ��ձ޿�, �ִ�޿�, �ּұ޿�, ������� 
-- �ζ��� �並 �̿��ؼ� ��ȸ�ϼ���
SELECT
    �μ���ȣ, �޿��հ�, ��ձ޿�, �ִ�޿�, �ּұ޿�, �����
FROM
    (
        SELECT
            deptno �μ���ȣ, 
            SUM(sal) �޿��հ�, 
            TRUNC(AVG(sal), 2) ��ձ޿�, 
            MAX(sal) �ִ�޿�, 
            MIN(sal) �ּұ޿�, 
            COUNT(*) �����
        FROM
            emp
        GROUP BY
            deptno
    ) e
;
--------------------------------------------------------------------------------
/*
    ����(JOIN)
    ==> �� �� �̻��� ���̺��� ���ϴ� �����͸� ��ȸ�ϴ� ���
    
        �����ͺ��̽� ���� �� �������� ���Ἲ Ȯ���� ���ؼ�
        ���̺��� �и��ؼ� ����� ���Ҵ�.
        �̶�, �и��� �����͸� ���ļ� ��ȸ�ؾ� �ϴ� ��찡 �߻��� �� �ִ�.
        �׶�, �и��� �����͸� �������� ����̴�.
        
        ���� ]
            SELECT
                �÷��̸���...
            FROM
                ���̺�1, ���̺�2, ...
            WHERE
                �������ǽ�1
                AND �������ǽ�2,
                ...
            ;
            
        ����Ŭ�� ������ �����ͺ��̽��̴�.
        ������ �����ͺ��̽��� ��ƼƼ ���� ���踦 �����ؼ� �����͸� �����ϴ� �����ͺ��̽��̴�.
        
        �׷��� �и��� ��ƼƼ�鿡�� �����͸� ��������
        ��ǻ�ʹ� � �����Ͱ� ����Ǿ� �ִ� ������������ �� �� �����Ƿ�
        ��� ������ ������ ���� ��ȸ�� �ȴ�.
        �� ��ȸ�� ��� ������ ������ ����� Cartesian Product(��ī��Ʈ ��)�̶�� �Ѵ�.
        �̷� ������
            Cross Join
        �̶�� �θ���.
        
    ������ ���� ]
        Cross Join
        ==> Cartesian Product �� ��ȸ�ϴ� ����
            �Ϲ������� ������� �ʴ� ����
            
        Inner Join
        ==> Cartesian Product ������ �ɷ����� �ϴ� ����
        
        Outer Join
        ==> Cartesian Product ���� ���� �����͸� ��ȸ�ϴ� ����
        
        EQUI JOIN
        ==> ���� ������ ����񱳿������� ó���ϴ� ����
        
        NON EQUI JOIN
        ==> ���� ������ ����񱳿����� �ƴ� ����
        
        SELF JOIN
        ==> ������ �� �� ���̺��� �ι� �̻� �̿��ؼ� �ϴ� ����
        
    ���� ]
        ������ �� WHERE ���� ���� ���� �̿��� �ٸ� �Ϲ� ������ ����� �� �ִ�.
        
        
*/
CREATE TABLE ecolor(
    cno NUMBER(5)
        CONSTRAINT ECOLOR_NO_PK PRIMARY KEY,
    ecname VARCHAR2(20 CHAR)
        CONSTRAINT ECOLOR_NAME_UK UNIQUE
        CONSTRAINT ECOLOR_NAME_NN NOT NULL,
    code CHAR(7)
        CONSTRAINT ECOLOR_CODE_UK UNIQUE
        CONSTRAINT ECOLOR_CODE_NN NOT NULL
);
CREATE TABLE kcolor(
    cno NUMBER(5)
        CONSTRAINT KCOLOR_NO_PK PRIMARY KEY,
    kcname VARCHAR2(20 CHAR)
        CONSTRAINT KCOLOR_NAME_UK UNIQUE
        CONSTRAINT KCOLOR_NAME_NN NOT NULL,
    code CHAR(7)
        CONSTRAINT KCOLOR_CODE_UK UNIQUE
        CONSTRAINT KCOLOR_CODE_NN NOT NULL
);

INSERT INTO
    ecolor
VALUES(
    10, 'RED', '#FF0000'
);
INSERT INTO
    ecolor
VALUES(
    20, 'GREEN', '#00FF00'
);
INSERT INTO
    ecolor
VALUES(
    30, 'BLUE', '#0000FF'
);

INSERT INTO
    kcolor
VALUES(
    10, '����', '#FF0000'
);
INSERT INTO
    kcolor
VALUES(
    20, '�ʷ�', '#00FF00'
);
INSERT INTO
    kcolor
VALUES(
    30, '�Ķ�', '#0000FF'
);

commit;

--------------------------------------------------------------------------------
SELECT
    e.cno �����ȣ, ecname ��������, kcname �ѱۻ���, e.code �ڵ��̸�
FROM
    ecolor e, kcolor k
WHERE
    e.cno = k.cno -- ��������, INNER JOIN, EQUI JOIN
;
-- ������� ����̸�, ����, �μ��̸��� ��ȸ�ϼ���.
SELECT
    ename ����̸�, 
    job ����, 
    e.deptno �μ���ȣ, 
    e.deptno �μ���ȣ1, 
    dname �μ��̸�
FROM
    dept d, emp e
;

SELECT
    ename ����̸�, 
    job ����, 
    e.deptno �μ���ȣ, 
    e.deptno �μ���ȣ1, 
    dname �μ��̸�
FROM
    dept d, emp e
WHERE
    d.deptno = e.deptno
;

-- �Ϲ����ǰ� ���� ����� �� �ִ�.
-- 81�� �Ի��� ����� ����̸�, ����, �Ի�⵵, �μ���ġ�� ��ȸ�ϼ���.
SELECT
    ename ����̸�, job ����, TO_CHAR(hiredate, 'yyyy') �Ի�⵵, loc �μ���ġ
FROM
    emp e, dept d
WHERE
-- ��������
    TO_CHAR(hiredate, 'yy') = '81' 
    AND e.deptno = d.deptno
;

-- NONE EQUI JOIN - �������ǿ� ����ϴ� �����ڰ� ��Һ񱳸� �ϴ� ���
-- ������� ����̸�, ����, �޿�, �޿���� �� ��ȸ�ϼ���.
SELECT
    ename ����̸�, 
    job ����, 
    sal �޿�, 
    losal �ּұ޿�, 
    hisal �ִ�޿�, 
    grade �޿����
FROM
    emp e, salgrade s
;

SELECT
    ename ����̸�, 
    job ����, 
    sal �޿�, 
    losal �ּұ޿�, 
    hisal �ִ�޿�, 
    grade �޿����
FROM
    emp e, salgrade s
WHERE
    -- ��������
    sal >= losal AND sal <= hisal
;

SELECT
    ename ����̸�, 
    job ����, 
    sal �޿�,
    grade �޿����
FROM
    emp e, salgrade s
WHERE
    -- ��������
--    sal >= losal AND sal <= hisal
    sal BETWEEN losal AND hisal
;

-- �������� ������ ���ÿ� �����ؼ� ��ȸ�� �� �ִ�.
/*
    �������
        ����̸�, ����, �޿�, �μ���ȣ, �μ��̸�, �޿����
    �� ��ȸ�ϼ���
*/
SELECT
    ename ����̸�, 
    job ����, 
    sal �޿�, 
    e.deptno �μ���ȣ, 
    dname �μ��̸�, 
    grade �޿����
FROM
    emp e, dept d, salgrade s
;

SELECT
    ename ����̸�, 
    job ����, 
    sal �޿�, 
    e.deptno �μ���ȣ, 
    dname �μ��̸�, 
    grade �޿����
FROM
    emp e, dept d, salgrade s
WHERE
    -- ��������� �μ����� ����
    e.deptno = d.deptno 
    -- ������ ����� �޿�������� ����
    AND sal BETWEEN losal AND hisal
;

-- 30�� �μ� ������� ����̸�, ����, �μ���ġ, �޿�, �޿������ ��ȸ�ϼ���
SELECT
    ename ����̸�, job ����, loc �μ���ġ, sal �޿�, grade �޿����
FROM
    emp e, dept d, salgrade s
WHERE
    e.deptno = d.deptno 
    AND sal BETWEEN losal AND hisal
    AND e.deptno = 30
;
-- SELF JOIN
-- ������� ����̸�, ����, ����ȣ, ����̸��� ��ȸ�ϼ���
SELECT
    ename ����̸�, 
    job ����, 
    mgr ����ȣ, 
    (
        SELECT
            ename
        FROM
            emp
        WHERE
            empno = e.mgr
    ) ����̸�
FROM
    emp e
;

SELECT
    e.ename ����̸�, 
    e.job ����, 
    e.mgr ����ȣ,
    s.empno,
    s.ename ����̸�
FROM
    emp e, -- �������
    emp s  -- �������
WHERE
    e.mgr = s.empno
;
-- ��������� ��� INNER JOIN
--------------------------------------------------------------------------------

-- OUTER JOIN : Cartesian Product ���� ���� �����͸� �����ϴ� ���
/*
    ���� ]
        NULL�� ǥ���Ǿ�� �� ���̺� �÷��� "(+)" �� �ٿ��ش�.
*/

SELECT
    e.ename ����̸�, 
    e.job ����, 
    e.mgr ����ȣ,
    s.empno,
    NVL(s.ename, '������') ����̸�
FROM
    emp e, -- �������
    emp s  -- �������
WHERE
    e.mgr = s.empno(+)
;

SELECT
    e.ename ����̸�, 
    e.job ����, 
    e.mgr ����ȣ,
    s.empno,
    NVL(s.ename, '������') ����̸�
FROM
    emp e, -- �������
    emp s  -- �������
WHERE
    e.mgr(+) = s.empno -- ������� ������ ��簡 �ƴ� ����� ��ȸ.
;

/*  
    �������
        ����̸�, ����, �Ի�⵵, �μ���ȣ, �μ��̸�, �޿�, �޿����, ����̸�, �������, ������
    �� ��ȸ�ϼ���
*/
SELECT
    e.ename ����̸�, 
    e. job ����, 
    TO_CHAR(e.hiredate, 'YYYY') �Ի�⵵, 
    e.deptno �μ���ȣ, 
    d.dname �μ��̸�, 
    e.sal �޿�, 
    grade �޿����, 
    s.ename ����̸�, 
    s.job �������, 
    s.sal ������
FROM
    emp e, 
    salgrade,
    emp s,
    dept d
    
WHERE
    e.deptno = d.deptno
    AND e.sal BETWEEN losal AND hisal
    AND e.mgr = s.empno(+)
;
--------------------------------------------------------------------------------
/*
    �ζ��� �䵵 ���ο� ����� �� �ִ�.
*/

-- ������� ����̸�, ����, �޿�, �μ���ȣ, �μ��ִ�޿�, �μ����� �� ��ȸ�ϼ���
SELECT
    ename ����̸�, 
    job ����, 
    sal �޿�, 
    dno �μ���ȣ, 
    max �μ��ִ�޿�, 
    cnt �μ�����
FROM
    emp,
    (   
        SELECT
            deptno dno, MAX(sal) max, COUNT(*) cnt
        FROM
            emp
        GROUP BY
            deptno
    )
WHERE
    deptno = dno
;

-- ������� ����̸�, ����, ����̸�, �޿�, �μ���ȣ, �μ��ִ�޿�, �μ����� �� ��ȸ�ϼ���.
SELECT
    e.ename ����̸�, e.job ����, s.ename ����̸�, e.sal �޿�, dno �μ���ȣ, 
    max �μ��ִ�޿�, cnt �μ�����
FROM
    emp e, emp s, 
    (
        SELECT
            deptno dno, MAX(sal) max, COUNT(*) cnt
        FROM
            emp
        GROUP BY
            deptno
    )
WHERE
    e.mgr = s.empno(+)
    AND e.deptno = dno
;

SELECT
    *
FROM
    emp e, emp s
WHERE
    e.mgr = s.empno(+)
;




