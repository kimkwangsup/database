-- day08

/*
    DDL(Data Definition Language) ���
    ==> ��ü�� ������ ������ ���õ� ��ɵ�...
        
        ���̺�, �����, ��, �Լ�, ... ���� ��ü�� �ش��ϰ�
        �����ͺ��̽��� ����� �Ǵ� �͵��̴�.
        ��ü���� �̸��� ������ �� �̸����� �ҷ��� ����� �� �ִ� �͵��̴�.
        
    ���� ]
        ���̺� ����
            ����Ŭ�� ����ȭ�� �����͸� ����ϵ��� �ϴ� �����ͺ��̽��� �����̴�.
            ����ȭ �����Ͷ�?
                ��Ģ�� ������ �����͸� �ǹ��Ѵ�.
            ����Ŭ�� � ������ �����͸� ����� ���� �̸� ���س���
            �� �������� ���¿� ���ؼ��� ����ϵ��� �ϴ� �����ͺ��̽��̴�.
            
            ���� ���̺��� ���鶧�� �������� ��Ģ(����ȭ)�� ������ 
            ���̺� �� �������� ���¸� �����ؾ� �Ѵ�.
            
        ���̺� ���� ����
        
            ������ ����
            ==> �߻������� ���������θ� ������ ���� ����
            
                    ==> ER MODEL DIAGRAM
                    
            ���� ����
            ==> �������� ���¿� ��ü���� ������� ���ǵǴ� ����
             
                 ==> ERD
            ������ ����
                ==> ���� ���� ������ ��ϵ� ��  �ֵ��� �ϴ� ����

                    ==> ���̺����, DDL ���Ǹ��
                    
--------------------------------------------------------------------------------    
    ���� ]
        ����ȭ
            ==> ���̺� ���� �� �Էµ� �������� �԰��� ���ϴ� �۾���
            
            ��1����ȭ
            ==> ��� �Ӽ��� �Ӽ����� ���ڰ��� ������ �Ѵ�.
            
            ��2����ȭ
            ==> �⺻Ű �̿��� �Ӽ��� �⺻Ű�� ���ؼ� �����Լ� �����̾�� �Ѵ�. 
           
            ��3����ȭ
            ==> �⺻Ű �̿��� �Ӽ��� �κ��Լ�(������ �Լ�) ������ ���ؾ� �Ѵ�.
            
       -------------------------------------------------------------------------
            BCNF����ȭ
            ��4����ȭ
            ��5����ȭ
*/
/*
    ȸ���� ������ ����� ���̺�(Member)�� �����غ���
        1. ������ ���� => ER Model Diagram
        2. ���� ���� => ERD
        3. ������ ���� => ���̺����, DDL���

--------------------------------------------------------------------------------
    ���Ἲ ����
    ==> �����ͺ��̽��� ���α׷����� �����۾����� �ʿ��� �����͸� �������ִ�
        ���� ���α׷��̴�.
        ���� �����ͺ��̽��� ���� �����ʹ� ������ �Ϻ��� �����Ϳ����Ѵ�.
        ������, �����͸� �Է��ϴ� ���� ����� ���̰�
        �׷��� �Ϻ��� �����͸� ������ �� ���� �ȴ�.
        
        ������ ���̺� �ԷµǼ��� �ȵ� �����ͳ� 
        �Ǵ� �����Ǹ� �ȵǴ� ������ ���� �̸� ������ ������
        �Է��ϴ� �������� �߸��� �������Ͱ� �ԷµǴ� ���� 
        ������ �� �ְ� �� ���̴�.
        
        �� ����� �ݵ�� �ʿ��� ����� �ƴϳ�
        �Ǽ��� �̿��� ���� �� �� �ֵ��� ��ġ�س��� ���� ������ ���̴�.
        
        ���� ]
            PRIMARY KEY
            ==> �� ���� Ư���ؼ� ��ȸ�� �� �ִ� ��������
                ���� NULL�� �ԷµǸ� �ȵǰ�, �ٸ� ����� �����Ϳ� ���еǴ�
                ������ �Ӽ����� ������ �Ѵ�.
                
            FOREIGN KEY
            ==> �и��� ���̺� �Էµ� �����͸� ����ϴ� ��������
                �����ϴ� ���̺� �Էµ��� �ʴ� �����Ͱ� �ԷµǴ� ���� �����ϴ�
                ����� ������ �ִ� ��������
            
            UNIQUE
            ==> �Ӽ��� �Ӽ����� �ٸ� ���ڵ�(��)�� �Ӽ������� ���еǴ� 
                ������ ������ �Է��� �Ǿ�� �ϴ� ��������
                ��, ������ �Էµ� �Ӽ����� �ԷµǸ� �� ���� ������ �Է��� ���ϵ��� ���� ����� ��������
                ��� NULL �� �Է��� �� �ִ�.
                
            NOT NULL
            ==> �� ���������� ������ �÷��� �����ʹ� �ݵ�� �Է������ �ϴ� ��������
                NULL ���� �ԷµǴ� ���� �����ϴ� ��������
            
            CHECK
            ==> �ԷµǴ� �����Ͱ� ������ ���ǿ� �´� �����͸� �Է��� ����ϴ� ��������
                �Է����ǿ� ���� �ʴ� �����Ͱ� �Է��� �Ǹ� �� ���� �Է� ���ϵ��� ���� ��������
                
        ***
        ���� �������� �� �Ѱ��� ��Ű���ʴ� �����Ͱ� �ԷµǸ�
        �ԷµǴ� �� ���� �ƿ� �Է��� �ȵȴ�.
        
���� ]
    �������� �߰��ϴ� ����� DDL ��� ���� �Ŀ� �ٽ� �̾ ����.

--------------------------------------------------------------------------------

    DDL(Data Definition Language) : ������ ���� ���
    
    1. CREATE
    ==> ��ü�� ����� ���
    
        ���� ]
            CREATE ��ü���� ��ü�̸�(
            
            );
            
            ���̺� ���� 1 ]
                
                CREATE TABLE ���̺��̸�(
                    �÷��̸�, ������Ÿ��(����) [DEFAULT ������]
                    ...
                );
            *****
            ���̺� ���� 2 ]
                
                CREATE TABLE ���̺��̸�(
                    �÷��̸� ������Ÿ��(����) [DEFAULT ������]
                        CONSTRAINT ���������̸� ��������1
                        CONSTRAINT �������� �̸���������2
                        ...
                    �÷��̸� ������Ÿ��(����) [DEFAULT ������]
                        CONSTRAINT ���������̸� ��������1
                        CONSTRAINT ���������̸� ��������2
                    ...
                );
                
            ���̺� ���� 3 ] - �÷� ���Ǹ� ��� �� �Ŀ� ���� ������ �߰��ϴ� ���
            
                CREATE TABLE ���̺��̸�(
                    �÷��̸�, ������Ÿ��(����) [DEFAULT ������] [NOT NULL],
                    �÷��̸�, ������Ÿ��(����) [DEFAULT ������] [NOT NULL],
                    ...
                    CONSTRAINT ���������̸� �÷��̸� ��������Ÿ��,
                    CONSTRAINT ���������̸� �÷��̸� ��������Ÿ��,
                    ...
                );
        
        ���� ]
            �������� �߰����� ]
            
                PK
                ==> 
                    CONSTRAINT ���������̸� PRIMARY KEY[(�÷��̸�)]
                FK
                ==> 
                    CONSTRATIN ���������̸� REFERENCES �������̺��̸�(�÷��̸�) ==> �÷����� �߰��ϴ� ���
                    CONSTRAINT ���������̸� FOREIGN KEY(�÷��̸�) REFERENCES �������̺��̸�(�÷��̸�) ==> CREATE ��� �Ʒ��κп� �߰��ϴ� ���.
                
                UK
                ==>
                    CONSTRAINT ���������̸� UNIQUE -- ����2
                    CONSTRAINT ���������̸� UNIQUE(�÷��̸�) -- ����3
                NN
                ==> 
                    CONSTRAINT �������� �̸� NOT NULL = ����2
                    
                CK
                ==>
                    CONSTRAINT �������� �̸� CHECK(�÷��̸� IN (������2, ������2, ...))
                    
            ���� ]
                ���������̸� �ۼ� ��Ģ
                    
                    ���̺� �̸� _�÷��̸�_��������Ÿ��
                    �� ]
                        CONSTRAINT EMP_NO_PK PRIMARY KEY
                        
            ���� ]
                �������� �߰��� �̸��� �������� ������
                ����Ŭ�� �ڵ����� �����ؼ� �ٿ��ְ� �ȴ�.
                ������ �� �̸����� ����� ���� ������ Ȯ���ϱⰡ ���������ٴ� ���̴�.
                ������ �Է� �� ���������� ���� ���� �� �̸����� ����� ���� ������
                Ȯ���� �����ϴٸ� ������ ������ �� �� �ִ�.
            
    2. ALTER
    
    3. DROP
    
    4. TRUNCATE

*/

