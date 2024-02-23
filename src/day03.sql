/*
    NULL ������ ��
    ==> NULL �����ʹ� ��� ���꿡�� ���ܰ� �ȴ�.
        ���� ���ǽĿ��� ���� �� �����ڷ� �񱳸� �ϸ�
        ������ �ȵǹǷ�
        �񱳸� �Ϸ��� ������ ó���� �ʿ��ϴ�.
        
        ���� ]
            ����� ]
                �ʵ��̸�(�Ǵ� ������) IS NULL
            
            ������ ]
                �ʵ��̸�(�Ǵ� ������) IS NOT NULL
*/

-- ������� �����ȣ, �����̸�, �Ի���, �޿��� ��ȸ�ϼ���
SELECT
    empno �����ȣ, ename ����̸�, hiredate �Ի���, sal �޿�
FROM
    emp
WHERE
--    mgr = NULL 
-- NULL �����ʹ� ��� ���꿡�� ���ܰ� �ǹǷ� �񱳿����ڷ� ���� �� ����.
    mgr IS NULL
;

/*
    ���տ�����
    ==> �� �� �̻��� SELECT ���� ����� �̿��ؼ�
        �� ����� ������ ���� ���
        
        ���� ]
            
            UNION
            ==> �������� ����
                �ΰ��� ���� ����� ����� �ϳ��� ���ļ� ��ȸ�ϴ� ��.
                ��, �ߺ� �����ʹ� �ѹ��� ��ȸ.
           
            UNION ALL
            ==> �������� ����
                ��, �ߺ� �����͸� ������ ������ŭ ��ȸ
            
            INTERSECT
            ==> �������� ����
                ��ȸ ���� ����� ��� �߿��� ��� ���Ե� �����͸� ��ȸ
                
            MINUS
            ==> �������� ����
                ���� ���� ����� ������� ���� ���� ����� ����� 
                ������ ����� ��ȸ
                
        ���� ]
            �������� Ư¡
                1. �� ���� ��ɿ��� ���� ����� ���� �÷��� ������ ������ �Ѵ�.
                    
                    �� ]
                        SELECT
                            job, empno
                        FROM
                            emp       
                        UNION
                        SELECT
                            ename, deptno
                        FROM
                            emp
                        ;
                        
                2. �� ���� ��ɿ��� ���� ����� ���� ������ �ʵ忩�� �Ѵ�.
                    �� ��, ũ��� ������ �ʴ´�.
                    
                    ��]
                        SELECT
                            ename, sal
                        FROM
                            emp
                        UNION
                        SELECT
                            ename , job
                        FROM
                            emp
                        ;
                
*/

SELECT
    job, empno
FROM
    emp       
UNION
SELECT
    ename, deptno
FROM
    emp
;

SELECT
    ename, sal
FROM
    emp
UNION
SELECT
    comm || '' , job -- ������ ���°� �������� �������� ���� �߻�
FROM
    emp
;

-- �ǽ��غ�
-- ������ 'MANAGER' �� ������� ���̺�� �ٽ� �����
CREATE TABLE semp1
AS
    SELECT
        ename, job, sal, hiredate, deptno
    FROM
        emp
    WHERE
        job = 'MANAGER'
;    
-- ��� �̸��� �ټ� ������ ����鸸 ���̺�� �ٽ� �����
CREATE TABLE semp2
AS
    SELECT
        ename, job, sal, hiredate, deptno
    FROM
        emp
    WHERE
        ename LIKE '_____'
;

-- �޿��� 1500 ���� ū ������� ���̺�
CREATE TABLE semp3
AS
    SELECT
        ename, job, sal, hiredate, deptno
    FROM
        emp   
    WHERE
        sal > 1500
;

--------------------------------------------------------------------------------

-- semp2 ���̺�� semp3 ���̺��� ������ ���ļ� ��ȸ�ϼ���.
-- ==> ��� �̸��� �ټ������� ������� ������
--     �޿��� 1500 ���� ū ������� ������ ���ļ� ��ȸ�ϼ���.
SELECT
    *
FROM
    semp2
UNION
SELECT
    *
FROM
    semp3
;

-- �ߺ� �����͵� �״�� ��ȸ

SELECT
    *
FROM
    semp2
UNION ALL
SELECT
    *
FROM
    semp3
;

