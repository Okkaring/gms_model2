-- ************************************************
--  2017.08.02
-- [1]MAJOR_TAB
-- [2]SUBJECT_TAB
-- [3]MEMBER_TAB
-- [4]PROF_TAB
-- [5]STUDENT_TAB
-- [6]GRADE_TAB
-- [7]BOARD_TAB
-- ************************************************

-- ************************************************
-- [0]CREATE SEQUENCE article_seq
-- ************************************************
CREATE SEQUENCE seq
 START WITH 	2000
 INCREMENT BY 	1
 NOCACHE
 NOCYCLE;
 
DROP SEQUENCE article_seq;
DROP SEQUENCE grade_seq;
 -- ************************************************
-- [1]MAJOR_TAB
-- 2017.08.02
-- 전공 관리 테이블 
-- major_id, title
-- ************************************************
-- DDL
<!-- MAJOR TABLE CREATE -->
alter table major add subj_id varchar2(10);
alter table major add member_id varchar2(10);
CREATE TABLE Major(
	major_id VARCHAR2(10),
	title VARCHAR2(10),
	PRIMARY KEY(major_id)
);

-- DML
INSERT INTO Major(major_id, title) VALUES('','');
SELECT * FROM Major;
SELECT * FROM MEMBER;
SELECT * FROM Subject;
SELECT * FROM Student;

-- ************************************************
-- [2]SUBJECT_TAB
-- 2017.08.02
-- 과목 관리 테이블 
-- subj_id, title, major_id
-- ************************************************
-- DDL
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

-- DML
INSERT INTO Subject(subj_id, title, major_id) VALUES('','','');
SELECT * FROM Subject;


-- ************************************************
-- [3]MEMBER_TAB
-- 2017.08.02
-- 회원 관리 테이블 
-- member_id, pw, ssn, name, regdate,
-- phone, email, major_id, profile
-- ************************************************
-- DDL
CREATE TABLE Member(
	member_id VARCHAR2(10),
	pw VARCHAR2(10),
	ssn VARCHAR2(15),
	name VARCHAR2(10),
	regdate DATE,
	phone VARCHAR2(13),
	email VARCHAR2(20),
	major_id VARCHAR2(10),
	PRIMARY KEY(member_id)
);

ALTER TABLE Member ADD profile VARCHAR2(30);
ALTER TABLE Member RENAME COLUMN id TO member_id;

--TABLE ADD FOREIGN KEY
ADD CONSTRAINT member_fk_major
FOREIGN KEY (major_id)
REFERENCES Major (major_id);

--DML
INSERT INTO Member(member_id, pw, ssn, name, regdate,phone,email,major_id, profile)
VALUES('mankiew', '1', '701201-123456', '맨큐', SYSDATE, '010-1234-5678', 'mankiew@test.com', 'economics', 'mankiew.jpg');

SELECT * FROM Member;
SELECT * FROM Member WHERE member_id = '';
SELECT COUNT(*) AS count FROM Member;
SELECT * FROM Member ORDER BY ssn, name;

SELECT * FROM Member m, Board b WHERE m.id = b.id;
SELECT * FROM Member m, Board b WHERE m.id = b.id ORDER BY b.article_seq;
SELECT * FROM Member m, Board b, Grade g WHERE m.id = b.id AND m.id = g.id;
SELECT DISTINCT ssn,name FROM Member m, Board b WHERE m.id = b.id AND ROWNUM >= 4;

UPDATE Member SET password='' WHERE id='';
UPDATE Member SET phone = '010-1234-4567' WHERE id='';



-- ****************************************************************
-- [4]PROF_TAB
-- 2017.08.02
-- 교수 관리 테이블 
-- member_id, salary
-- ****************************************************************
--DDL
DROP TABLE Prof;
CREATE TABLE Prof(
	Member_id VARCHAR2(10),
	salary VARCHAR2(10),
	PRIMARY KEY(member_id),
	FOREIGN KEY(member_id) REFERENCES Member(member_id)
	ON DELETE CASCADE
);
--DML
	INSERT INTO Prof(Member_id,salary) VALUES('mankiew', '12000');
	INSERT INTO Prof(Member_id,salary) VALUES('james', '50000');
	INSERT INTO Prof(Member_id,salary) VALUES('bear', '8000');
	INSERT INTO Prof(Member_id,salary) VALUES('gogh', '5000');

SELECT * FROM Prof;
SELECT * FROM prof p, member m WHERE p.member_id = m.member_id;

-- ****************************************************************
-- [5]STUDENT_TAB
-- 2017.08.02
-- 학생 관리 테이블 
-- member_id, stu_no('학번 + 더미값')
-- ****************************************************************
--DDL
<!-- CREATE TABLE Student(
	Member_id VARCHAR2(10),
	stu_no VARCHAR2(8),
	PRIMARY KEY(member_id),
	FOREIGN KEY(member_id) REFERENCES Member(member_id)
	ON DELETE CASCADE
);
-- DML
INSERT INTO Student(member_id, stu_no) VALUES('inkang','20137015');
SELECT * FROM Student;
SELECT * FROM Student s, Member m WHERE s.member_id = m.MEMBER_ID;
SELECT COUNT(*) FROM Student s, Member m WHERE s.member_id = m.MEMBER_ID; -->

--CREATE VIEW TABLE
create view student (num,id,ssn,name,phone,email,title,regdate)
as
select rownum, t.id, t.ssn, t.name, t.phone, t.email, t.title, t.regdate
from (
    select a.member_id id, a.name name, rpad(substr(a.ssn,1,8),14,'*') ssn, a.phone phone, a.email email,
    	listagg(s.title, ',') within group (order by s.title) title,to_char(a.regdate,'yyyy-MM-dd') regdate 
    from member a
        left join major m on a.member_id = m.member_id
        left join subject s on m.subj_id = s.subj_id
    group by a.member_id, a.name, a.ssn, a.phone, a.email,a.regdate  
    order by a.regdate
) t
    order by rownum desc;

