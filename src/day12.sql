/*
    �ε���(Index)
    ==> �˻� �ӵ��� ������ �ϱ� ���ؼ� B-Tree ������� 
        ������ ���� ��ȸ �ӵ��� ������ ����Ű���� �ϴ� ��.
        
        ���� ]
            �ε����� ����� �ȵǴ� ���
                1. ������ ���� ���� ���� ������ �ӵ��� ��������.
                    �ý��ۿ� ���� �޶�������
                    �ּ� 10�� ���� �̻��� �����Ͱ� �ִ� ��� 
                    �ӵ� ����� ȿ���� �߻��Ѵ�.
            
                2. ������ ������� ����� ��� ������ �ӵ��� ��������.
                    <== �����Ͱ� �Է� �� ������
                        ����ؼ� �ε����� ������ �ؾ��ϹǷ� ������ �ӵ��� ��������.
                        
            �ε����� ����� ȿ������ ���
                
                1. JOIN � ���� ���Ǵ� �÷��� �����ϴ� ���
                2. NULL �����Ͱ� ���� �����ϴ� ���
                3. WHERE �������� ���� ���Ǵ� �÷��� �ִ� ���
                
            ���� ]
                ����Ŭ�� ���
                �⺻Ű�� ����Ű ���������� �߰��ϸ�
                �ڵ������� �ε����� �����ȴ�.
                
        �ε��� �����
            
            ���� 1 ]
            ==> �Ϲ� �ε����� ����� ����(NON UNIQUE �ε���)
            
                CREATE INDEX �ε����̸�
                ON
                    ���̺��̸�(�÷��̸�);
                    
                �� ]
                    CREATE INDEX name_idx
                    ON
                        emp(ename);
                    
                ==> ����� �̸��� �̿��ؼ� ������ ����� �ּ���.
                    �̸����� �˻��ϴ� ��� �ӵ��� ��������.
                    
                ���� ]
                    �Ϲ� �ε����� �����Ͱ� �ߺ��Ǿ ����� ����.
                    
            ���� 2 ]
            ==> UNIQUE INDEX ����� ���
                �ε����� ����� �����Ͱ� �ݵ�� �����ϴٴ� ������ �־�� �Ѵ�.
                
                CREATE UNIQUE INDEX �ε����̸�
                ON 
                    ���̺��̸�(�÷��̸�);
                
                ���� ]
                    ������ �÷��� �ݵ�� �Ӽ����� �����ϴٴ� ������ �־�� �Ѵ�.
                    
                ���� ]
                    �Ϲ� �ε������� �˻��ӵ��� ���� ������.
                    <== �����˻��� ����ϱ� �����̴�.
                    
            ���� 3 ]
            ==> �����ε���
                �������� �÷��� �̿��ؼ� �ϳ��� �ε����� ����� �۾�
                �̶� ������������ �������� �÷��� ������ ����� �ݵ�� �����ؾ� �Ѵ�.
                
                ���� ]
                    CREATE UNIQUE INDEX �ε����̸�
                    ON  
                        ���̺��̸�(�÷��̸�1, �÷��̸�2, ...);
                        
                ==> �ϳ��� �ʵ常 ������� ����ũ �ε����� ������ ���ϴ� ���
                    �������� �÷��� �����ؼ� ����ũ �ε����� ���� ����ϴ� ���
                
                
                ���� ]
                ==> ����Ű, ����Ű
                    : ���̺��� �⺻Ű�� �Ѱ��� ���� �� �ִ�.
                        �׷��� �⺻Ű�� ���̺� ����  �����͸� Ư���� �� �ִ� �������
                        ���� �⺻������ �߰��ȴ�.
                        �׷��� �ϳ��� �÷��� �Ӽ������� �⺻Ű�� ������ �� ���� ������
                        �������� �÷��� �����ؼ� �⺻Ű�� �ο��� �� �ִ�.
                        �̶� �� ���������� �⺻Ű�������ǿ� �ش��ϰ�
                        ����ϴ� �÷��� �������� �ȴ�.
                        
                        ���� ]
                            CREATE TABLE ���̺��̸�(
                                �÷��̸�1 Ÿ��(����),
                                �÷��̸�2 Ÿ��(����),
                                �÷��̸�3 Ÿ��(����),
                                ...
                                CONSTRAINT ���������̸� PRIMARY KEY(�÷��̸�1, �÷��̸�2, ...)
                                ...
                            );
                            ==> �� �÷��� �Ӽ����� �ߺ��Ǿ ���������            
                                ����Ű�� ������ �÷����� ������ �ߺ��Ǹ� �ȵȴ�.
             ���� 4 ]
             => ��Ʈ �ε���
                : �ַ� �÷��� �����ͻ� ������(������)�� ������ �Ǿ��ִ� ���
                    ���� ���Ǵ� �ε���
                    �� ]
                        ����, ��������, �μ���ȣ, ������, �г�
                     
                ==> ���������� �����͸� �̿��ؼ� �ε����� ���� ����ϴ� ���
                
                ���� ]
                    CREATE BITMAP INDEX �ε����̸�
                    ON
                        ���̺��̸�(�÷��̸�);
                               
*/
-- SALGRADE ���̺� �⺻Ű �������ǰ� UNIQUE �ε����� �߰��ϼ���.
-- �⺻Ű ��������
ALTER TABLE salgrade
ADD CONSTRAINT SALGRADE_GRADE_PK PRIMARY KEY(grade);

