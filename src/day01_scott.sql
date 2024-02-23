SELECT
    *
FROM
    emp
;
-- ����Ŭ ������ �ּ�
/*
    sqldeveloper ���� ����ϴ� ������ �ּ�
    ������ �ּ�ó��...
*/

/*
    �ڹٿ����� ���������� 
    ��� ���� �ǹ��ϴ� ���ڴ� * �� ����Ѵ�.
    
    ------------------------------------------
    sql ������ ���ɾ ��ҹ��ڸ� �������� �ʴ´�.
    ������ �����ʹ� ��ҹ��ڸ� �� ��������� �Ѵ�.
    
    �ڹٿ����� ���ڿ� ���ڿ��� ����������
    �����ͺ��̽������� �������� �ʴ´�.
    ǥ���� '' �� �̿��ؼ� ǥ���Ѵ�.
    
    ����Ŭ������ �ڹٿ� ����������
    ������ ������ ��ū(;)���� �����Ѵ�.
    
*/

SELECT 'abc' FROM DUAL;

SELECT 1 + 2 FROM DUAL;

-------------------------------------------------
/*
    ������ ��ȸ ����
    
    ���� ]
        SELECK 
            �÷��̸�1, �÷��̸�2, ...
        FROM
            ���̺��̸�
        [WHERE
         ���� ]
        [GROUP BY
            �׷� ����
        [HAVING
        ]]
        [ORDER BY
        ]
        ;
*/

-- ������� ����̸�, �޿��� ��ȸ�ϼ���.
SELECT 
    ename, sal
FROM
    emp -- ��� ���� ���̺�
;

/*
    ��ȸ�ϰų� �����ͺ��̽� �۾��� �ϴ� ����(����)���� 
    ������, ���Ǹ��� ��� �θ���.
*/

/*
    scott ������ �����ϴ� ���̺���
        
        emp         : ����������̺�
            empno       : �����ȣ
            ename       : ����̸�
            job         : ����
            mgr         : ����� �����ȣ
            hiredate    : �Ի���
            sal         : �޿�
            comm        : Ŀ�̼�
            deptno      : �μ���ȣ
        
        dept        : �μ��������̺�
        salgrade    : �޿�������̺�
        bonus       : ���ʽ����̺�
        
*/