-- semp2 ���̺�� semp3 ���̺� ��� ���Ե� ����� ��ȸ�ϼ���
-- �̸� ���ڼ��� 5�����̰�, �޿��� 1500�� �Ѵ� ����� ��ȸ�ϼ���.

SELECT
    *
FROM
    semp2
INTERSECT
SELECT
    *
FROM
    semp3
;

-- �̸� ���ڼ��� 5������ ��� �� �޿��� 1500 ������ ����鸸 ��ȸ�ϼ���.

SELECT
    *
FROM
    semp2
MINUS
SELECT
    *
FROM
    semp3
;

/*
    ���� ]
        ���� ������ ����� ������ �� �ִ�.
        ���� ����� �Ϲ� ���� ��ɰ� �Ȱ��� ORDER BY ������ �����ϸ� �ȴ�.
        ���� ������ ����� �̿��ؼ� ������ �ϱ� ������
        ���� �������� �����ϴ� ���� ��Ģ�̴�.
*/

SELECT
    ename name, sal money, hiredate hadate
FROM
    semp2
UNION ALL
SELECT
    ename, sal, hiredate
FROM
    semp3
ORDER BY
    name DESC, money 
    -- �̸������� �������� ����
    -- �̸��� ������ �޿��� �̿��ؼ� �������� ����
;

SELECT
    ename name, sal money, hiredate hdate
FROM
    emp
WHERE
    LENGTH(ename) = 5
ORDER BY
    name, sal DESC
;