-- INDEX �߰�
CREATE UNIQUE INDEX hisalidx
ON
    salgrade(hisal);
    
CREATE UNIQUE INDEX losalidx
ON
    salgrade(losal);

-- emp ���̺��� deptno �� ����Ű �������� �߰�

-- dept �⺻Ű �������� �߰�
ALTER TABLE dept
ADD CONSTRAINT DEPT_DNO_PK PRIMARY KEY(deptno);

-- emp.deptno �� üũ������� �߰�
ALTER TABLE emp
ADD CONSTRAINT EMP_DNO_CK CHECK(deptno IN(10, 20, 30, 40));

ALTER TABLE emp
ADD CONSTRAINT EMP_DNO_FK FOREIGN KEY(deptno) REFERENCES dept(deptno);

-- ��Ʈ���ε��� �߰�
-- ����������̺� ���ް� �μ���ȣ�� �̿��ؼ� ��Ʈ���ε����� ���� �߰��ϼ���.
/*
CREATE BITMAP INDEX jobBidx
ON
    emp(job);
    
CREATE BITMAP INDEX dnoBidx
ON
    emp(deptno);
*/

-- �����ε��� �߰�
-- �μ��������̺��� �μ��̸��� �μ���ġ�� �̿��ؼ� �����ε����� �߰��ϼ���.
CREATE UNIQUE INDEX dinfoidx
ON
    dept(dname,loc);

--------------------------------------------------------------------------------
/*
    Ʈ����(Trigger)
    ==> DML ���Ǹ���� �����ϸ�
        �ڵ������� �ش� ��� �ܿ� �ٸ� ����� ����ǵ��� �ϴ� ���α׷��� ����
        
        �� ]
            ȸ�������� ȸ���� Ż���ϴ� ���� �Ϲ������� ������̺� �ش� ȸ���� ������
            �̵� ���ѳ��´�.
            �� �۾���
                DELETE ����� ����Ǹ� 
                ������̺� �ش� ������ INSERT �ϴ� �۾��� ����ǰ�
                �� �Ŀ� ȸ���������̺��� �ش� ȸ���� ������ �����ϴ� DELETE ����� ����ȴ�.
                
        ���� ]
            CREATE OR REPLACE TRIGGER Ʈ�����̸�
                BEFORE [ �Ǵ� AFTER ] INSERT [ �Ǵ� UPDATE �Ǵ� DELETE ]
                -- BEFORE [ �Ǵ� AFTER ] : ���Ŀ� ����� DML ����� ����Ǳ� �� �Ǵ� �Ŀ� 
                                            Ʈ������ ������ ���������� �����ϴ� �κ�
                -- INSERT [ �Ǵ� UPDATE �Ǵ� DELETE ] : ������ ON ���� ����� ���̺� �����
                                                        DML ����� ���ϴ� �κ�
            
            ON
                ���̺��̸�
                
            [ FOR EACH ROW ]
            ==> �����ϸ� DML ����� ������ ���� Ʈ���Ÿ� �����Ѵ�.
                ==> DML ����� �Ѱ��� �����Ǵ� �������� ����� ������� Ʈ���Ÿ� �ѹ��� ����
                
                ����ϸ� DML ����� ����� ������ �� �� ��ŭ Ʈ���Ű� ����ȴ�.
            [ WHEN 
                ���ǽ�
            ] ==> Ʈ���Ű� �߻��ϴ� ������ ����ϴ� �κ�
                �� ]
                    WHEN
                        deptno = 10
                    ==> �μ���ȣ�� 10���� ������� ������ �����Ǹ� Ʈ���Ÿ� �����Ѵ�.
            BEGIN
                Ʈ���ſ��� ó���� ���Ǹ��
            END;
            /
            
        ���� ]
            Ʈ���Ű� �߻��ϸ� �ڵ������� �ΰ��� ������ ��������� �ȴ�.
            
            :OLD    : ���� �����͸� ����ϴ� ����
            :NEW    : ���� �����͸� ����ϴ� ����
            
            ==> UPDATE ����� �����ϸ� 
                    :OLD �� :NEW ������ �����������
                    
                INSERT ����� ���
                    :NEW ������ ��밡��
                    
                DELETE ����� ���
                    :OLD ������ ��밡��
                    
        ���� ]
            Ʈ���� �������� COMMIT, ROLLBACK �� �� ����.
            
*/      
-- BEMP ���̺��� EMP���̺��� ������ ������ �����ؼ� ������. �׸��� ����� �÷��� �߰��غ���
CREATE TABLE bemp
AS
    SELECT
        e.*, SYSDATE firedate
    FROM
        emp e   
    WHERE
        1 = 2