-- ȸ���������̺�

CREATE TABLE member(
    mno NUMBER(4) 
        CONSTRAINT MEMB_NO_PK PRIMARY KEY,
    name VARCHAR2(15 CHAR)
        CONSTRAINT MEMB_NAME_NN NOT NULL,
    id VARCHAR2(10 CHAR)
        CONSTRAINT MEMB_ID_UK UNIQUE
        CONSTRAINT MEMB_ID_NN NOT NULL,
    pw VARCHAR2(12 CHAR)
        CONSTRAINT MEMB_PW_NN NOT NULL,
    mail VARCHAR2(30 CHAR)
        CONSTRAINT MEMB_MAIL_UK UNIQUE
        CONSTRAINT MEMB_MAIL_NN NOT NULL,
    tel VARCHAR2(13 CHAR)
        CONSTRAINT MEMB_TEL_UK UNIQUE
        CONSTRAINT MEMB_TEL_NN NOT NULL,
    joinDate DATE DEFAULT SYSDATE
        CONSTRAINT MEMB_DATE_NN NOT NULL,
    gen CHAR(1) 
        CONSTRAINT MEMB_GEN_CK CHECK(gen IN ('F', 'M'))
        CONSTRAINT MEMB_GEN_NN NOT NULL,
    avatar NUMBER(2)
        CONSTRAINT MEMB_AVT_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT MEMB_SHOW_CK CHECK (isshow IN ('Y', 'N'))
        CONSTRAINT MEMB_SHOW_NN NOT NULL
);
-- ȸ���߰�
INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avatar)
VALUES(
    (SELECT NVL(MAX(mno) + 1, 1001) FROM member),
    '������', 'jennie', '12345', 'jennie@human.com', '010-1212-1212', 'F', 15
);