--------------------------------------------------------------------------------
/*
    �Լ�(FUNCTION)
    ==> �����͸� �����ϱ� ���ؼ� ����Ŭ�� �����ϴ� ���
        
        ���� ]
            DBMS �� �����ͺ��̽� �������� �ٸ���.
            Ư�� �Լ��� �� �ٸ���.
            
        ���� ] 
            1. ������ �Լ�
            ==> �� �� ������ �� ���� ����� �� �ִ� �Լ�
                ( ==> ������ �� ���� �־ ó���� �� �ִ� �Լ�)
                ���� ���� �� �Լ��� ó�� ����� �������� ������ �����ϴ�.
                
            2. �׷� �Լ�
            ==> ���� ���� ��Ƽ� �׷�ȭ �ؼ� ó���ϴ� �Լ�
                ���� ���� �� �������� ó���� �ȵǴ� �Լ�
                
            *****
            ���� ]
                ���� �� �Լ��� �׷� �Լ��� ����� ���� ����� �� ����.

--------------------------------------------------------------------------------
                
    ���� ]
        DUAL ���̺�
            ������ �Լ��� �������� ������ŭ �����Ѵ�.
            �����Ͱ� ���� �����ϴ� ���̺��� �׽�Ʈ�� �ϸ�
            ����� �������� ������ŭ ��ȸ�� �ȴ�.
            �̰��� �Ϲ� ���굵 ����������.
            �̷� �������� ���̱� ���ؼ� ����Ŭ�� �������ִ�
            �ӽ� ���̺�(�ǻ� ���̺�)�� DUAL ���̺��̴�.
            
            �� ���̺��� �� �����θ� �����Ǿ��ִ�.
            ���� ������ �Լ��� ���� ����� �� ������ ��ȸ�� �ȴ�.
            
--------------------------------------------------------------------------------

        1. ������ �Լ�
            
            ����Ŭ���� ���� ����ϴ� �������� ���´� �������� �ִ�.
            
            NUMBER              : ����
            CHAR || VARCHAR2    : ����
                CHAR     : ���������� ����Ÿ��
                VARCHAR2 : ���������� ����Ÿ��
                
            DATE                : ��¥ & �ð�
           
           
            ����ȯ �Լ� ]
            
                  TO_CHAR()         TO_CHAR() 
                ------------->      <-------------
            ����               ����               ��¥
                <-------------      ------------->
                  TO_NUMBER()       TO_DATE()
                  
                <------------------------------>  
                               X
            
            1) ���� �Լ�
            ==> �����Ͱ� ������ ��쿡�� ����� �� �ִ� �Լ�
                
                ABS()     : ���밪�� ��ȯ���ִ� �Լ�
                            ABS(���ڵ����� �Ǵ� �����)
                
                FLOOR()   : �Ҽ��� ���ϸ� ������ �Լ�(������ ������ִ� �Լ�)
                            FLOOR(���ڵ����� �Ǵ� �����)
                
                ROUND()   : ������ �ڸ������� �ݿø� ���ִ� �Լ�
                            ROUND(���ڵ�����[, ������ �ڸ���])
                            �ڸ����� ������ �����ϸ� 
                            �Ҽ��� �̻� �ش� �ڸ������� �ݿø��Ѵ�.
                
                TRUNC()   : FLOOR() �Լ��� ���������� �����ϴ� �Լ�
                            �������� ������ �ڸ����� ������ �� �� �ִ�.
                            TRUNC(���ڵ�����[, �ڸ���])
                            
                MOD()     : ������ ���ϴ� �Լ�
                            MOD(����1, ����2)
                            ==> ����1 �� ����2 �� ���� �������� ��ȯ
    
        ���� ]
            ��� �Լ��� SELECT ������ ��� �����ϰ�
            WHERE ��(������) ���� ��� �����ϴ�.
                
                
            2) ��¥ �Լ�
            
            3) ���� �Լ�
                
                LOWER()     : �ҹ��ڷ� �ٲ��ִ� �Լ�
                
                UPPER()     : �빮�ڷ� �ٲ��ִ� �Լ�
                
                INITCAP()   : ù���ڴ� �빮�ڷ�, �������� �ҹ��ڷ� ��ȯ���ִ� �Լ�
                
                LENGTH() / LENGTHB() : ���ڿ��� ���̸� ��ȯ���ִ� �Լ�
                                       B�� ���� �Լ����� byte ������ ó�����ִ� �Լ�
            
                CONCAT()    : �� ���� ���ڿ��� ���ļ� ��ȯ���ִ� �Լ�
                
                    ���� ]
                        CONCAT(������1, ������2)
                        
                    ���� ]
                        �ԷµǴ� ������ �� �Ѱ��� ���� �����͸� ������ �����ϴ�.
                SUBSTR() / SUBSTRB() : ���ڿ� �� Ư�� �κ��� ���ڿ��� 
                                       �����ؼ� ��ȯ���ִ� �Լ�
                    
                    ���� ]
                        SUBSTR(������, ������ġ, ����)
                    
                    ***    
                    ���� ]
                        �����ͺ��̽������� ��ġ���� 1 ���� �����Ѵ�.
                    
                    ������ ������ �� �ִ�.    
                    �����ϸ� �� �ڱ��� ��� �����ؼ� ��ȯ���ش�.
                    
                    ���� ]
                        ��ġ���� ������ ����� �� �ִ�.
                        �� ���� �� �ڿ��� ������ ��ġ�� �ǹ��Ѵ�.
                
                INSTR() / INSTRB()
                ==> ���ڿ� �߿��� ���ϴ� ���ڿ��� ��ġ���� ��ȯ���ִ� �Լ�
                    
                    ���� ]
                    INSTR(������, ã�� ���ڿ�[, ������ġ, ����Ƚ��])
                
                    ���� ]
                        ���� ��ġ�� ������ ����� �� �ִ�.
                        ������ ����ϰ� �Ǹ� �ڿ��� ������ ��ġ�� �ǹ��Ѵ�.
                        �׷��� �˻� ���⵵ �ڿ��� ���� ã�� �����Ѵ�.
                    
                    ���� ]
                        ã�� ���ڰ� ������ 0 �� ��ȯ���ش�.
                
                LPAD() / RPAD()
                ==> ���ڿ��� ���̸� �������ְ�
                    ���� ������ ������ ���ڸ� ���ڵ�� ä���ִ� �Լ�
                    ���ʿ� ä��� LPAD()
                    �����ʿ� ä��� RPAD()
                    
                    ���� ]
                        LPAD(������, ����, ä�� ����)
*/  

SELECT
    75146169854*69856846945614 ���
FROM
    dual
;

-- ABS()
SELECT 
    ABS(2412-8949) ABS 
FROM 
    DUAL
;

-- FLOOR()
SELECT
    FLOOR(3.141592) FLOOR
FROM
    DUAL
;

-- ROUND()
SELECT
    ROUND(3.541592, 4) ROUND
FROM
    DUAL
;

-- ������� �޿��� 10�������� �ݿø��ؼ� ����̸�, �޿��� ��ȸ�ϼ���
SELECT
    ename ����̸�, ROUND(sal, -2) �λ�޿�
FROM
    emp
;

-- TRUNC()
SELECT
    TRUNC(3.541592, 4) TRUNC
FROM
    DUAL