;
select * from bemp;

-- emp ���̺��� �����ͱ��� �����ؼ� temp ���̺��� ������.
CREATE TABLE temp
AS
    SELECT
        *
    FROM
        emp
;

-- ȸ����ȣ�� �˷��ָ� �ش�ȸ���� ������ bemp ���̺� �����ϴ� ���Ǹ��
INSERT INTO
    bemp
SELECT
    empno, ename, job, mgr, hiredate, sal, comm, deptno, TO_DATE(TO_CHAR(sysdate + 1, 'YYYY/MM/DD'))
FROM    
    temp
WHERE
    empno = 7839
;

ALTER TABLE bemp
ADD CONSTRAINT BMP_NO_PK PRIMARY KEY(empno);

ALTER TABLE temp
ADD CONSTRAINT BTMP_NO_PK PRIMARY KEY(empno);

TRUNCATE TABLE bemp;

INSERT INTO 
    bemp
VALUES(
    :OLD.empno, :OLd.ename, :OLd.job, :OLd.mgr, :OLd.hiredate, :OLd.sal, :OLd.comm, :OLd.deptno, TO_DATE(TO_CHAR(sysdate + 1, 'YYYY/MM/DD'))
);

-- temp ���̺��� ����� ����ϸ� bemp ���̺� ����� ������ ����ϴ� Ʈ���Ÿ� �����ϼ���.
CREATE OR REPLACE TRIGGER backupEmp
    BEFORE DELETE
ON 
    temp
FOR EACH ROW
BEGIN
    INSERT INTO 
        bemp
    VALUES(
        :OLD.empno, :OLd.ename, :OLd.job, :OLd.mgr, :OLd.hiredate, :OLd.sal, :OLd.comm, :OLd.deptno, TO_DATE(TO_CHAR(sysdate + 1, 'YYYY/MM/DD'))
    );
     
    DBMS_OUTPUT.PUT_LINE(:OLD.ENAME || ' ����� ����߽��ϴ�. ');
END
;
/
--------------------------------------------------------------------------------
-- SMITH ����� ��� ó���ϼ���.
TRUNCATE TABLE bemp;
DELETE FROM
    temp
WHERE
    empno = 7369
;
INSERT INTO temp
    SELECT
        *
    FROM
        emp
    WHERE
        empno = 7369   
;

set SERVEROUTPUT on;
commit;

DELETE FROM
    temp
WHERE
    empno = 7369
;

rollback;
--------------------------------------------------------------------------------

-- ����� �Ի��ϸ� ����� ���� ���� �޿��� ����� ���̺� 
-- �ش� ����� ������ �߰��ǵ���
-- Ʈ���Ÿ� �ۼ��ϰ� �����ϼ���.
-- ������� �����޿����̺�
CREATE TABLE sumsal(
    eno NUMBER(7,2)
        CONSTRAINT SSAL_NO_PK PRIMARY KEY,
    hap NUMBER(9,2) DEFAULT 0 -- �����޿� �ʱⰪ
        CONSTRAINT SSAL_HAP_NN NOT NULL,
    udate DATE DEFAULT SYSDATE
        CONSTRAINT SSAL_DATE_NN NOT NULL
);

-- Ʈ���Ż���
CREATE OR REPLACE TRIGGER salUp
    AFTER INSERT
ON
    temp
FOR EACH ROW
BEGIN
    INSERT INTO
        sumsal(eno)
    VALUES(
        :NEW.empno
    );
    DBMS_OUTPUT.PUT_LINE(:NEW.ename || '����� �Ի��߽��ϴ�.');
