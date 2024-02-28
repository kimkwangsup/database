/*
    VIEW ����� ���� 2 ]
        
        CREATE OR REPLACE VIEW ���̸�
        AS
            ���Ǹ��
        ;
        ==> ������ �䰡 ������ ���� �����, �̹� ������ ������ �Ѵ�.
        
    ���� 3 ]
        
        CREATE OR REPLACE VIEW ���̸�
        AS
            ���Ǹ��
        WITH CHECK OPTION;
        ==> 
            DML ������� �����͸� �����ϰԵǸ�
            ����� �����ʹ� �信�� ����� ���̺��� �����͸� �����ϰ� �ȴ�.
            �׷��� �� ���忡�� ���� ���� ��ȸ�Ǿ��� �����͸� ����� �� ���� �� �� �ִ�.
            
    ���� 4 ]
        ==> �並 ���ؼ� �����͸� ������ �� ������ ���Ƽ� �並 ����� ����.
        
        CREATE OR REPLACE VIEW ���̸�
        AS
            ���Ǹ��
        WITH READ ONLY;
    
--------------------------------------------------------------------------------

    ��� ��ȸ���Ǹ���� ����� ��������Ƿ�
    ��ȸ�� ���̺��� �����ؾ� ��Ģ�����δ� ���� �� �ִ�.
    ������ �۾������ �並 ���� �����ؾ� �ϴ� ��쵵 ���� �� �ִ�.
    �̷� ��� ����� �� �ִ� �� ���� ������ �ִ�.
    
    ���� ]
        CREATE OR REPLACE FORCE VIEW ���̸�
        AS  
            ���Ǹ��
        ;
    ==>
        �̶� ���۵� ��� ��ȸ�� ���̺��� ���� �������� �ʱ� ������
        ����� ���� ���� ���̺��� ��������� ��밡��������.
        
--------------------------------------------------------------------------------

    �� �����ϱ�
    
        ���� ]
            
            DROP VIEW ���̸�;
*/

-- 10�� �μ� ������� �����ȣ, ����̸�, ����, �޿�, �μ��̸�, �μ���ġ�� ��ȸ�� �� �ִ� ��(d10info)��
-- �� �����ϼ���,
CREATE OR REPLACE VIEW d10info
AS  
    SELECT
        empno, ename, job, sal, dname, loc
    FROM
        emp e, dept d
    WHERE
        e.deptno = d.deptno
        AND e.deptno = 10
;

-- ��ü ��ȸ
select
    *
from
    d10info
;

-- 7782�� ����� �޿��� d10info �並 �̿��ؼ� 2500���� �����ϼ���.
UPDATE
    d10info
SET
    sal = 2500
WHERE
    empno = 7782
;

-- ==> ���պ��� ������ ������ �� ����.

-- d10info ��� �̸����� emp ���̺��� 10�� �μ� ������� 
-- �����ȣ, ����̸�, ����, �޿�, �μ���ȣ�� ��ȸ�ϼ���
CREATE OR REPLACE VIEW d10info
AS
    SELECT
        empno eno, ename name, job , sal money, deptno dno
    FROM
        emp   
    WHERE
        deptno = 10
;
-- �� ��ü ��ȸ
SELECT
    *
FROM
    d10info
;

-- 7782�� ����� �޿��� d10info �並 �̿��ؼ� 2500���� �����ϼ���.
UPDATE
    d10info
SET
    money = 2500
WHERE
    eno = 7782
;

-- �����ȸ
select * from d10info;

-- 7782 �� ����� �μ���ȣ�� 20������ �����ϼ���
UPDATE
    d10info
SET
    dno = 20
--WHERE
--    eno = 7782
;

-- �����ȸ
select * from d10info;

ROLLBACK;

-- �μ���ȣ�� �����Ҽ� ������ �並 d10info �並 �ٽ� �����
CREATE OR REPLACE VIEW d10info
AS
    SELECT
        empno eno, ename name, job , sal money, deptno dno
    FROM
        emp
    WHERE  
        deptno = 10
WITH CHECK OPTION;

-- 7782�� ����� �μ���ȣ ����
UPDATE
    d10info
SET
    dno = 20
WHERE
    eno = 7782
;

ROLLBACK;

-- emp���̺��� ��� �����͸� �߶���.
TRUNCATE TABLE emp; -- DDL �Ҽ� ���

SELECT * FROM emp;
-- scott ������ ������ �ִ� emp ���̺��� �����͸� �����ؼ� 
-- jennie ������ emp ���̺� �Է��ϼ���
INSERT INTO emp
    SELECT
        *
    FROM
        scott.emp   