;

SELECT
    ename ����̸�, sal - TRUNC(sal, -3) �ű޿�
FROM
    emp
;

--  �޿��� ¦���� ������� ��� �̸�, �޿��� ��ȸ�ϼ���
SELECT
    ename ����̸�, sal �޿�
FROM
    emp
WHERE
    MOD(sal, 2) = 0
;

-- ������� �޿��� ������� ¦���� ����鸸 ��ȸ�ϼ���.
-- ����̸�, �޿�
SELECT
    ename ����̸�, sal �޿�
FROM
    emp
WHERE
    MOD(TRUNC(sal, -2), 200) = 0
;

-- ������� �̸��� �ҹ���, �빮��, ù���ڸ� �빮�ڷ� ��ȸ�ϼ���
SELECT
    ename ����̸�, 
    LOWER(ename) �ҹ���, 
    UPPER(LOWER(ename)) �빮��, 
    INITCAP(ename) ù���ڸ��빮��,
    INITCAP(ename || ' ' || job) �ܾ�ù���ڸ��빮��
FROM
    emp
;

SELECT
    LENGTH('����') "���� ���� ��", 
    LENGTHB('����') "���� ����Ʈ ��"
FROM
    dual
;

SELECT
    CONCAT(1, 2) SOO1,
    1 || 2 SOO2
FROM
    dual
;

SELECT
    ename, 
    SUBSTR(ename, -2, 1) "�ڿ��� �ι�° ����", 
    SUBSTR(ename, -2) "������ �α���"
FROM
    emp
;

-- SUBSTRB()
SELECT
    SUBSTRB('����', 2), LENGTHB(SUBSTRB('����', 2))
FROM
    dual
;

-- INSTR()
SELECT
    INSTR('JENNIE JENNIE', 'N', 2), 
    INSTR('JENNIE JENNIE', 'N', 2, 3),
    INSTR('JENNIE', 'N', -2, 2)
FROM
    dual
;

-- ����� �� �̸��� 'M' ���ڰ� ���Ե��� �ʴ� ������� 
-- ����̸�, ������ ��ȸ�ϼ���.
SELECT
    ename ����̸�, job ����
FROM
    emp
WHERE
    INSTR(ename, 'M') = 0
;

-- ����� �� �̸��� 'M' ���ڰ� ���Ե� ������� 
-- ����̸�, �޿��� ��ȸ�ϼ���.
SELECT
    ename ����̸�, sal �޿�
FROM
    emp
WHERE
    NOT INSTR(ename, 'M') = 0
;

-- ������� �̸��� ó�� �α��ڸ� �����ϼ���
-- ������ ���ڸ� �����ڷ� ����� ���� �κ��� "*"�� ä���ּ���
SELECT
    ename ����̸�, 
    SUBSTR(ename, 1, 2) �����ѹ���,
    LPAD(SUBSTR(ename, 1, 2), 10, '*') �������̸�,
    RPAD(
        SUBSTR(ename, 1, 2), 
        LENGTH(ename), 
        '#'
    ) ä���̸�    
FROM
    emp
;

