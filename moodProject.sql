drop table m_member;
drop table noticeboard;
drop table boardlike;
drop table chat;
drop table com_comment;
drop table community;
drop table noticelike;


create table m_member( --��� ���̺�
    m_uniqueid varchar2(200) primary key, -- ȸ�� ���� ���̵�
    m_nickname varchar2(50) unique, -- ȸ�� �г���
    m_id varchar2(100) UNIQUE, -- ȸ�� ���̵�
    m_pw varchar2(200) not null, -- ȸ�� ��й�ȣ
    m_name varchar2(20) not null, -- ȸ�� �̸�
    m_email varchar2(50) not null, -- ȸ�� �̸���
    m_date date default sysdate not null, -- ȸ�� ���Գ�¥
    m_exp number default 0, -- ȸ�� ����ġ
    m_level number default 1,
    m_gradeimage varchar2(100)
);

create table community ( -- Ŀ�´�Ƽ �Խ��� ���̺�, ��ȸ�� �۾��⸦ ���� �ܷ�Ű�� ������
  c_idx number primary key, -- �۹�ȣ
  c_title varchar2(100) not null, -- ������
  c_nickname varchar2(50) not null, -- �ۼ��� �г���, ��ȸ���� ��� ip�ּҸ� �г������� ���
  c_uniqueid varchar2(200) not null, -- �ۼ��� ���� id, ��ȸ���� ��� ip�ּҸ� ���� id�� ���
  c_password varchar2(20) not null, -- �� ��й�ȣ
  c_content varchar2(4000) not null, -- �� ����
  c_date date default sysdate not null, -- �� �ۼ�����
  c_views number default 0 not null, -- �� ��ȸ��
  c_like number default 0 not null, -- �� ���ƿ� ����
  c_group number default 0, 
  c_level number default 0
);

create sequence community_idx --�Խ��� �۹�ȣ ������
       increment BY 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;

create table boardlike ( -- �Խ����� ���ƿ� ���̺�
    c_idx number, -- �۹�ȣ
    m_uniqueid varchar2(200), -- ���ƿ� ���� ����� ���� ���̵�
    m_nickname varchar2(50), -- ���ƿ� ���� ����� �г���
    likecheck varchar2(10) -- ���ƿ並 �������� �� �������� üũ
);


create table noticeboard ( -- ���� �Խ��� ���̺�, ��ȸ�� �۾��⸦ ���� ���� �ܷ�Ű�� ��
  c_idx number primary key, -- �۹�ȣ
  c_title varchar2(100) not null, -- ������
  c_nickname varchar2(50) not null, -- �ۼ��� �г���
  c_uniqueid varchar2(200) not null, -- �ۼ��� ���� id
  c_password varchar2(20) not null, -- �� ��й�ȣ
  c_content varchar2(4000) not null, -- �� ����
  c_date date default sysdate not null, -- �� �ۼ�����
  c_views number default 0 not null, -- �� ��ȸ��
  c_like number default 0 not null, -- �� ���ƿ� ����
  c_group number default 0, 
  c_level number default 0,
  foreign key(c_uniqueid) references m_member(m_uniqueid)
);
 
create sequence noticeboard_idx -- ���� �Խ��� �۹�ȣ ������
       increment BY 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;   

create table noticelike ( --���� ���ƿ� ���̺�
    c_idx number, -- �۹�ȣ
    m_uniqueid varchar2(200), -- ���ƿ� ���� ����� ���� ���̵�
    m_nickname varchar2(50), -- ���ƿ� ���� ����� �г���
    likecheck varchar2(10) -- ���ƿ並 �������� �� �������� üũ
);

create table grade ( -- ��� ���̺�
    m_level number, -- ȸ�� ����
    m_nickname varchar2(50), -- ȸ�� �г���
    m_uniqueid varchar2(200) -- ȸ�� ���� id
);

create table com_comment(-- �Խ��� ��� ���̺�
    comment_idx number primary key, --��� �۹�ȣ
    c_idx number not null, -- �Խ��� �۹�ȣ
    comment_pw varchar2(50) not null, -- ��� ��й�ȣ
    m_nickname varchar2(50),-- ȸ�� �г��� (ȸ���� �ۼ��� ����� ���)
    comment_nick varchar2(50), -- ��ȸ�� �г��� (��ȸ���� �ۼ��� ����� ���)
    comment_uniqueid varchar2(200), -- ȸ���� �ۼ��Ѱ�� ȸ���� ����ID, ��ȸ���� ��� ip����
    comment_content varchar2(1000), -- ��� ����
    REG_DATE date default sysdate not null, -- ��� ���� �ۼ���
    foreign KEY(m_nickname) REFERENCES m_member(m_nickname)
);

create sequence comment_seq --�Խ��Ǵ�� �۹�ȣ ������
       increment BY 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;
       

--�����ٷ� ���� �ȵɽ� ������ �������� ������ GRANT CREATE JOB TO <������̸�>; �Է��ϰ� <������̸�>�� �α����� �����ٷ� ���� (���������ֱ�)
--�����ٷ� ������ �ǳ� CHAT ���̺� ������ ���� ���ҽ� GRANT DELETE ON chat TO <������̸�>; ���� �ֱ� (������ų�� �ִ� ����)
--�����ٷ� ���� ��ų�� �ִ� ���� �ִ� ���� : GRANT EXECUTE ON DBMS_SCHEDULER TO <������̸�>; (���ȵɼ�������)

create table chat( --ä�� ���̺�
    m_nickname VARCHAR2(50), --ȸ�� �г���
    chatContent VARCHAR2(100), --ä�� ����
    chatTime VARCHAR2 (100), -- ä���� �ð�
    chatID NUMBER PRIMARY KEY --
    );
--ä�� �۹�ȣ ������
create sequence chat_chatID
       increment BY 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;
--ä�� ���ν��� ���� ����
create or replace PROCEDURE delete_old_records_proc IS
BEGIN
DELETE FROM chat
WHERE TO_DATE(CHATTIME, 'YYYY-MM-DD HH24:MI:SS') < SYSDATE - INTERVAL '60' MINUTE;
END;

--ä�� �����ٷ� ���� ���� ( 1�ð��� chat���̺� ������ ���� )
BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
    job_name           => 'delete_old_records_job',
    job_type           => 'STORED_PROCEDURE',
    job_action         => 'delete_old_records_proc',
    start_date         => SYSTIMESTAMP,
    repeat_interval    => 'FREQ=HOURLY;INTERVAL=1',
    enabled            => TRUE,
    comments           => 'Job to delete old records from chat table every 60 minutes');
END; 

