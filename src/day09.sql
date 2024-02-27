-- avatar ���̺�
DROP TABLE AVATAR;
CREATE TABLE avatar(
    ano NUMBER(2)
        CONSTRAINT AVT_NO_PK PRIMARY KEY,
    filename VARCHAR2(300 CHAR)
        CONSTRAINT AVT_FNAME_UK UNIQUE
        CONSTRAINT AVT_FNAME_NN NOT NULL,
    dir VARCHAR2(300 CHAR) DEFAULT '/img/avatar/'
        CONSTRAINT AVT_DIR_NN NOT NULL,
    len NUMBER,
    gen CHAR(1) 
        CONSTRAINT AVT_GEN_CK CHECK(gen IN('F', 'M'))
        CONSTRAINT AVT_GEN_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT AVT_SHOW_CK CHECK(isshow IN('Y', 'N'))
        CONSTRAINT AVT_SHOW_NN NOT NULL
);

/*
-- �÷� �����ϱ�
ALTER TABLE avatar
MODIFY ano NUMBER(2) DEFAULT 10; -- �⺻Ű�̹Ƿ� �⺻���� ������ �ȵȴ�.

-- ���̺� �̸� �ٲٱ�
ALTER TABLE avt
RENAME TO avatar;
*/

-- ������ �߰�
INSERT INTO 
    avatar(ano, filename, gen)
VALUES(
    11, 'img_avatar1.png', 'M'
);

INSERT INTO 
    avatar(ano, filename, gen)
VALUES(
    12, 'img_avatar2.png', 'M'
);

INSERT INTO 
    avatar(ano, filename, gen)
VALUES(
    13, 'img_avatar3.png', 'M'
);

INSERT INTO 
    avatar(ano, filename, gen)
VALUES(
    21, 'img_avatar4.png', 'F'
);

INSERT INTO 
    avatar(ano, filename, gen)
VALUES(
    22, 'img_avatar5.png', 'F'
);

INSERT INTO 
    avatar(ano, filename, gen)
VALUES(
    23, 'img_avatar6.png', 'F'
);

-- ȸ�����̺� �ƹ�Ÿ �������� �߰�
ALTER TABLE member
ADD CONSTRAINT
    MEMB_AVT_FK FOREIGN KEY(avatar) REFERENCES avatar(ano)
;

--------------------------------------------------------------------------------
-- ����
CREATE TABLE gBoard(
    gno NUMBER(4)
        CONSTRAINT GBRD_NO_PK PRIMARY KEY,
    writer NUMBER(4)
        CONSTRAINT GBRD_MNO_FK REFERENCES member(mno)
        CONSTRAINT GBRD_MNO_UK UNIQUE
        CONSTRAINT GBRD_MNO_NN NOT NULL,
    wdate DATE DEFAULT SYSDATE
        CONSTRAINT GBRD_DATE_NN NOT NULL,
    body VARCHAR2(300 CHAR)
        CONSTRAINT GBRD_BODY_NN NOT NULL
);

-- INSERT GBOARD
INSERT INTO
    GBOARD(gno, writer, body)
VALUES(
    1001, 1001, '�����â�ϼ���!'
);

INSERT INTO
    GBOARD(gno, writer, body)
VALUES(
    (SELECT NVL(MAX(gno) + 1, 1001) FROM gboard), 
    1000, '��������� �����մϴ�. ã���ּż� �����մϴ�.'
);
commit;

/*
    ���Ͽ� �Խõ� �۵���
        �۹�ȣ, ȸ�����̵�, �ۼ���, �ƹ�Ÿ�����̸�, ����, ����
    �� ��ȸ�ϼ���.
*/
SELECT
    gno �۹�ȣ, id ȸ�����̵�, wdate �ۼ���, 
    filename �ƹ�Ÿ�����̸�, m.gen ����, body ����
FROM
    member m, avatar a, gboard g
WHERE
    avatar = ano
    AND mno = writer
ORDER BY
    gno
;

