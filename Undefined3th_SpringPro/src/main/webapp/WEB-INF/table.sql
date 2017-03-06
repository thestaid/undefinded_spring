

//게시판 SQL문
CREATE TABLE board_cafe(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
content CLOB,
viewCount NUMBER,
regdate DATE
);

CREATE SEQUENCE board_cafe_seq NOCACHE;

CREATE TABLE unde_users(
id VARCHAR2(100) PRIMARY KEY, 
pwd VARCHAR2(100) NOT NULL, 
email VARCHAR2(100) NOT NULL,
regdate DATE,
answer NUMBER NOT NULL,
aw VARCHAR2(1000) NOT NULL
);

CREATE SEQUENCE unde_users_seq NOCACHE;
-- 방명록 SQL문

CREATE SEQUENCE visitor_seq NOCACHE;

CREATE TABLE visitor_comment(
num NUMBER PRIMARY KEY,--덧글의 글번호
writer VARCHAR2(100),
content CLOB,
regdate DATE
);
