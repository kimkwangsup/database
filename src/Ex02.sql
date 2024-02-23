/*
    1.
    �������
        ����̸�, �μ���ȣ
    �� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, deptno �μ���ȣ
FROM
    emp
;
/*
    2.
    ������� �μ���ȣ�� ��ȸ�ϼ���.
    ��, �ߺ��Ǵ� �μ���ȣ�� �ѹ��� ��ȸ�ǰ� �ϼ���.
*/
SELECT
    DISTINCT deptno
FROM
    emp
;
/*
    3.
    �������
        ����̸�, ����, ������ ��ȸ�ϼ���.
    ������ �޿� * 12�� ����ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal * 12 ����
FROM
    emp
;
/*
    4.
    ������� ����̸�, �޿�, Ŀ�̼�, ������ ��ȸ�ϼ���.
    ������ �޿� * 12 + Ŀ�̼����� ����ϼ���.
    Ŀ�̼��� ���� ����� Ŀ�̼��� 50�� �����ϴ� ������ ����ϼ���.
    NVL() �� ó���ϴ� ����  
*/
SELECT
    ename ����̸�, sal �޿�, NVL(comm , 50) Ŀ�̼�, sal * 12 + NVL(comm , 50) ���� 
FROM
    emp
;

SELECT
    ename ����̸�, sal �޿�, comm Ŀ�̼�, sal * 12 + NVL(comm , 50) ���� 
FROM
    emp
;
/*
    5.
    ������� �����ȣ, ����̸�, ������ ��ȸ�ϼ���.
    ����̸��� �̸� �ڿ� ' ���' �� �ٿ����� ��ȸ�ϼ���.
*/
SELECT
    empno �����ȣ, ename ||' ���' ����̸�, job ����
FROM
    emp
;
--------------------------------------------------------------------------------
/*
    6. 
    �μ���ȣ�� 20���� �������
    �����ȣ, ����̸�, ����, �μ���ȣ�� ��ȸ�ϼ���.    
*/
SELECT
    empno �����ȣ, ename ����̸�, job ����, deptno �μ���ȣ
FROM
    emp
WHERE
--    deptno = 20
    deptno NOT IN (10, 30, 40)
;
/*
    7. 
    ������ 'SALESMAN' �� �������
    ����̸�, ����, �μ���ȣ�� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, deptno �μ���ȣ
FROM
    emp
WHERE
    job = 'SALESMAN'
;
/*
    8. 
    �޿��� 1000 �̸��� �������
    �����ȣ, ����̸�, �޿��� ��ȸ�ϼ���.
*/
SELECT
    empno �����ȣ, ename ����̸�, sal �޿�
FROM
    emp
WHERE
    sal < 1000
;
/*
    9.
    �Ի����� 81�� 9�� 8���� �����
    ����̸�, ����, �Ի����� ��ȸ�ϼ���
*/
SELECT
    ename ����̸�, job ����, hiredate �Ի���
FROM
    emp
WHERE
    hiredate = '81/09/08'
;
/*
    10.
    ����� �̸��� 'M' ���� ���ڷ� �����ϴ� ����� 
    �޿��� 1000 �̻��� �����
    ����̸�, ����, �޿��� ��ȸ�ϼ���
*/
SELECT
    ename ����̸�, job ����, sal �޿�
FROM
    emp
WHERE
    ename >= 'N' 
    AND sal >= 1000
;
/*
    11.
    ������ 'MANAGER' �̰� �޿��� 1000���� ����
    �μ���ȣ�� 10���� �����
    ����̸�, ����, �޿�, �μ���ȣ�� ��ȸ�ϼ���
*/
SELECT
    ename ����̸�, job ����, sal �޿�, deptno �μ���ȣ
FROM
    emp
WHERE
    job = 'MANAGER'
    AND sal > 1000
    AND deptno = 10
;
/*
    12.
    ������ 'MANAGER' �� �ƴ� �������
    ����̸�, ����, �Ի����� ��ȸ�ϼ���.
    
    NOT ������ ����ؼ� ó���ϼ���
*/
SELECT
    ename ����̸�, job ����, hiredate �Ի���
FROM
    emp
WHERE
--    job NOT IN ('MANAGER') 
    NOT job = 'MANAGER'
;
/*
    13.
    ����̸��� 'C' �� �����ϴ� �ͺ��� ũ��
    'M' ���� �����ϴ� �ͺ��� ���� �����
    ����̸�, ����, �޿��� ��ȸ�ϼ���
    
    BETWEEN - AND ������ ����ϼ���
*/
SELECT
    ename ����̸�, job ����, sal �޿�
FROM
    emp
WHERE
    ename BETWEEN 'D' AND 'LZZZZZZZZZZZZZZZZZZZZZZZZZZ'
;
/*
    14.
    �޿��� 800, 950�� �ƴ� �������
    ����̸�, ����, �޿��� ��ȸ�ϼ���
    
    NOT IN ������ ����ؼ� ó���ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal �޿�
FROM
    emp
WHERE
    sal NOT IN(800, 950)
;
/*
    15.
    ����̸��� 'S' �� �����ϰ�
    �̸� ���ڼ��� 5������ �������
    ����̸�, ������ ��ȸ�ϼ���
*/
SELECT
    ename ����̸�, job ����
FROM
    emp
WHERE
    ename LIKE 'S____'
;
/*
    16.
    �Ի����� 3���� �������
    ����̸�, ����, �Ի����� ��ȸ�ϼ���
*/
SELECT
    ename ����̸�, job ����, hiredate �Ի���
FROM
    emp
WHERE
--    hiredate LIKE '%/__/03'
    hiredate LIKE '%/03'
;
/*
    17.
    ����̸��� 4���� �Ǵ� 5������ �������
    ����̸�, ����, �޿��� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, job ����, sal �޿�
FROM
    emp
WHERE
    ename LIKE '_____' 
    OR ename LIKE '____'
;
/*
    `8.
    �Ի�⵵�� 81�� �̰ų� 82���� �������
    ����̸�, �޿�, �Ի����� ��ȸ�ϼ���.
    ��, �޿��� ���� �޿����� 10% �λ�� �޿��� ��ȸ�ϼ���.
*/
SELECT
    ename ����̸�, sal * 1.1 �޿�, hiredate �Ի���
FROM
    emp
WHERE
    hiredate LIKE '81%' OR hiredate LIKE '82%'
;
/*
    19.
    �̸��� 'S' �� ������ �������
    ����̸�, �޿�, Ŀ�̼��� ��ȸ�ϼ���.
    ��, Ŀ�̼��� ���� Ŀ�̼Ǻ��� 100 ������ Ŀ�̼����� �ϰ�
    Ŀ�̼��� ���� ����� 50���� ��ȸ�ǰ� �ϼ���.
*/
SELECT
    ename ����̸�, sal �޿�, NVL(comm + 100 , 50) Ŀ�̼�
FROM
    emp
WHERE
    ename LIKE '%S'
;