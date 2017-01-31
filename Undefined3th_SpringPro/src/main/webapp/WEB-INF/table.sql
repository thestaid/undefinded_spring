-- 방명록 SQL문

CREATE SEQUENCE visitor_seq NOCACHE;

CREATE TABLE visitor_comment(
num NUMBER PRIMARY KEY,--덧글의 글번호
writer VARCHAR2(100),
content CLOB,
target_id VARCHAR2(100), --덧글의 대상이 되는 되는 아이디
regdate DATE
);