select * from student;
--drop view student;



-- ****************************************************************
-- [6]GRADE_TABLE
-- 2017.08.02
-- 성적 관리 테이블 
-- grade_seq, score, exam_date, subj_id, member_id
-- ****************************************************************
-- DDL
<!-- GRADE TABLE CREATE -->
CREATE TABLE Grade(
	grade_seq NUMBER,
	score VARCHAR2(10),
	exam_date VARCHAR2(10),
	PRIMARY KEY(grade_seq),
	FOREIGN KEY(member_id) REFERENCES Member(member_id)
	ON DELETE CASCADE
);

ALTER TABLE Grade RENAME COLUMN id TO member_id;
ALTER TABLE Grade ADD subj_id VARCHAR2(10);
ALTER TABLE Grade ADD id VARCHAR2(10);

<!-- TABLE ADD FOREIGN KEY -->
ALTER TABLE Grade
ADD CONSTRAINT grade_fk_subject
FOREIGN KEY (subj_id) REFERENCES Subject (subj_id)
ON DELETE CASCADE;

ALTER TABLE Grade
ADD CONSTRAINT grade_fk_member
FOREIGN KEY (member_id) REFERENCES Member (member_id)
ON DELETE CASCADE;

-- DML
INSERT INTO Grade(grade_seq, score, exam_date, subj_id, member_id) VALUES(seq.nextval,'90','2017-03','java','bomb');

SELECT * FROM Grade;

SELECT DISTINCT
m.member_id, m.name, mj.title AS major, g.score, sj.title AS subject, g.exam_date
FROM Member m, Student s, Grade g, Subject sj, Major mj 
WHERE
    m.member_id = s.member_id
    AND m.member_id = g.member_id
    AND sj.major_id = mj.major_id
    AND sj.subj_id = g.subj_id
ORDER BY m.member_id,g.exam_date;

-- member_id 를 입력하면 avg 평균점수를 반환하는 sql
SELECT avg(score)
FROM (SELECT DISTINCT
	 m.member_id id, m.name, mj.title major, g.score, sj.title subject, g.exam_date
FROM Member m, Student s, Grade g, Subject sj, Major mj 
WHERE
	 m.member_id = s.member_id
	 AND m.member_id = g.member_id
	 AND sj.major_id = mj.major_id
	 AND sj.subj_id = g.subj_id)t
WHERE t.id = 'bomb';

-- INNER JOIN
SELECT avg(score)
FROM (SELECT
	 m.member_id id, m.name name, g.score score, g.exam_date exam_date
FROM Grade g
inner join Subject s ON g.subj_id = s.subj_id
inner join Member m ON m.member_id = g.member_id
)t
WHERE t.id = 'bomb';

-- GROUP BY & ORDER BY
SELECT avg(score)
FROM (SELECT
	 m.member_id id, m.name name, g.score score, g.exam_date exam_date
FROM Grade g
INNER JOIN Subject s ON g.subj_id = s.subj_id
INNER JOIN Member m ON m.member_id = g.member_id
)t
GROUP BY t.id
HAVING avg (score)>=50
ORDER BY avg (score) desc
;
-- ROWNUM
SELECT ROWNUM NO,t2.*
FROM(SELECT t.id id, avg(score) avg
    FROM (SELECT
        m.member_id id, g.score score
        FROM Grade g
            inner join Subject s ON g.subj_id = s.subj_id
            inner join Member m ON m.member_id = g.member_id
    )t
    group by t.id
    order by avg (score) desc
)t2
WHERE ROWNUM < 4
;


-- member_id 를 입력하면 해당 아이디가 쓴 게시글 나오는 sql 
SELECT * FROM Board b inner join member m
ON b.member_id = m.member_id
WHERE m.member_id='bomb';

-- ****************************************************************
-- [7]BOARD_TAB
-- 2017.08.02
-- 게시판 관리 테이블 
-- article_seq,member_id,title,content,hitcount,regdate
-- ****************************************************************
--DDL
CREATE TABLE Board(
	article_seq NUMBER,
	member_id VARCHAR2(10),
	title VARCHAR2(20),
	content VARCHAR2(100),
	hitcount NUMBER,
	regdate DATE,
	PRIMARY KEY(article_seq),
	FOREIGN KEY(id) REFERENCES Member(id)
	ON DELETE CASCADE
);
ALTER TABLE Board RENAME COLUMN id TO member_id;

--DML
INSERT INTO Board(article_seq,member_id,title,content,hitcount,regdate)
VALUES(seq.nextval,'cream','냐옹','난 아이스크림따위는 먹지않아.',0,SYSDATE);

SELECT * FROM Board;
SELECT * FROM Board WHERE member_id='hon';
SELECT COUNT(*) AS count FROM Board;
SELECT member_id FROM Board WHERE title LIKE '%안녕%';
SELECT DISTINCT member_id FROM Board WHERE member_id LIKE '%_o%';
SELECT SUM(article_seq) 총합 FROM Board;

UPDATE Board SET title='수정업뎃',content='업뎃내용' WHERE article_seq='1020';

DELETE FROM Board WHERE article_seq='1020';


-- ****************************************************************
-- CONFIRM TABLE
-- update:2017.08.02
-- ****************************************************************
SELECT * FROM Tab;
SELECT * FROM Member;
SELECT * FROM Board;
SELECT * FROM Prof;
SELECT * FROM Major;
SELECT * FROM Subject;
SELECT * FROM Grade;