-- ���� ] 'jennie@human.com' ������ ���̵��� ù��° ���ڿ� ����° ���ڴ� ����, �������� '*'�� '@' ����
-- �������� ����° ���ڴ� ����
-- .com �� ��������
SELECT
/*
    SUBSTR('jennie@human.com', 1, 1) A,
    SUBSTR('jennie@human.com', 3, 1) B,
    SUBSTR('jennie@human.com', (INSTR('jennie@human.com', '@')), 1) C,
    SUBSTR('jennie@human.com', (INSTR('jennie@human.com', '@')+ 3), 1) D,
    SUBSTR('jennie@human.com', (INSTR('jennie@human.com', '.'))) E,
    RPAD(SUBSTR('jennie@human.com', 1, 1), 2, '*') F,
    CONCAT(RPAD(SUBSTR('jennie@human.com', 1, 1), 2, '*'), SUBSTR('jennie@human.com', 3, 1)) G,
    RPAD((CONCAT(RPAD(SUBSTR('jennie@human.com', 1, 1), 2, '*'), SUBSTR('jennie@human.com', 3, 1))), (INSTR('jennie@human.com', '@') - 1), '*') H,
    CONCAT((RPAD((CONCAT(RPAD(SUBSTR('jennie@human.com', 1, 1), 2, '*'), SUBSTR('jennie@human.com', 3, 1))), (INSTR('jennie@human.com', '@') - 1), '*'))
           , SUBSTR('jennie@human.com', (INSTR('jennie@human.com', '@')), 1)) A1,
    RPAD((CONCAT((RPAD((CONCAT(RPAD(SUBSTR('jennie@human.com', 1, 1), 2, '*'), SUBSTR('jennie@human.com', 3, 1))), (INSTR('jennie@human.com', '@') - 1), '*'))
           , SUBSTR('jennie@human.com', (INSTR('jennie@human.com', '@')), 1))), (INSTR('jennie@human.com', '@')+ 2), '*') B1,
    CONCAT(( RPAD((CONCAT((RPAD((CONCAT(RPAD(SUBSTR('jennie@human.com', 1, 1), 2, '*'), SUBSTR('jennie@human.com', 3, 1))), (INSTR('jennie@human.com', '@') - 1), '*'))
           , SUBSTR('jennie@human.com', (INSTR('jennie@human.com', '@')), 1))), (INSTR('jennie@human.com', '@')+ 2), '*')), 
           SUBSTR('jennie@human.com', (INSTR('jennie@human.com', '@')+ 3), 1)) C1,
    RPAD(( CONCAT(( RPAD((CONCAT((RPAD((CONCAT(RPAD(SUBSTR('jennie@human.com', 1, 1), 2, '*'), SUBSTR('jennie@human.com', 3, 1))), (INSTR('jennie@human.com', '@') - 1), '*'))
           , SUBSTR('jennie@human.com', (INSTR('jennie@human.com', '@')), 1))), (INSTR('jennie@human.com', '@')+ 2), '*')), 
           SUBSTR('jennie@human.com', (INSTR('jennie@human.com', '@')+ 3), 1))), (INSTR('jennie@human.com', '.') - 1), '*') D1,
*/    
    CONCAT((RPAD((CONCAT(( RPAD((CONCAT((RPAD((CONCAT(RPAD(SUBSTR('jennie@human.com', 1, 1), 2, '*'), 
           SUBSTR('jennie@human.com', 3, 1))), (INSTR('jennie@human.com', '@') - 1), '*')), 
           SUBSTR('jennie@human.com', (INSTR('jennie@human.com', '@')), 1))), (INSTR('jennie@human.com', '@')+ 2), '*')), 
           SUBSTR('jennie@human.com', (INSTR('jennie@human.com', '@')+ 3), 1))), (INSTR('jennie@human.com', '.') - 1), '*')), 
           SUBSTR('jennie@human.com', -4)) RESULT
FROM
    dual
;
/*
    ������� �̸��� ���̰� 5���� ������ �������
    ����̸�, ����, �μ���ȣ�� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, deptno �μ���ȣ
FROM
    emp
WHERE
    LENGTH(ename) <= 5
;
/*
    ������� ����̸�, ����, �޿��� ��ȸ�ϴµ�
    ����̸� �տ��� 'Mr.'�� �ٿ��� ��ȸ�ϼ���.
*/
SELECT
    CONCAT('Mr.', ename) ����̸�, job ����, sal �޿�
FROM
    emp
;
/*
    ����� �� �̸��� 'N'���� ������ �������
        ����̸�, ����ȣ(MGR), ������ ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, mgr ����ȣ, job ����
FROM
    emp
WHERE
--    SUBSTR(ename, -1) = 'N'
    ename LIKE '%N'    
;
/*
    �������
        ����̸�, ����, �Ի���
    �� ��ȸ�ϼ���.
    �̸��� �� 2���ڸ� ���̰� ������ ���ڴ� '#'���� ���̰� ��ȸ�ϼ���.
*/
SELECT
    LPAD(SUBSTR(ename, -2), LENGTH(ename), '#') ����̸�, job ����, hiredate �Ի���
FROM
    emp
;
/*
    ���� ó���Լ��� �̿��ؼ� ó���ϼ���.
    
    ������� 
        ����̸�, �޿�, Ŀ�̼�
    �� ��ȸ�ϼ���.
    Ŀ�̼��� 27% �λ�� �ݾ����� ��ȸ�ǰ� �ϰ�
    Ŀ�̼��� ���� ����� 100���� 27% �λ�� �ݾ����� ��ȸ�ϼ���.
    ��, Ŀ�̼��� ���� ������ �Ҽ��� �̻� 2��° �ڸ����� �ݿø��ؼ� ��ȸ�ǰ� �ϼ���.
*/
SELECT
    ename ����̸�, sal �޿�, NVL(ROUND((comm * 1.27), -2), ROUND(100 * 1.27, -2)) Ŀ�̼� 