--------------------------------------------------------------------------------
/*
    ���̺� �����ϱ�
    ==> 
        ���̺��̸� ���� ]
            ALTER TABLE ���̺��̸�
            RENAME TO �ٲ����̺��̸�;
        
        �÷��߰��ϱ� ]
            ALTER TABLE ���̺��̸�
            ADD ( �÷��̸� ������Ÿ��(����) ��������...);
        
        �÷��̸� ���� ]
            ALTER TABLE ���̺��̸�
            RENAME COLUMN �����̸� TO �ٲ��̸�;
            
        �÷� ���� ���� ]
            ALTER TABLE ���̺��̸�
            MODIFY �÷��̸� ������Ÿ��(����);
            
        �÷� �����ϱ�
            ALTER TABLE ���̺��̸�
            DROP COLUMN �÷��̸�;
            
        �������� �߰�
            ALTER TABLE ���̺��̸�
            ADD CONSTRAINT ���������̸� ��������(�÷��̸�) ����������;
            
    ----------------------------------------------------------------------------
    ���̺� ����
    ==> ���̺� ���� ��� �����͵� ���� �����ȴ�.
        
        ���� 1 ]
            DROP TABLE ���̺��̸�;
            
        ���� 2 ]
            DROP TABLE ���̺��̸� PURGE;
            ==> ���������� �̵���Ű�� ���� ��� ����
            
        ���� ]
            DML ����� ��Ģ������ ������ �����ϴ�.
            
            DDL ����� ��Ģ������ ������ �Ұ����ϴ�.
            
            ����Ŭ 10G ���� ������ ������ �̿��ؼ�
            ������ ���̺��� �����뿡 �����ϵ��� �� ���Ҵ�.
            
        ������ ���� ]
            
            1. �������� ��� ���̺� ����
                
                PURGE RECYCLEBIN;
                
            2. �����뿡 �ִ� Ư�� ���̺� ���� ����
                
                PUBGE TABLE ���̺��̸�;
                
            3. ������ ���� Ȯ��
            
                SHOW RECYCLEBIN;
            
            *** 
            4. �����뿡 ���� ���̺� �����ϱ�
            
                FLASHBACK TABLE ���̺��̸� TO BEFORE DROP;
                
    ----------------------------------------------------------------------------
        TRUNCATE
        ==> DDL �Ҽ� ������� DELETE  ���ó��
            ���̺� ���� �����͸� ��� ���� �ϴ� ���
            
            ���� ]
                
                TRUNCATE TABLE ���̺��̸�;
                
            ���� ]
                �� ����� DDL �Ҽ� ����̹Ƿ�
                ������ �Ұ����ϴ�.
        
*/

CREATE TABLE ABC(
   NO NUMBER(4) 
);

DROP TABLE ABC;

SHOW RECYCLEBIN;

FLASHBACK TABLE ABC TO BEFORE DROP;

-- ABC ���̺��� ���������� �̵���Ű�� �ʰ� ��� ����
DROP TABLE abc PURGE;

-- ������ Ȯ��
SHOW RECYCLEBIN;

--- TRUNCATE

CREATE TABLE MEMB
AS
    SELECT
        *
    FROM
        member
;

/*
    �������̺��� �����ؼ� ���ο� ���̺��� ����� ���
    
        ���� ]
            CREATE TABLE �����̺��̸�
            AS
                SELECT
                    �÷��̸���...
                FROM
                    ���̺��̸�
                [ WHERE
                    ���ǽ�
                ]
            ;
        ==> ���������� ����� �̿��ؼ� ���ο� ���̺��� �����.
            �̶� ���������� ������� �ʴ´�.
            ������ NULL �����Ϳ� ���õ� �Ӽ��� ����ȴ�.
            �̶� NOT NULL ���������� �ο��Ǿ�������
            ����Ŭ�� ���� �̸����� NOT NULL ���������� �߰��ȴ�.
            
*/

TRUNCATE TABLE MEMB;

SHOW RECYCLEBIN;

--------------------------------------------------------------------------------
/*
�������� �߰��ϱ�
    
    1. ���̺��� ���� �ϸ鼭 �÷����� ���� �ϴ� ���
        
        CREATE TABLE ���̺��̸�(
            �÷��̸�1 ������Ÿ��(����)
                CONSTRAINT ���������̸� PRIMARY KEY,
            �÷��̸�2 ������Ÿ��(����)  [ DEFAULT ������ ]
                CONSTRAINT ���������̸� REFERENCES ���������̺��̸�(�����÷��̸�)
                CONSTRAINT ���������̸� UNIQUE
                CONSTRAINT ���������̸� CHECK(�÷��̸�2 IN (������1, ������2, ...))
                CONSTRAINT ���������̸� NOT NULL,
            ...
        );
        
        -- ���������������� �߰��ϴ� ���..
        CREATE TABLE ���̺��̸�(
            �÷��̸�1 ������Ÿ��(����) PRIMARY KEY,
            �÷��̸�2 ������Ÿ��(����) UNIQUE CHECK(�÷��̸�2 IN(������1, ������2)) NOT NULL,
            �÷��̸�3 ������Ÿ��(����) REFERENCES �������̺��̸�(�����÷��̸�),
            
        );
        
    2. ���̺� ���� �� �� �÷� ���ǰ� ���� �Ŀ� �����ϴ� ���
        
         CREATE TABLE  ���̺��̸�(
             �÷��̸�1  ������Ÿ��(����),
             �÷��̸�2 ������Ÿ��(����),
             ....
             CONSTRAINT ���������̸� PRIMARY KEY(�÷��̸�1),
             CONSTRAINT ���������̸� FOREIGN KEY(�÷��̸�2) REFERENCES �������̺��̸�(�����÷��̸�),
             CONSTRAINT ���������̸� UNIQUE(�÷��̸�2),
             CONSTRAINT ���������̸� CHECK(�÷��̸�2 IN ( ������1, ������2, ...)),
             ...
         );
         
         
    
    
*/
--------------------------------------------------------------------------------
