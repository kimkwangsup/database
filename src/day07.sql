-- day07

/*
    ANSI JOIN
    ==> ���� ����� DBMS ȸ��鸶�� �ణ�� �� ������ �޶�����.
        �׷��ٺ��� ������ ���� ����� �� �������� �ذ��ϰ��� 
        �̱� ǥ��ȭ ��ȸ���� ǥ�� ���Ǹ�� ������ ������ ���Ҵ�.
        �̰��� ANSI ���̶�� �θ��� �����̴�.
        
        JOIN ���� �����ͺ��̽� ȸ��� ���� ��� �޶��� �� �ִµ�
        �̰��� ���Ͻ��Ѽ� ����� �� �ֵ��� ������ ���� 
        �� �����ͺ��̽� ���� ��� ����� �� �ֵ��� �� ���Ҵ�.
        �� JOIN ������ ANSI JOIN �̶�� �Ѵ�.
        
        1. CROSS JOIN
        ==> Cartesian Product �� ������ ����
            
            ���� ]
                SELECT
                    �÷��̸���...
                FROM
                    ���̺��̸�1
                CROSS JOIN
                    ���̺��̸�2
                ;
          
        2. INNER JOIN
            ==> EQUI JOIN. NON EQUI JOIN, SELF JOIN �� ó���� �� �ִ� JOIN����
                CROSS JOIN �� ����� ������ �ʿ��� �����͸� �������� JOIN
                
            ���� ]
                SELECT
                    �÷��̸���...
                FROM
                    ���̺��̸�1
                [INNER] JOIN
                    ���̺��̸�2
                ON
                    ��������
                [INNER] JOIN
                    ���̺��̸�3
                ON
                    ��������
                    ...
                WHERE   
                    �Ϲ�����
                ;
                
        3. OUTER JOIN
            ==> LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN
            
                ���� ]
                    SELECT
                        �÷��̸���
                    FROM
                        ���̺��̸�1
                    LEFT || RIGHT || FULL OUTER JOIN
                        ���̺��̸�2
                    ON
                        ��������
                    [WHERE
                        �Ϲ�����]
                    ;
    
        4. NATURAL JOIN
            ==> �ڵ� ����
                �ݵ�� ���� ���ǽ�(ON ��)�� ���Ǵ� �÷��̸��� �����ϰ�
                �ݵ�� ������ �̸��� �÷��� �� ���� ��쿡�� ����� �� �ִ� ����.
                
            ���� ] 
                SELECT
                    �÷��̸���...
                FROM
                    ���̺��̸�1
                NATURAL JOIN
                    ���̺��̸�2
                ;
                
        5. USING JOIN
            ==> �ݵ�� �������ǽĿ� ����ϴ� �÷� �̸��� ������ ���
                �׸��� ���� �̸��� �÷��� �Ѱ� �̻� �ִ� ��쿡 ����� �� �ִ� ����
            
            ���� ]
                SELECT
                    �÷��̸���...
                FROM
                    ���̺��̸�1
                JOIN
                    ���̺��̸�2
                USING
                    (���ο� ����� �÷��̸�)
                ;
*/

-- CROSS JOIN
SELECT
    *
FROM
    emp
CROSS JOIN
    dept
;

-- ������� ����̸�, ����, �μ��̸��� ��ȸ�ϼ���
SELECT
    ename ����̸�, job ����, dname �μ��̸�
FROM
    emp e
INNER JOIN
    dept d
ON
    e.deptno = d.deptno
;

-- ������� ����̸�, ����, �޿�, �μ��̸�, �޿������ ��ȸ�ϼ���.
SELECT
    ename ����̸�, job ����, sal �޿�, dname �μ��̸�, grade �޿����
FROM
    emp e
JOIN
    dept d
ON
    e.deptno = d.deptno
JOIN
    salgrade
ON
    e.sal BETWEEN losal AND hisal
;

-- �μ��� �ּұ޿����� ����̸�, ����, �μ��̸�, �޿����, �μ���ձ޿�, �μ������� ��ȸ�ϼ���
SELECT
    ename ����̸�, job ����, dname �μ��̸�, grade �޿����, avg �μ���ձ޿�, cnt �μ�����
FROM
    emp e
JOIN
    (   
        SELECT
            deptno dno, MIN(sal) min, TRUNC(AVG(sal)) avg, COUNT(*) cnt
        FROM
            emp
        GROUP BY
            deptno
    )
ON
    deptno = dno
