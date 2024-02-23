-- day05

/*
    �׷��Լ�
    ==> �������� �����͸� �ϳ��� ���� �����ϰ� ����� �˷��ִ� �Լ�
    
        ***
        ���� ]
            �׷��Լ��� ����� ���� �� ���� ������ �ȴ�.
            ���� �׷��Լ��� ����� ������ ������ ����
            ȥ���ؼ� ����� �� ����.
            ���� ���� ���� ����� �� �����θ� ������ �Ͱ��� ����� �� �ִ�.
            
            �� ]
            SELECT
                ename
            FROM
                emp
            ;
            ==> ����� 14���� ���� �߻��Ѵ�.
            
            SELECT
                SUM(sal)
            FROM
                emp
            ;
            ==> SUM(sal) : ������� �޿��� �հ踦 ����ؼ� ��ȯ���ִ� �Լ�
                ���� ������� �հ�� ���� ���� ������
                ���� ������ ���Ǿ ������� ���̴�.
                
                ���� 
                SELECT
                    sal, SUM(sal)
                FROM
                    emp
                ;
                �� ����� �� ����.
                
            �� ]
                SELECT
                    ename, SUM(sal)
                FROM
                    emp
                ;
                �� ���Ǹ�� ���� �Ұ����ϴ�.
                
        ���� ]
            �׷��Լ������� ���� ����� �� �ִ�.
                
        1. SUM()
            ==> �������� �հ踦 ���ϴ� �Լ�
            
                ���� ]
                    SUM(�÷��̸�)
                    
        2. AVG()
            ==> �������� ����� ���ϴ� �Լ�
            
                ���� ]
                    AVG(�÷��̸�)
                
                ����]
                    NULL �������� ��쿡�� ����� ����Ѵ� ���꿡�� ������ ���ܵȴ�.
                    
        3. COUNT()
            ==> ������ �÷� �߿��� �����Ͱ� �����ϴ� �÷��� ���� �˷��ش�.
            
                ���� ]
                    �����Ϳ� '*' �� �Է��ϸ� ���� ���� ��ȸ�Ѵ�.
                
                ���� ]
                    COUNT(�÷��̸�)
                    
        4. MAX() / MIN()
            ==> �ִ�/�ּҰ��� �˷��ִ� �Լ�
            
                ���� ]
                    MAX(�÷��̸�)
                    MIN(�÷��̸�)
        5. STDDEV()
        ==> ǥ������ ��ȯ���ִ� �Լ�
        
        6. VARIANCE()
        ==> �л� ��ȯ���ִ� �Լ�
*/  

/*
    ������� �� �޿� �հ踦 ��ȸ�ϼ���
*/
SELECT
    SUM(sal) "�� �޿� �հ�"
FROM
    emp
;

-- ������� ��ձ޿��� ��ȸ�ϼ���
SELECT
    TRUNC(AVG(sal), 2) ��ձ޿�
FROM
    emp   
;
-- ������� �� �޿��� ��ձ޿��� ��ȸ�ϼ���
SELECT
    SUM(sal) ��, 
    TRUNC(AVG(sal), 2) ���
FROM
    emp
;
-- ������� ��� Ŀ�̼� 
SELECT
    AVG(comm) ���Ŀ�̼� 
-- NULL �����ʹ� ��� ���ϴ� ���꿡�� ���ܵǹǷ� �̷��� ��ȸ�ϸ� �ȵȴ�.
-- ���⼭�� �ǹ̴� Ŀ�̼��� �޴� ������� ��� Ŀ�̼��� �ȴ�.
FROM
    emp
;
SELECT
    AVG(NVL(comm, 0))
FROM
    emp
;
-- ����� �� Ŀ�̼��� �޴� ����� ���� ��ȸ�ϼ���
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
-- ����� �� �ִ�޿��� �ּұ޿��� ��ȸ�ϼ���
SELECT
    MAX(sal) �ִ�޿�, MIN(sal) �ּұ޿�
FROM
    emp
;   
-- ���ڵ����͵� �ּ�, �ּҰ��� ��ȸ�� �� �ִ�
SELECT
    MAX(ename), MIN(ename)
FROM
    emp
;

/*
    ������� ������ ������ ��ȸ�ϼ���
    
    ==> ������ �ߺ����� �����
        �׷� ���� ������ ��ȸ�Ѵ�.
*/
SELECT
    COUNT(DISTINCT job) ���ް���
FROM
    emp
;