;
commit;

select * from emp;

/*
    jennie ������ Member, Avatar ���̺��� ���� �����̴�.
    �� ���̺��� �̿��ؼ� 
        ȸ����ȣ, �̸�, ���̵�, ����, �ƹ�Ÿ�����̸�, ����
    �� ��ȸ�ϴ� membView �� ���弼��
*/
CREATE OR REPLACE FORCE VIEW membView
AS
    SELECT
        mno, name, id, mail, savename sname, m.gen
    FROM
        member m, avatar a
    WHERE
        avatar = ano
;
-- d10info�� 7782 ����� �޿��� 2500���� ����
UPDATE
    d10info
SET
    money = 2500
WHERE
    eno = 7782
;

rollback;
-- d20info ��� �̸����� 20���μ��� �������
-- �����ȣ, ����̸�, ����, �޿��� ��ȸ�ϴ� �並 ���弼��
-- �� , �� �並 ���ؼ� �����͸� ������ �� ������ �ϼ���
CREATE OR REPLACE VIEW d20info
AS
    SELECT
        empno eno, ename name, job, sal money
    FROM
        emp
    WHERE
        deptno = 20
WITH READ ONLY;

-- 7782 �� ����� �޿��� 10000���� �����ϼ���.
UPDATE
    d20info
SET
    money = 10000
WHERE
    eno = 7369
;
--------------------------------------------------------------------------------
/*
    ������(Sequence)
    ==> ���̺��� ����� ������ ���� ������ �� �ִ� �⺻Ű(PK, Primary Key) ��
        ���� �ʼ������� ����� �ȴ�.
        �̶� ���� ����� ���ϰ� ����ϴ� ���� ��ȣ�� �̿��ؼ� �⺻Ű�� ����ϰ� �ȴ�.
        �׷��� �� ��ȣ�� �ٸ� ���� ���еǴ� ������ ���̿��� �ϰ�
        null �� �ԷµǸ� �ȵȴ�.
        
        ���� �� �Ϸù�ȣ�� �Է��� ��
        ���� ������δ� �������Ǹ� �̿��ؼ� ���ڸ� ���� �Է��ϴ� ����� �ִµ�
        �� ����� DBMS�� �������Ǹ���� ������ �� ��ȣ�� ����� ���Ǹ���� �ѹ� �� �����ϰ� �ȴ�.
        ���� ó���۾��� �ణ �� �ð��� �Ҹ�ȴ�.
        
        �̷� �������� �ذ����ִ� ���� �������̴�.
        
        �������� �ڵ������� �Ϸù�ȣ�� ������ִ� ������
        �����ͺ��̽��� ��ϵǴ� ��ü�̴�.
        
        ��� ��� ]
            1. �������� �����.
            2. �Ϸù�ȣ�� �ʿ��� ������ ��ȣ�� �˷��޶�� ��û�Ѵ�.
                ==> INSERT ����� ����� �� ��û�ؼ� ����ϸ� �ȴ�.
                
        ������ ���� ���� ]
            
            CREATE SEQUENCE �������̸�
                START WITH ��ȣ
                ==> �߻���ų �Ϸù�ȣ�� ���۰��� ����
                
                INCREMENT BY ����
                ==> �߻���ų �Ϸù�ȣ�� �������� ����
                    ������� ������ 1�� ó���ȴ�.
                    
                MAXVALUE ���� [ �Ǵ� NOMAXVALUE ]
                MINVALUE ���� [ �Ǵ� NOMINVALUE ]
                ==> �߻���ų �Ϸù�ȣ�� �ִ�, �ּڰ��� ����
                    �����ϸ� NOMAXVALUE, NOMINVALUE �� �����ȴ�.
                    
                CYCLE [ �Ǵ� NOCYCLE ]
                ==> �߻��� �Ϸù�ȣ�� �ִ밪�� ������ �� 
                    ó������ �ٽ� �������� ���θ� ����
                     
                    
                CASHE ���� [ �Ǵ� NOCASHE ]
                ==> �Ϸù�ȣ�� �ӽø޸𸮸� ����ؼ� �������� ���θ� ����
                    �⺻���� �ӽø޸𸮿� 10���� ����� ���� �ű⼭ �������� �ȴ�.
            
        ���� ]    
            �����
                �������̸�.CURRVAL : NEXTVAL �� ������ ������ ��ȣ�� ���
                �������̸�.NEXTVAL : �����ų������ ���� ��ȣ�� ����
                
    ���� ]
        �������� Ư�� ���̺� �����������ʴ�.
        ���� �ϳ��� �������� �������� ���̺��� ���� �� �ִ�.
        �̷��ٺ��� �Ϸù�ȣ�� ���� �� �� ���̺� ������ �߰��� ������ ��ȣ�� ������ �� �ִ�.
        �׸��� INSERT ����� �������� ��ȣ�� �����ؼ� �Է��� ��
        �Է� ������ �߸��ż� �Է��� �ȵǴ� ���
        �� ��, ������ �Ϸù�ȣ�� �ٽ� ����� �� ���� �ȴ�.
        
    ������ ���� ]
        
        ���� ]
            ALTER SEQUENCE �������̸�
                INCREMENT BY ����
                MAXVALUE ����
                MINVALUE ����
                CYCLE
                CASHE 
            ;
            ==> �������� �����ϴ� ���� ���۹�ȣ�� ������ �� ����.
                �̹� �߻��� ��ȣ�� �ֱ� ������ 
                ���� ��ȣ�� ������ ����� ���� ��ȣ�� ���� ��ȣ�� �ȴ�.
                
        ������ ���� ]
            
            ���� ]
                DROP SEQUENCE �������̸�;
                
--------------------------------------------------------------------------------
    ������ ���Ǹ��
    ==> ������ EMP ���̺��� KING �������� �����ؼ�
        ������� �Ƕ�̵� ������ �ٹ��ϰ� �ִ�.
        �� ������� ��ȸ�� �� �ִ� ���Ǹ�� ������ �̾߱��Ѵ�.
        
        ���� ]
            
            SELECT
                �÷��̸���, LEVEL ��������
            FROM
                ���̺��̸�
            START WITH
                ������ ������ ����ϴ� �κ�
            CONNECT BY  
                ������ ���� ������ ����ϴ� �κ�
            ORDER SIBLINGS BY
                ���������� ���� ���� �÷� ���
            ;
    
*/