JOIN
    dept d
ON
    d.deptno = dno
JOIN
    salgrade
ON
    sal BETWEEN losal AND hisal
WHERE
    sal = min
;

-- OUTER JOIN
-- ������� ����̸�, ����, ����̸��� ��ȸ�ϼ���.
SELECT
    e.ename ����̸�, e.job ����, s.ename ����̸�
FROM
    emp e
RIGHT OUTER JOIN -- ��簡 ���� ���, ��簡 �ƴ� ����� ���ÿ� ��ȸ.
    emp s
ON
    e.mgr = s.empno
;

-- ��簡 �ƴ� ������� ����̸�, ����, �޿��� ��ȸ�ϼ���
SELECT
    DISTINCT mgr
FROM
    emp
WHERE
    mgr IS NOT NULL
;

SELECT
    ename ����̸�, job ����, sal �޿�
FROM
    emp
WHERE
    empno NOT IN (
                SELECT
                    DISTINCT mgr
                FROM
                    emp
                WHERE
                    mgr IS NOT NULL
                )
;

-- NATURAL JOIN
-- ������� ����̸�, ����, �޿�, �μ���ȣ, �μ��̸�, �μ���ġ�� ��ȸ�ϼ���.
SELECT
    ename ����̸�, job ����, sal �޿�, deptno �μ���ȣ, dname �μ��̸�, loc �μ���ġ
FROM
    emp
NATURAL JOIN
    dept
;

-- USING JOIN
SELECT
    ename ����̸�, job ����, sal �޿�, deptno �μ���ȣ, dname �μ��̸�, loc �μ���ġ
FROM
    emp
JOIN
    dept
USING
    (deptno)
;

--------------------------------------------------------------------------------
/*
    �����ͺ��̽� ����� ����
        
        1. DDL(Data Definition Lauguage) : ������ ���� ���
            CREATE, ALTER, DROP, TRUNCATE
            
        2. DML(Data Manipulation Language) : ������ ���� ���
            ==> �츮�� ����ߴ� SELECT ����� DML �Ҽ��� ����̴�.
            
            C   - CREATE    - INSERT
            R   - READ      - SELECT
            U   - UPDATE    - UPDATE
            D   - DELETE    - DELETE
            
            
        3. DLC(Data Control Language) : ������ ���� ���
        
            ���Ѱ� Ʈ�����ǿ� ���õ� ��ɵ�...
            
            TCL ���(TRANSACTION CONTROL LANGUAGE)
            ==> Ʈ������(ó�� �ؾ� �� �۾��� ����)�� �����ϴ� ���
                ��� ]
                    COMMIT, ROLLBACK, SAVEPOINT,....
                
            ���ѿ� ���õ� ��ɵ�
                GRANT   : ������ �ο��ϴ� ���
                REVOKE  : �ο��� ������ ȸ���ϴ� ���
                
--------------------------------------------------------------------------------

    DML ���
        1. SELECT : ���̺� ��ȸ ���
        
        2. INSERT : ���̺� �����͸� �߰����ִ� ���
            ���� ]
                �����͸� �Է��ϴ� �����
                �� ���� �� ���� ���̺� �� ���� �����͸� �߰��� �� �ִ�.
            
            ���� 1 ]
                INSERT INTO
                    ���̺��̸�
                VALUES(
                    �÷��̸�1, �÷��̸�2, ...
                    (�ݵ�� ���̺� ���ǵǾ��ִ� �÷� ������� �����͸� ���缭 �Է��ؾ��Ѵ�.
                );
            
            ���� 2 ]
                 INSERT INTO
                    ���̺��̸�(�÷��̸�1, �÷��̸�2, ...)
                 VALUES(
                    ������1, ������2, ...
                    ==> �÷��̸��� ������ ������� �÷� �����͸� �Է����ش�.
                 );
                 
            ���� ]
                �����ͺ��̽��� ������ �Է���
                �� ������ �Է��� �ǰ�
                Ư�� �÷����� ������ �߻��ϸ�
                �� �÷��� �Է��� ���ϴ� ���� �ƴϰ�
                �� �� ��ü �Է��� �ȵǴ� �������� ó���Ѵ�.
            
            ���� ]
                �Է��� �� �÷��� ������ �������� ������ �ݵ�� ��ġ�ؾ� �Ѵ�.
                ������ ��ġ���Ѿ� �Ѵ�.
                
        3. UPDATE : �ԷµǾ� �ִ� �����͸� �����ϴ� ���.
        
            ���� ]
                UPDATE
                    ���̺��̸�
                SET
                    �÷��̸� = ������,
                    �÷��̸� = ������,
                    ...
                [WHERE
                    ���ǽ�]
                ;
                
                ���� ]
                    WHERE ���ǽĿ� �´� �����͸� ��� �����ؼ�
                    SET ���� �������� �����ϰ� �ȴ�.
                    
                *****
                ���� ]
                    WHERE �������� ������� ������
                    ���̺� ���� ��� �����͸� �����ϰ� �ǹǷ�
                    �׻� �����ؾ� �Ѵ�.
        4. DELETE ���
            ==> �Էµ� ������ ���� �����ϴ� ���
            
            ���� ]
                DELETE FROM
                    ���̺��̸�
                [WHERE
                    ���ǽ�]
            
            *****
            ���� ]
                WHERE �������� ������� ������ ��� ������ ���� �����ϰ� ���̤ѷ�
                �ݵ�� �������� ����ϵ��� �Ѵ�.
*/


