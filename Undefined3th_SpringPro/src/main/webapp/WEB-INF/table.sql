-- 방명록 SQL문

CREATE SEQUENCE visitor_seq NOCACHE;

CREATE TABLE visitor_comment(
num NUMBER PRIMARY KEY,--덧글의 글번호
writer VARCHAR2(100),
content CLOB,
regdate DATE
);
