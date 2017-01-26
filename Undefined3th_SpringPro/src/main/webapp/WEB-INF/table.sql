//게시판 SQL문
CREATE TABLE member_board(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
content CLOB,
viewCount NUMBER,
regdate DATE
);

CREATE SEQUENCE member_board_seq NOCACHE;