-- ������ ���̺� �غ�
CREATE TABLE tmp
AS
    SELECT
        *
    FROM
        emp
    WHERE  
        1 = 2
;    

INSERT INTO
    tmp-- ���̺��̸��� ����� ��쿡�� ���̺��Ǹ�� �÷� �����͸� �Է������ �Ѵ�.
VALUES(
    1001, 'jennie', '����', 1000, TO_DATE('2024/02/22'), 5000, null, 40
    -- �����Ͱ� �����غ� �ȵ� ���� �߰��� �� �ݵ�� null�� �Է������ �Ѵ�.
);

INSERT INTO
    tmp
VALUES(
    1000, 'euns', '����', null, TO_DATE('2024/02/21'), null, null, 40
);

-- ���� 2
INSERT INTO
    tmp(empno, ename, hiredate, sal, deptno)
VALUES(
    1002, 'SMITH', TO_DATE('2024/02/22'), 8000, 20
    -- ������ �÷��̸������� �÷������͸� �Է��ؾ� �ϰ�
    -- �������� ���� �÷��� �����ʹ� null �� ä������.
);

INSERT INTO
    tmp(ename)
VALUES(
    2000 -- �� ���� TO_CHAR() �Լ��� �ڵ� ȣ��Ǽ� ����ȯ�� �ż� �Էµȴ�.
);

-- tmp ���̺� Ŀ�̼��� 500���� �����ϼ���.
UPDATE
    tmp
SET
    comm = 500
;

COMMIT;

UPDATE
    tmp
SET
    sal = 4500
WHERE
    empno = 1002
;

UPDATE
    tmp
SET
    sal = 5500,
    mgr = 1001
WHERE
    empno = (
                SELECT
                    empno
                FROM
                    tmp
                WHERE
                    ename = 'SMITH'
            ) -- �������� ����� �� �ִ�.
;

-- 1000 ����� �޿��� jennie ����� 10% �λ�� �޿���, 
-- Ŀ�̼��� ����Ŀ�̼��� 10���
SELECT
    (
        SELECT
            sal * 1.1
        FROM
            tmp
        WHERE
            empno = 1001
    ) ,
    comm * 10
FROM
    tmp
WHERE
    empno = 1000
;
UPDATE
    tmp
SET
    (sal, comm) = (
    SELECT
    (
        SELECT
            sal * 1.1
        FROM
            tmp
        WHERE
            empno = 1001
    ) ,
        comm * 10
    FROM
        tmp
    WHERE
        empno = 1000
)
WHERE
    empno = 1000
;
COMMIT;

-- DELETE
DELETE FROM
    tmp
;   

ROLLBACK;

/*
    INSERT ��ɿ��� �������Ǹ� ����� �� �ִ�.
        
        ���� ]
            INSERT INTO ���̺��̸�
                SELECT
                    �÷��̸���...
                FROM    
                    ���̺��̸�
                WHERE
                    ���ǽ�
            
*/
-- emp ���̺��� SCOTT �� ������ tmp ���̺� �Է��ϼ���.
INSERT INTO
    tmp
SELECT
    *
FROM
    emp
WHERE
    ename = 'SCOTT'
;
    
-- tmp ���̺��� 1000 ����� ������ '������'���� �����ϼ���.
UPDATE
    tmp
SET
    job = '������'
WHERE
    empno = 1000
;

commit;