END;
/
/*
    CHOPPA �����
        �����ȣ 8000
        �̸� : CHOPPA
        ���� : DOCTOR
        ����ȣ : 7839
        �Ի��� : ����0��0��
        �޿� : 1000
        Ŀ�̼� : ����
        �μ���ȣ : 40
        
    ���� �߰��ϼ���
*/
INSERT INTO
    temp
VALUES(
    8000, 'CHOPPA', 'DOCTOR', 7839, TO_DATE(TO_CHAR(SYSDATE, 'YYYY/MM/DD')), 1000, NULL, 40
);

INSERT INTO
    temp
VALUES(
    8001, 'BOA HANKOK', 'DUMOK', 8000, TO_DATE(TO_CHAR(SYSDATE, 'YYYY/MM/DD')), 1500, 1000, 40
);
ALTER TABLE temp
ADD CONSTRAINT BTMP_NAME_UK UNIQUE(ename)
;
ALTER TABLE temp
ADD CONSTRAINT BTMP_NAME_NN NOT NULL(ename)
;
ALTER TABLE emp
ADD CONSTRAINT JEMP_NO_PK PRIMARY KEY(empno);

ALTER TABLE emp
ADD CONSTRAINT JNAME_NAME_UK UNIQUE(ename);

ALTER TABLE emp
MODIFY ename VARCHAR2(10 BYTE) CONSTRAINT JEMP_NAME_NN NOT NULL;

ALTER TABLE emp
MODIFY job VARCHAR2(9 BYTE) CONSTRAINT JEMP_JOB_NN NOT NULL;

ALTER TABLE emp
MODIFY hiredate DATE DEFAULT SYSDATE
    CONSTRAINT JEMP_DATE_NN NOT NULL;

ALTER TABLE emp
MODIFY sal NUMBER(7,2)
    CONSTRAINT JEMP_SAL_NN NOT NULL;
    
ALTER TABLE emp
MODIFY deptno NUMBER(2,0)
    CONSTRAINT JEMP_DNO_NN NOT NULL;

ALTER TABLE emp
ADD CONSTRAINT JEMP_DNO_FK FOREIGN KEY(deptno) REFERENCES dept(deptno);

ALTER TABLE emp
MODIFY mgr NUMBER(4,0)
    CONSTRAINT JEMP_MGR_NN NOT NULL;
    
ALTER TABLE dept
MODIFY dname VARCHAR2(14 BYTE)
    CONSTRAINT JDPT_NAME_NN NOT NULL;

ALTER TABLE dept
ADD CONSTRAINT JDPT_NAME_UK UNIQUE(dname);

ALTER TABLE dept
MODIFY loc VARCHAR2(13 BYTE)
    CONSTRAINT JDPT_LOC_NN NOT NULL;
    
ALTER TABLE salgrade
MODIFY losal NUMBER
    CONSTRAINT JSAL_LSAL_NN NOT NULL;

ALTER TABLE salgrade
ADD CONSTRAINT JSAL_LSAL_UK UNIQUE(losal);

ALTER TABLE salgrade
MODIFY hisal NUMBER
    CONSTRAINT JSAL_HSAL_NN NOT NULL;

ALTER TABLE salgrade
ADD CONSTRAINT JSAL_HSAL_UK UNIQUE(hisal);

ALTER TABLE member
MODIFY joindate DEFAULT SYSDATE;

ALTER TABLE member
MODIFY gen CHAR(1) DEFAULT 'F'
    CONSTRAINT JMB_GEN_CK CHECK(gen IN('F','M'));
    
ALTER TABLE member
MODIFY avatar NUMBER(4,0) DEFAULT 10;

ALTER TABLE member
MODIFY isshow CHAR(1) DEFAULT 'Y'
    CONSTRAINT JMB_SHOW_CK CHECK(isshow IN('Y','N'));
    
ALTER TABLE salgrade
RENAME CONSTRAINT SALGRADE_GRADE_PK TO JSAL_GRADE_PK;

CREATE TABLE avatar
AS
    SELECT
        *
    FROM
        scott.avatar
;

ALTER TABLE avatar
ADD CONSTRAINT JAVT_NO_PK PRIMARY KEY(ano);

ALTER TABLE avatar
ADD CONSTRAINT JAVT_NAME_UK UNIQUE(filename);

ALTER TABLE member
MODIFY avatar NUMBER(4,0) DEFAULT 10
    CONSTRAINT JMB_AVATAR_FK REFERENCES avatar(ano);