INSERT INTO
    member(mno, name, id, pw, mail, tel, gen, avatar, joindate)
VALUES(
    1000,
    '������', 'euns', '12345', 'euns@human.com', '010-3175-9042', 'M', 12,
    SYSDATE
);

commit;

DROP TABLE board


CREATE TABLE board(
    bno NUMBER(6)
        CONSTRAINT BOARD_NO_PK PRIMARY KEY,
    title VARCHAR2(50 CHAR)
        CONSTRAINT BOARD_TITLE_NN NOT NULL,
    body VARCHAR2(4000)
        CONSTRAINT BOARD_BODY_NN NOT NULL,
    writer NUMBER(4)
        CONSTRAINT BOARD_WRITER_FK REFERENCES member(mno)
        CONSTRAINT BOARD_WRITER_NN NOT NULL,
    wdate DATE DEFAULT SYSDATE
        CONSTRAINT BOARD_DATE_NN NOT NULL,
    views NUMBER(5) DEFAULT 0
        CONSTRAINT BOARD_VIEWS_NN NOT NULL,
    isshow CHAR(1) DEFAULT 'Y'
        CONSTRAINT BOARD_SHOW_CK CHECK(isshow IN ('Y', 'N'))
        CONSTRAINT BOARD_SHOW_NN NOT NULL  
);

CREATE TABLE blackpink(
    name VARCHAR2(2 CHAR) NOT NULL,
    age NUMBER(3),
    position VARCHAR2(10 CHAR)
);

ALTER TABLE blackpink
    MODIFY age NUMBER(4)
     CONSTRAINT  BLPINK_AGE_NN NOT NULL
;





