--------------------------------------------------------------------------------
/*
    GROUP BY ��
    ==> �׷��Լ��� ������ �׷��� �����ϴ� ��
    
        �� ]
            �μ��� �޿��� �հ踦 ��ȸ�ϼ���
            ���޺� �޿��� ����� ��ȸ�ϼ���
            
        ���� ]
            SELECT
                �÷��̸�1, �÷��̸�2, �׷��Լ���...
            FROM
                ���̺��̸�
          [ WHERE
                ���ǽ� ]
            GROUP BY
                �÷��̸�1, �÷��̸�2, ....
            ;
            
        ���� ]
            �׷�ȭ ������ �Ǵ�(GROUP BY ���� �����) 
            �÷���� �׷��Լ��� ���� ��ȸ�� �� �ִ�.
            
        ���� ]
            �������� �̿��ؼ� �׷��Լ���꿡 ����� �����͸� �� �� �ִ�.
        
        ���� ]
            �׷�ȭ ������ �÷� ��ü�� �ƴϿ��� �ȴ�.
            �÷� �� �Ϻκ��� �̿��ص� �׷�ȭ�� �����ϴ�.
            
--------------------------------------------------------------------------------
    
    HAVING ��
    ==> �׷�ȭ�� ��� ���� �׷� �߿��� ��ȸ�� ���Խ�ų �׷��� �����ϴ� ������
        �׷�ȭ�� ����� �ɷ����� ��
        GROUP BY �� ���� �ܵ����� ����� �� ����.
        �ݵ�� GROUP BY ���� ���� ����ؾ� �Ѵ�.
        
        ���� ]
            SELECT
                �׷��Լ���...
            FROM
                ���̺� �̸�
            [ WHERE
                ���ǽ� ]
            GROUP BY
                �׷�ȭ ���� �÷�
            [ HAVING
                ���ǽ� ] - ���ǽ��� ������ ������ ��� ��������(AND, OR)�� ó�����ش�.
            [ ORDER BY
                �÷��̸� ASC �Ǵ� DESC, ... ]
*/

-- �μ��� �μ���ȣ, �ִ�޿�, �ּұ޿�, ��ձ޿�, �޿��հ�, ������� ��ȸ�ϼ���
SELECT
    deptno �μ���ȣ, 
    MAX(sal) �ִ�޿�, 
    MIN(sal) �ּұ޿�, 
    TRUNC(AVG(sal), 2) ��ձ޿�, 
    SUM(sal) �޿��հ�, 
    COUNT(*) �����
FROM
    emp
GROUP BY
    deptno
;

-- ����� �� ù ���ں��� �׷�ȭ�ؼ� �޿��� �հ踦 ��ȸ�ϼ���
SELECT
    SUBSTR(ename, 1, 1) ù����, SUM(sal) �޿��հ�
FROM
    emp
GROUP BY
    SUBSTR(ename, 1, 1)
;

-- ���� ]
--   ���޺��� ������� ��ȸ�ϼ���.
SELECT
    job, COUNT(*)
FROM
    emp
GROUP BY
    job
;

-- �μ��� �ּұ޿��� ��ȸ�ϼ���
SELECT
    deptno �μ���ȣ, MIN(sal) �ּұ޿�
FROM
    emp
GROUP BY
    deptno
;
-- �� ���޺� �޿��հ�� ��ձ޿��� ��ȸ�ϼ���
SELECT
    job ����, SUM(sal) �޿��հ�, TRUNC(AVG(sal), 2) ��ձ޿�
FROM
    emp
GROUP BY
    job
;
-- �Ի�⵵�� �Ի�⵵, ��ձ޿�, �޿��հ�, �Ի������ ��ȸ�ϼ���
SELECT
    TO_CHAR(hiredate, 'YYYY') �Ի�⵵, AVG(sal) ��ձ޿�, SUM(sal) �޿��հ�, COUNT(*) �Ի����
FROM
    emp
GROUP BY
    TO_CHAR(hiredate, 'YYYY')
;


-- ������� �̸� ���� ���� 4, 5 ������ ������� ��ȸ�ϼ���.
-- 1. �׷�ȭ�����ʰ� ó���ϼ���.
-- 2. GROUP BY ���� �̿��ؼ� ó���ϼ���.


SELECT
    LENGTH(ename) �̸����ڼ�, COUNT(ename) �����
FROM
    emp
GROUP BY
    LENGTH(ename)
HAVING
    LENGTH(ename) IN (4, 5)
;
-- HAVING

-- �μ����� ��� �޿��� ��ȸ�ϼ���
-- ��, �μ� ��� �޿��� 2000 �̻��� �μ��� ��ȸ�ϼ���.
SELECT
    deptno �μ���ȣ, TRUNC(AVG(sal), 2) ��ձ޿�
FROM
    emp
GROUP BY
    deptno
HAVING
    AVG(sal) >= 2000
;


SELECT
    deptno �μ���ȣ, TRUNC(AVG(sal), 2) ��ձ޿�
FROM
    emp
WHERE
    AVG(sal) >= 2000 -- �׷��Լ��� WHERE ���� ��� �� �� ����.
