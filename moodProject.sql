drop table m_member;
drop table noticeboard;
drop table boardlike;
drop table chat;
drop table com_comment;
drop table community;
drop table noticelike;


create table m_member( --멤버 테이블
    m_uniqueid varchar2(200) primary key, -- 회원 고유 아이디
    m_nickname varchar2(50) unique, -- 회원 닉네임
    m_id varchar2(100) UNIQUE, -- 회원 아이디
    m_pw varchar2(200) not null, -- 회원 비밀번호
    m_name varchar2(20) not null, -- 회원 이름
    m_email varchar2(50) not null, -- 회원 이메일
    m_date date default sysdate not null, -- 회원 가입날짜
    m_exp number default 0, -- 회원 경험치
    m_level number default 1,
    m_gradeimage varchar2(100)
);

create table community ( -- 커뮤니티 게시판 테이블, 비회원 글쓰기를 위해 외래키를 삭제함
  c_idx number primary key, -- 글번호
  c_title varchar2(100) not null, -- 글제목
  c_nickname varchar2(50) not null, -- 작성자 닉네임, 비회원의 경우 ip주소를 닉네임으로 사용
  c_uniqueid varchar2(200) not null, -- 작성자 고유 id, 비회원의 경우 ip주소를 고유 id로 사용
  c_password varchar2(20) not null, -- 글 비밀번호
  c_content varchar2(4000) not null, -- 글 내용
  c_date date default sysdate not null, -- 글 작성일자
  c_views number default 0 not null, -- 글 조회수
  c_like number default 0 not null, -- 글 좋아요 갯수
  c_group number default 0, 
  c_level number default 0
);

create sequence community_idx --게시판 글번호 시퀀스
       increment BY 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;

create table boardlike ( -- 게시판의 좋아요 테이블
    c_idx number, -- 글번호
    m_uniqueid varchar2(200), -- 좋아요 누른 사람의 고유 아이디
    m_nickname varchar2(50), -- 좋아요 누른 사람의 닉네임
    likecheck varchar2(10) -- 좋아요를 눌렀는지 안 눌렀는지 체크
);


create table noticeboard ( -- 공지 게시판 테이블, 비회원 글쓰기를 막기 위해 외래키를 줌
  c_idx number primary key, -- 글번호
  c_title varchar2(100) not null, -- 글제목
  c_nickname varchar2(50) not null, -- 작성자 닉네임
  c_uniqueid varchar2(200) not null, -- 작성자 고유 id
  c_password varchar2(20) not null, -- 글 비밀번호
  c_content varchar2(4000) not null, -- 글 내용
  c_date date default sysdate not null, -- 글 작성일자
  c_views number default 0 not null, -- 글 조회수
  c_like number default 0 not null, -- 글 좋아요 갯수
  c_group number default 0, 
  c_level number default 0,
  foreign key(c_uniqueid) references m_member(m_uniqueid)
);
 
create sequence noticeboard_idx -- 공지 게시판 글번호 시퀀스
       increment BY 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;   

create table noticelike ( --공지 좋아요 테이블
    c_idx number, -- 글번호
    m_uniqueid varchar2(200), -- 좋아요 누른 사람의 고유 아이디
    m_nickname varchar2(50), -- 좋아요 누른 사람의 닉네임
    likecheck varchar2(10) -- 좋아요를 눌렀는지 안 눌렀는지 체크
);

create table grade ( -- 등급 테이블
    m_level number, -- 회원 레벨
    m_nickname varchar2(50), -- 회원 닉네임
    m_uniqueid varchar2(200) -- 회원 고유 id
);

create table com_comment(-- 게시판 댓글 테이블
    comment_idx number primary key, --댓글 글번호
    c_idx number not null, -- 게시판 글번호
    comment_pw varchar2(50) not null, -- 댓글 비밀번호
    m_nickname varchar2(50),-- 회원 닉네임 (회원이 작성한 댓글인 경우)
    comment_nick varchar2(50), -- 비회원 닉네임 (비회원이 작성한 댓글인 경우)
    comment_uniqueid varchar2(200), -- 회원이 작성한경우 회원의 고유ID, 비회원인 경우 ip저장
    comment_content varchar2(1000), -- 댓글 내용
    REG_DATE date default sysdate not null, -- 댓글 최종 작성일
    foreign KEY(m_nickname) REFERENCES m_member(m_nickname)
);

create sequence comment_seq --게시판댓글 글번호 시퀀스
       increment BY 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;
       

--스케줄러 생성 안될시 관리자 계정으로 접속후 GRANT CREATE JOB TO <사용자이름>; 입력하고 <사용자이름>로 로그인후 스케줄러 생성 (생성권한주기)
--스케줄러 실행은 되나 CHAT 테이블 데이터 삭제 못할시 GRANT DELETE ON chat TO <사용자이름>; 권한 주기 (삭제시킬수 있는 권한)
--스케줄러 실행 시킬수 있는 권한 주는 문구 : GRANT EXECUTE ON DBMS_SCHEDULER TO <사용자이름>; (사용안될수도있음)

create table chat( --채팅 테이블
    m_nickname VARCHAR2(50), --회원 닉네임
    chatContent VARCHAR2(100), --채팅 내용
    chatTime VARCHAR2 (100), -- 채팅한 시간
    chatID NUMBER PRIMARY KEY --
    );
--채팅 글번호 시퀀스
create sequence chat_chatID
       increment BY 1
       start with 1
       minvalue 1
       maxvalue 9999
       nocycle
       nocache
       noorder;
--채팅 프로시저 생성 구문
create or replace PROCEDURE delete_old_records_proc IS
BEGIN
DELETE FROM chat
WHERE TO_DATE(CHATTIME, 'YYYY-MM-DD HH24:MI:SS') < SYSDATE - INTERVAL '60' MINUTE;
END;

--채팅 스케줄러 생성 구문 ( 1시간뒤 chat테이블 데이터 삭제 )
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

