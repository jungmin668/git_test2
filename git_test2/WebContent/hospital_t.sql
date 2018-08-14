CREATE TABLE hospital_t (
  idx number(10) NOT NULL,
  hp_sido varchar(10) NOT NULL,
  hp_gugun varchar(30) NOT NULL,
  hp_genre number(5) NOT NULL,
  hp_genre_name varchar(200) NOT NULL,
  hp_name varchar(100) NOT NULL,
  hp_url varchar(200),
  hp_explain varchar(300),
  hp_tel varchar(20),
  hp_addr varchar(300) NOT NULL,
  hp_naver_x varchar(10) NOT NULL,
  hp_naver_y varchar(10) NOT NULL,
  hp_latitude varchar(20) NOT NULL,
  hp_longitude varchar(20) NOT NULL,
  PRIMARY KEY (hp_name)
);

drop table hospital_t;

INSERT INTO hospital_t (idx, hp_sido, hp_gugun, hp_genre, hp_genre_name, hp_name, hp_url, hp_explain, hp_tel, hp_addr, hp_naver_x, hp_naver_y, hp_latitude, hp_longitude) VALUES(1, '서울', '강남구', 0, '성형외과', '탑클래스성형외과', 'http://openapi.naver.com/l?AAAC2LywqDMBREv2bcCJKHKfcuXCRp+h9BUwQFU5si/n1TKQzMcDjz+qT9HBA8qAf732ALRy1CLQE2CA6kYOkiBta3f91JhDuYLqn+uP4uScP5ppw5Des2xrVZ0jmwkDFFYtNTrwWZqJUScrpJLSaZmJt5T89hLiVDW6hHzXEcXdl', '강남구 위치, 안면윤곽, 쌍꺼풀 및 앞트임, 가슴확대, 코성형, 눈밑주름, 지방흡입 전문.', '02-567-3456', '서울특별시 강남구 역삼동 820-10 글래스타워 14층', '314226', '544529', '127.0277178', '37.4988576');
INSERT INTO hospital_t (idx, hp_sido, hp_gugun, hp_genre, hp_genre_name, hp_name, hp_url, hp_explain, hp_tel, hp_addr, hp_naver_x, hp_naver_y, hp_latitude, hp_longitude) VALUES(2, '서울', '강남구', 0, '성형외과', '로미안성형외과', 'http://openapi.naver.com/l?AAAC2LywqDMBREv2bcCJKHlnsXWSRp+h9BUyzaaoNF/PumUhiY4XDm/Un5MAge1IL9b7CFoxqhlAB3CA6kYOkkHayv/7qTCFcwnVL5cfmdkobz1XasycxLH+dqSodhIWOKxF1LrRbURa2UkMNFajHIxFyNOd3NuG0rtIW6lez73uT', '사각턱, 광대뼈, 주걱턱, 돌출입양악수술 및 지방이식, 코, 안면윤곽, 가슴성형.', '02-566-6623', '서울특별시 강남구 역삼동 820-9 글라스타워 8층', '314214', '544526', '127.0276526', '37.4989949');
INSERT INTO hospital_t (idx, hp_sido, hp_gugun, hp_genre, hp_genre_name, hp_name, hp_url, hp_explain, hp_tel, hp_addr, hp_naver_x, hp_naver_y, hp_latitude, hp_longitude) VALUES(3, '서울', '강남구', 0, '성형외과', '뷰성형외과', 'http://openapi.naver.com/l?AAAC2L2wrCMBBEv2b7IpRcGtl9yEMS43+EdKXFamuphv69sQgDMxzOvN687hZiAOyAwm+QA48niLUEkIHoARU4PIgBF05/3UuIFyA8pPqj+jskDT40276wneacpubOuyUhEyck02GnBZqklRKyP0steslEzbDyzQ7btoB2oK41pZT', '서울특별시 강남구 역삼동 위치, 가슴성형, 안면윤곽, 코성형, 필러, 보톡스 등 진료 안내.', '02-539-1177', '서울특별시 강남구 역삼동 821 이즈타워 11층', '314238', '544496', '127.0278851', '37.4985706');
INSERT INTO hospital_t (idx, hp_sido, hp_gugun, hp_genre, hp_genre_name, hp_name, hp_url, hp_explain, hp_tel, hp_addr, hp_naver_x, hp_naver_y, hp_latitude, hp_longitude) VALUES(4, '서울', '강남구', 0, '성형외과', '페이스플러스성형외과', '1', '1', '1', '서울특별시 강남구 신사동', '314278', '547243', '127.0285116', '37.5228473');
INSERT INTO hospital_t (idx, hp_sido, hp_gugun, hp_genre, hp_genre_name, hp_name, hp_url, hp_explain, hp_tel, hp_addr, hp_naver_x, hp_naver_y, hp_latitude, hp_longitude) VALUES(5, '서울', '강남구', 0, '성형외과', '그랜드성형외과', '1', '1', '1', '서울특별시 강남구 신사동', '314292', '547434', '127.0285116', '37.5228473');
INSERT INTO hospital_t (idx, hp_sido, hp_gugun, hp_genre, hp_genre_name, hp_name, hp_url, hp_explain, hp_tel, hp_addr, hp_naver_x, hp_naver_y, hp_latitude, hp_longitude) VALUES(6, '서울', '강남구', 0, '성형외과', '압구정앤성형외과', 'http://openapi.naver.com/l?AAAC2LywqDMBREv2bcCJKHlnsXWSRp+h9BU4TaaiVF8vdNpTAww+HM+5P2YhA8qAf732ALRy1CLQEeEBxIwdJJBljf/nUnEa5gOqX64/o7JQ3nm1y2ZJZ1jEvzSMWwkDFF4qGnXgsaolZKyOkitZhkYm7mPd3NnPMGbaFuNcdxdK9', '광대뼈, 사각턱 축소술, 안면윤곽, 눈성형 등 코성형 전문 성형외과.', '02-546-7185', '서울특별시 강남구 신사동 598-6 삼신빌딩 2층', '314330', '547211', '127.0285796', '37.5230340');
INSERT INTO hospital_t (idx, hp_sido, hp_gugun, hp_genre, hp_genre_name, hp_name, hp_url, hp_explain, hp_tel, hp_addr, hp_naver_x, hp_naver_y, hp_latitude, hp_longitude) VALUES(7, '서울', '강남구', 0, '성형외과', '줄리엣성형외과', '1', '1', '1', '서울특별시 강남구 역삼동', '314134', '544756', '127.0374841', '37.5002891');

commit;

create table doctor(
    doc_name varchar2(100) primary key,
    doc_major varchar2(500),
    doc_gender varchar2(5),
    doc_age number(10),
    doc_career varchar2(1000),
    doc_sc varchar2(1000),
    hp_name varchar2(500) references
        hospital_t(hp_name)
);

create table point (

    p_num number(10) primary key,
    p_clean number(10),
    p_cvn number(10),
    p_wtime number(10),
    p_visitdate varchar2(100),
    p_kind number(10),
    p_sat number(10),
    p_total number(10),
    hname varchar2(500) references
        hospital_t(hp_name),
    dname varchar2(100) references
        doctor(doc_name)
);

commit;