GROUP BY
    deptno
;

-- 30�� �μ� ������� ���޺� �޿� ����� ��ȸ�ϼ���
SELECT
    job ����, AVG(sal) �޿����
FROM
    emp
WHERE 
    deptno = 30
GROUP BY
    job
;
-- ���޺��� ��� ���� ��ȸ�ϼ���.
-- �� ������� 1���� ������ ��ȸ���� �����ϼ���
SELECT
    job ����, COUNT(*) �����
FROM
    emp
GROUP BY
    job
HAVING
--    COUNT(*) NOT IN (1)
    COUNT(*) <> 1
;
-- 81�⵵ �Ի��� ������� �޿� �հ踦 ���޺��� ��ȸ�ϼ���.
-- ��, ���޺� ��ձ޿��� 1000 �̸��� ������ ��ȸ���� �ʰ� �ϼ���.
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
    81�⵵ �Ի��� ������� �޿� �հ踦
    ������� �̸� ���̺��� �׷�ȭ�ϼ���.
    ��, �޿� �հ谡 2000�̸��� �׷��� ��ȸ���� �����ϼ���.
    �޿��հ谡 ���� �������� ��ȸ�ǰ� �ϼ���.
*/
SELECT
    LENGTH(ename) �̸�����, SUM(sal) �޿��հ�
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
    ������� �̸� ���̰� 4, 5������ ������� �μ��� ������� ��ȸ�ϼ���
    ��, ������� 0�� �μ��� ��ȸ���� �����ϼ���
    �μ���ȣ ���� �������� �����ϼ���.
*/
SELECT
    deptno �μ���ȣ, COUNT(*) �μ��������
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
    deptno �μ���ȣ, COUNT(*) �μ����
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
    ���� ]
        DECODE �Լ��� �׷��Լ��� ����
        
    �μ����� �޿��� ����ϴµ�
    10�� �μ��� �����
    20�� �μ��� �޿��հ踦
    30�� �μ��� �ִ�޿��� 
    ��ȸ�ϼ���
*/
SELECT
    deptno �μ���ȣ, DECODE(deptno, 10, TRUNC(AVG(sal), 2), 
                                    20, SUM(sal), 
                                    30, MAX(sal)) ���
FROM
    emp
GROUP BY
    deptno
;

--------------------------------------------------------------------------------
/*
    ��������(Sub Query, ������)
    ==> ���Ǹ�� ���� �ٽ� ���Ǹ���� ���Ե� �� �ִµ�
        �� ���Ե� ���Ǹ���� �������Ƕ� �Ѵ�.
        
        ���� ]
            �������Ǵ� ��� �������� ��밡���ѵ�..
            
            SELECT ���� ���Ե� �������Ǵ� 
            �ݵ�� ������, �����÷����� ����� ����������Ѵ�.
*/

-- SMITH ����� ���� �μ� ������� 
-- ����̸�, �μ���ȣ, ������ ��ȸ�ϼ���.
SELECT
    ename ����̸�, deptno �μ���ȣ, job ����
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
                ) ����
FROM
    emp
WHERE
    ename = 'KING'
;
-- SELECT ���� ���� ��������
-- �ݵ�� ������ �����÷����� ��ȸ�Ǿ�� �Ѵ�.
-- 'SMITH'�� ����̸�, ����, �μ���ȣ, �ҼӺμ���ձ޿��� ��ȸ�ϼ���.
SELECT
    ename ����̸�, 
    job ����, 
    deptno �μ���ȣ, 
    (
        SELECT
            AVG(sal)
        FROM
            emp
        GROUP BY
            deptno 
        HAVING
            deptno = e.deptno
    
     ) �ҼӺμ���ձ޿�
FROM
    emp e
WHERE
    ename = 'SMITH'
;

-- SMITH ����� �μ���ձ޿�
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
-- ������� ����̸�, �μ���ȣ, �μ��ִ�޿�, �μ����� �� ��ȸ�ϼ���.
SELECT
    e.ename ����̸�, 
    e.deptno �μ���ȣ, 
    (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            deptno = e.deptno
    ) �μ��ִ�޿�,
    (
        SELECT
            COUNT(*)
        FROM
            emp
        WHERE
            deptno = e.deptno
    ) �μ�����
    
FROM
    emp e
;

--------------------------------------------------------------------------------

-- ����� �� �ҼӺμ� ��ձ޿����� �޿��� ���� �������
-- ����̸�, �μ���ȣ, �μ���ձ޿��� ��ȸ�ϼ���.
SELECT
    e.ename ����̸�, 
    e.deptno �μ���ȣ, 
    (
    SELECT
        TRUNC(AVG(sal), 2)
    FROM
        emp
    WHERE
        deptno = e.deptno
    
    ) �μ���ձ޿�,
    e.sal �޿�
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