-- 1���� 1�� �����ϴ� ������ ONE2ONE�� ������. �ִ밪�� 100���� �Ѵ�
CREATE SEQUENCE one2one
    MAXVALUE 100
;
SELECT
    one2one.CURRVAL �����ȣ, one2one.NEXTVAL ������ȣ, one2one.NEXTVAL n2
FROM
    dual
;

SELECT
    one2one.CURRVAL �����ȣ FROM DUAL;
DROP TABLE TMP;    
CREATE TABLE tmp(
    no NUMBER(3)
        CONSTRAINT TMP_NO_PK PRIMARY KEY,
    name VARCHAR2(20 CHAR),
    id VARCHAR2(20 CHAR)
        CONSTRAINT TMP_ID_UK UNIQUE
        CONSTRAINT TMP_ID_NN NOT NULL
);

-- ONE2ONE �������� �̿��ؼ� �����͸� �Է��غ���

INSERT INTO
    tmp(NO)
VALUES(
    one2one.NEXTVAL
);
INSERT INTO
    tmp(NO, ID)
VALUES(
    one2one.NEXTVAL,'CHOPPA'
);

SELECT * FROM tmp;

-- EMP ���̺��� ���������� ��ȸ�ϼ���
SELECT
    empno �����ȣ, ename ����̸�, job ����, mgr ����ȣ, LEVEL ��������
FROM
    emp
START WITH
    mgr IS NULL
CONNECT BY 
    prior empno = mgr
ORDER SIBLINGS BY
    ename
;

SELECT
    LEVEL || ' ' ||
    CONCAT(LPAD('-',(LEVEL - 1) * 5, '-'),
            ename
    ) || ' : ' || 
    job �������
FROM
    emp
START WITH
    mgr IS NULL
CONNECT BY 
    prior empno = mgr
;

--------------------------------------------------------------------------------
CREATE TABLE member
AS
    SELECT
        *
    FROM
        scott.member   
;

-- ȸ����ȣ ������ ����
CREATE SEQUENCE mnoSeq
    START WITH 1002
    MAXVALUE 9999
    NOCYCLE
;

-- ȸ�� '����', '����', '����', '����'�� �߰��ϼ���
INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avatar, joindate, isshow)
VALUES(
    (mnoSeq.NEXTVAL, '����', 'CHOPPA', 12345, 'choppa@human.com', '010-5858-5858', 'M', 11, sysdate, 'Y'),
    (mnoSeq.NEXTVAL, '����', 'LISA', 12345, 'lisa@human.com', '010-2424-2424', 'F', 22, sysdate, 'Y'),
    (mnoSeq.NEXTVAL, '����', 'ROSE', 12345, 'rose@human.com', '010-5454-5454', 'F', 22, sysdate, 'Y'),
    (mnoSeq.NEXTVAL, '����', 'JISOO', 12345, 'jisoo@human.com', '010-2929-2929', 'F', 23, sysdate, 'Y')
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avatar, joindate, isshow)
VALUES(
    (mnoseq.NEXTVAL, '����', 'CHOPPA', 12345, 'choppa@human.com', '010-5858-5858', 'M', 11, sysdate, 'Y')
);




INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avatar, joindate, isshow)
VALUES
    (mnoSeq.NEXTVAL, '����', 'LISA', 12345, 'lisa@human.com', '010-2424-2424', 'F', 22, sysdate, 'Y')
;
INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avatar, joindate, isshow)
VALUES
    (mnoSeq.NEXTVAL, '����', 'ROSE', 12345, 'rose@human.com', '010-5454-5454', 'F', 22, sysdate, 'Y')
;

INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avatar, joindate, isshow)
VALUES
    (mnoSeq.NEXTVAL, '����', 'JISOO', 12345, 'jisoo@human.com', '010-2929-2929', 'F', 23, sysdate, 'Y')
;

-- Member ���̺� �������� �߰�
ALTER TABLE member
ADD CONSTRAINT 
    MB_NO_PK PRIMARY KEY(mno);
    
ALTER TABLE member
ADD CONSTRAINT 
    MB_ID_UK UNIQUE(id);

ALTER TABLE member
ADD CONSTRAINT 
    MB_MAIL_UK UNIQUE(mail);

ALTER TABLE member
ADD CONSTRAINT 
    MB_TEL_UK UNIQUE(tel);
    

-- ��۰Խ��� ����.

CREATE TABLE reboard(
    rebno NUMBER(6)
        CONSTRAINT RBRD_NO_PK PRIMARY KEY,
    body VARCHAR2(4000)
        CONSTRAINT RBRD_BD_NN NOT NULL,
    writer NUMBER(4)
        CONSTRAINT RBRD_MNO_FK REFERENCES member(mno)
        CONSTRAINT RBRD_MNO_NN NOT NULL,
    wdate DATE DEFAULT SYSDATE
        CONSTRAINT RBRD_DATE_NN NOT NULL,
    upno NUMBER(6),
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT RBRD_SHOW_CK CHECK(isshow IN('Y','N'))
        CONSTRAINT RBRD_SHOW_NN NOT NULL
);

-- ��۰Խ��� ���� ������
DROP SEQUENCE rbSeq;
CREATE SEQUENCE rbSeq
    START WITH 1001
    MAXVALUE 999999
    NOCYCLE
;

-- ������ �Է�
-- �����Է�
INSERT INTO
    reboard(rebno, body, writer)
VALUES(
    rbseq.NEXTVAL, '��۰Խ��� �����̿�. ���̽����', 1000
);
INSERT INTO
    reboard(rebno, body, writer)
VALUES(
    rbseq.NEXTVAL, '��۰Խ��� �����մϴ�. ��â�ϼ���!', 1001
);
INSERT INTO
    reboard(rebno, body, writer)
VALUES(
    rbseq.NEXTVAL, '���Ͽ�!', 1002
);
INSERT INTO
    reboard(rebno, body, writer, upno)
VALUES(
    rbseq.NEXTVAL, '�ٳ఩�ϴ�. �Խ��� ��â�ϼ���!', 1005, 1001
);

INSERT INTO
    reboard(rebno, body, writer, upno)
VALUES(
    rbseq.NEXTVAL, '���� �Դٰ���@!#~', 1005, 1002
);

INSERT INTO
    reboard(rebno, body, writer, upno)
VALUES(
    rbseq.NEXTVAL, '�� ������?', 1003, 1003
);


INSERT INTO
    reboard(rebno, body, writer, upno)
VALUES(
    rbseq.NEXTVAL, '�ٳన�ϴ�', 1003, 1004
);


INSERT INTO
    reboard(rebno, body, writer, upno)
VALUES(
    rbseq.NEXTVAL, '�o��?!', 1004, 1007
);
commit;
-- ��۵��� �������� ��ȸ�ϼ���.
SELECT
    LPAD(' ', (LEVEL - 1) * 10,' ')|| id || ' : ' ||TO_CHAR(wdate, 'YYYY"��" MM"��" DD"��" HH24:MI:SS') || ' - ' || body �Խñ�
FROM
    reboard r, member m
WHERE
    writer = mno
START WITH
    upno IS NULL
CONNECT BY
    PRIOR rebno = upno
ORDER SIBLINGS BY
    wdate
;















