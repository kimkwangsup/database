SELECT tname from tab; -- ���� ������ ������ ���̺� ��ȸ���

SELECT 'BLACK' || 'PINK' FROM DUAL;

-- tmp1 ���̺� 
CREATE TABLE tmp1(
    no NUMBER(2),
    name VARCHAR2(10 CHAR)
);

-- ������ �߰�
INSERT INTO
    tmp1
VALUES(
    1, '����'
);
INSERT INTO
    tmp1
VALUES(
    2, '����'
);
UPDATE
    tmp1
SET
    name = '����'
WHERE
    no = 2
;

INSERT INTO
    tmp1
VALUES(
    3, '����'
);

-- ���Ļ���
DELETE FROM tmp1 WHERE no = 3;

DROP TABLE tmp1;

-- scott ������ ������ emp ���̺��� �����ؼ� emp ���̺��� ���弼��
CREATE TABLE emp
AS
    SELECT
        *
    FROM
        scott.emp
;

SELECT tname FROM tab;

-- scott ������ dept ���̺� ��ȸ
SELECT
    *
FROM
    scott.dept
;

-- dept ���̺� ����
CREATE TABLE dept
AS
    SELECT
        *
    FROM
        scott.dept
;
CREATE TABLE salgrade
AS
    SELECT
        *
    FROM
        scott.salgrade
;
CREATE TABLE bonus
AS
    SELECT
        *
    FROM
        scott.bonus
;

-- ���� ] jennie ������ ����� emp, dept, salgrade ���̺� ���������� �߰��ϼ���


--------------------------------------------------------------------------------
-- hr ������ ������ employees ���̺� ��ȸ
SELECT
    *
FROM
    hr.employees
;

CREATE SYNONYM ep FOR hr.employees;

SELECT
    *
FROM
    ep
;

-- scott �������� �۾�
SELECT
    *
FROM
    EP
;

-- ���Ǿ� ����
DROP SYNONYM ep;
-- ���� ���Ǿ� ����

CREATE PUBLIC SYNONYM ep FOR hr.employees;
--------------------------------------------------------------------------------

-- 10��������� �����ȣ, ����̸�, �޿��� ��ȸ�ϴ� �� d10�� ���弼��.
CREATE VIEW d10
AS
    SELECT
        empno, ename, sal
    FROM  
        emp
    WHERE
        deptno = 10
;

-- �並 ���ؼ� ��ȸ
SELECT 
    *
FROM
    d10
;

-- MILLER �� �޿��� �並 ���ؼ� 1500���� �����غ���.
UPDATE 
    d10
SET
    sal = 1500
WHERE
    ename = 'MILLER'
;
select * from emp ;

-- ROLLBACK
ROLLBACK;

-- ���պ�
CREATE VIEW dCalc
AS
    SELECT
        deptno dno, SUM(sal) sum, TRUNC(AVG(sal),2) avg, MAX(sal) max, MIN(sal) min, COUNT(*) cnt
    FROM
        emp
    GROUP BY
        deptno
;

SELECT * FROM dCalc ;

-- �並 �̿��ؼ� ������� ����̸�, ����, �μ��޿��հ�, �μ���ձ޿�, �μ������� ��ȸ�ϼ���.
SELECT
    ename ����̸�, job ����, sum �μ��޿��հ�, avg �μ���ձ޿�, cnt �μ�����
FROM
    emp e, dCalc c
WHERE
    e.deptno = c.dno
;