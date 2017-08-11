-- ****************
-- CONFIRM TABLE
-- update:2017.08.02
-- ****************
SELECT * FROM Tab;
SELECT * FROM Member;
SELECT * FROM Board;
SELECT * FROM Prof;
SELECT * FROM Student;
SELECT * FROM Major;
SELECT * FROM Grade;

-- ****************
-- MEMBER TABLE
-- 2017.08.02
-- 회원 관리 테이블 
-- member_id, pw, ssn, name, regdate,
-- phone, email, major_id, profile
-- ****************

CREATE TABLE Member(
	id VARCHAR2(10),
	pw VARCHAR2(10),
	ssn VARCHAR2(15),
	name VARCHAR2(10),
	regdate DATE,
	PRIMARY KEY(id)
);

ALTER TABLE Member ADD phone VARCHAR2(13);
ALTER TABLE Member ADD email VARCHAR2(20);
ALTER TABLE Member ADD major_id VARCHAR2(10);
ALTER TABLE Member ADD profile VARCHAR2(30);
ALTER TABLE Member RENAME COLUMN id TO member_id;

-- ****************
-- CREATE SEQUENCE article_seq
-- ****************

CREATE SEQUENCE article_seq
	START WITH		1000
	INCREMENT BY	1
	NOCACHE
	NOCYCLE;

DROP SEQUENCE article_seq;
DROP TABLE Member;
DROP TABLE Board;

-- ****************
-- BOARD TABLE
-- 2017.08.02
-- 게시판 관리 테이블 
-- article_seq,member_id,title,content,hitcount,regdate
-- ****************

<!-- BOARD TABLE CREATE -->
CREATE TABLE Board(
	article_seq NUMBER,
	id VARCHAR2(10),
	title VARCHAR2(20),
	content VARCHAR2(100),
	hitcount NUMBER,
	regdate DATE,
	PRIMARY KEY(article_seq),
	FOREIGN KEY(id) REFERENCES Member(id)
	ON DELETE CASCADE
);
ALTER TABLE Board RENAME COLUMN id TO member_id;

-- ****************
-- MAJOR TABLE
-- 2017.08.02
-- 전공 관리 테이블 
-- major_id, title
-- ****************

<!-- MAJOR TABLE CREATE -->
CREATE TABLE Major(
	major_id VARCHAR2(10),
	title VARCHAR2(10),
	PRIMARY KEY(major_id)
);

<!--TABLE ADD FOREIGN KEY -->
ALTER TABLE Member
ADD CONSTRAINT member_fk_major
FOREIGN KEY (major_id)
REFERENCES Major (major_id);


-- ****************
-- SUBJECT TABLE
-- 2017.08.02
-- 과목 관리 테이블 
-- subj_id, title, major_id
-- ****************

<!-- SUBJECT TABLE CREATE -->
CREATE TABLE Subject(
	subj_id VARCHAR2(10),
	title VARCHAR2(10),
	PRIMARY KEY(subj_id)
);
ALTER TABLE Subject ADD major_id VARCHAR2(10);

<!-- TABLE ADD FOREIGN KEY -->
ALTER TABLE Subject
ADD CONSTRAINT subject_fk_major
FOREIGN KEY (major_id)
REFERENCES major (major_id)
ON DELETE CASCADE;

<!-- DROP CONSTRAINT -->
ALTER TABLE Subject
DROP CONSTRAINT subject_fk_major;

-- ****************
-- GRADE TABLE
-- 2017.08.02
-- 성적 관리 테이블 
-- grade_seq, score, exam_date, subj_id, member_id
-- ****************

<!-- GRADE TABLE CREATE -->
CREATE TABLE Grade(
	grade_seq NUMBER,
	score VARCHAR2(10),
	exam_date VARCHAR2(10),
	PRIMARY KEY(grade_seq)
);
ALTER TABLE Grade RENAME COLUMN id TO member_id;
ALTER TABLE Grade ADD subj_id VARCHAR2(10);
ALTER TABLE Grade ADD id VARCHAR2(10);

<!-- TABLE ADD FOREIGN KEY -->
ALTER TABLE Grade
ADD CONSTRAINT grade_fk_subject
FOREIGN KEY (subj_id)
REFERENCES Subject (subj_id)
ON DELETE CASCADE;

ALTER TABLE Grade
ADD CONSTRAINT grade_fk_member
FOREIGN KEY (id)
REFERENCES Member (id)
ON DELETE CASCADE;
	

-- ****************
-- CREATE SEQUENCE article_seq
-- ****************

CREATE SEQUENCE grade_seq
	START WITH		1000
	INCREMENT BY	1
	NOCACHE
	NOCYCLE;

-- ****************
-- PROF TABLE
-- 2017.08.02
-- 교수 관리 테이블 
-- member_id, salary
-- ****************

CREATE TABLE Prof(
	Member_id VARCHAR2(10),
	salary VARCHAR2(10),
	PRIMARY KEY(member_id),
	FOREIGN KEY(member_id) REFERENCES Member(member_id)
	ON DELETE CASCADE
);

-- ****************
-- STUDENT TABLE
-- 2017.08.02
-- 학생 관리 테이블 
-- member_id, stu_no
-- ****************

CREATE TABLE Student(
	Member_id VARCHAR2(10),
	stu_no VARCHAR2(8),
	PRIMARY KEY(member_id),
	FOREIGN KEY(member_id) REFERENCES Member(member_id)
	ON DELETE CASCADE
);