FROM
    emp
;
/*
    �������
        �����ȣ, ����̸�, �޿�
    �� ��ȸ�ϼ���.
    ���޾��� �޿� + Ŀ�̼����� �ϰ�
    ��, �Ҽ��� �̻� ù��° �ڸ����� ������ ���ڷ� �޿��� ��ȸ�ϼ���.
    Ŀ�̼��� ���� ����� 0���� ����ϰ� ����ؼ� ��ȸ�ϼ���.
*/
SELECT
    empno �����ȣ, ename ����̸�, sal �޿�, TRUNC(sal + NVL(comm, 0), -1) ���޾�
FROM
    emp
;
/*
    ����� �� �޿��� 100���� ������ �������� ������� 
        ����̸�, ����, �޿�
    �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal �޿�
FROM
    emp
WHERE
    MOD(sal, 100) = 0
;
/*
    �������
        �����ȣ, ����̸�, �̸���
    �� ��ȸ�ϼ���
    �̸�����
        ����̸�@human.com
    �� �������� �ϰ� �̶� ��� �̸��� ��� �ҹ��ڷ� �Ѵ�.
    �̸��� ǥ�� ������
        �̸��� ����° ���ڴ� ����
        @ ����
        �������� 2��° ���� ����
        .com ����
    ������ ���ڴ� * �� ���̰� �Ѵ�.
*/
SELECT
    empno �����ȣ, 
    ename ����̸�, 
    CONCAT(LOWER(ename), '@human.com') �̸���,

    SUBSTR(LOWER(ename), 3, 1) ����°,
    LPAD(SUBSTR(LOWER(ename), 3, 1), 3, '*') ����°A,
    RPAD(LPAD(SUBSTR(LOWER(ename), 3, 1), 3, '*'), LENGTH(ename), '*') ����̾�,
    CONCAT((RPAD(LPAD(SUBSTR(LOWER(ename), 3, 1), 3, '*'), LENGTH(ename), '*')), '@') ����̱���,
    SUBSTR('human.com', 2, 1) �����ει�°����,
    LPAD((SUBSTR('human.com', 2, 1)), 2, '*') �����ει�°A,
    INSTR((CONCAT(LOWER(ename), '@human.com')), '.') ������ġ,
    SUBSTR((CONCAT(LOWER(ename), '@human.com')), ( INSTR((CONCAT(LOWER(ename), '@human.com')), '.'))) ����,
    RPAD((LPAD((SUBSTR('human.com', 2, 1)), 2, '*')), INSTR('human.com', '.') - 1, '*') �����ει�°B,
    CONCAT((RPAD((LPAD((SUBSTR('human.com', 2, 1)), 2, '*')), INSTR('human.com', '.') - 1, '*')), 
            SUBSTR((CONCAT(LOWER(ename), '@human.com')), ( INSTR((CONCAT(LOWER(ename), '@human.com')), '.')))) ���ĳ�,
           
    CONCAT((CONCAT((RPAD(LPAD(SUBSTR(LOWER(ename), 3, 1), 3, '*'), LENGTH(ename), '*')), '@')), (CONCAT((RPAD((LPAD((SUBSTR('human.com', 2, 1)), 2, '*')), INSTR('human.com', '.') - 1, '*')), 
            SUBSTR((CONCAT(LOWER(ename), '@human.com')), (INSTR((CONCAT(LOWER(ename), '@human.com')), '.')))))) �������̸���
    
FROM
    emp
;


SELECT
    eno, name, mail,
    SUBSTR(mail, 3, 1) ����°,
    LPAD((SUBSTR(mail, 3, 1)), 3, '*') ������,
    RPAD((LPAD((SUBSTR(mail, 3, 1)), 3, '*')), INSTR(mail, '@') - 1, '*') ��,
    CONCAT((RPAD((LPAD((SUBSTR(mail, 3, 1)), 3, '*')), INSTR(mail, '@') - 1, '*')), '@') �����
FROM
    (
        SELECT
            empno eno, ename name, CONCAT(CONCAT(LOWER(ename), '@'), 'human.com') mail
        FROM
            emp
    )
;