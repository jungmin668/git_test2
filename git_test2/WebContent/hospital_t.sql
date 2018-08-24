ALTER TABLE hospital_member
         DROP primary key CASCADE;

alter table hospital_member add primary key (mem_idx);
         
alter table hospital_t add primary key (idx);

ALTER TABLE hospital_member
         DROP primary key CASCADE;
alter table doctor add doc_id number;

alter table doctor add primary key (doc_id);

alter table doctor rename column hp_name to h_idx;
alter table doctor modify h_idx number;
commit;
alter table doctor add foreign key (h_idx) references hospital_t(idx);

create sequence seq_hp
    increment by 1
    start with 154300 
    nomaxvalue
    nocycle
    nocache;
   
drop table hospital_member;
create table hospital_member
(
    mem_idx number ,    
    mem_flag varchar2(30),
    mem_name varchar2(30) ,
    mem_gender varchar2(10),
    mem_bir varchar2(20),
    mem_id varchar2(30) not null,
    mem_pass varchar2(30) not null,
    mem_dis varchar2(50), 
    tel varchar2(30),
    mobile varchar2(30) ,
    zipcode varchar2(15) ,
    addr1 varchar2(100) ,
    addr2 varchar2(200) ,
    email varchar2(50) ,
    
    
    primary key (mem_idx) 
);
delete from hospital_member;

alter table hospital_member modify mem_dis varchar2(500);

INSERT INTO hospital_member VALUES(seq_hp.nextval, '병원관리자', '탑클래스성형외과', null, null, 'a', 'a', '강남구 위치, 안면윤곽, 쌍꺼풀 및 앞트임, 가슴확대, 코성형, 눈밑주름, 지방흡입 전문.', '02-567-3456', null, null, '서울특별시 강남구 역삼동 820-10', '글래스타워 14층', null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '병원관리자', '로미안성형외과', null, null, 'b', 'b', '사각턱, 광대뼈, 주걱턱, 돌출입양악수술 및 지방이식, 코, 안면윤곽, 가슴성형.', '02-566-6623', null, null, '서울특별시 강남구 역삼동 820-9','글라스타워 8층', null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '병원관리자', '뷰성형외과', null, null, 'c', 'c', '서울특별시 강남구 역삼동 위치, 가슴성형, 안면윤곽, 코성형, 필러, 보톡스 등 진료 안내.', '02-539-1177', null, null, '서울특별시 강남구 역삼동 821','이즈타워 11층', null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '병원관리자', '페이스플러스성형외과', null, null, 'd', 'd',  null, null, null, null, '서울특별시 강남구 신사동',null, null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '병원관리자', '그랜드성형외과', null, null, 'e', 'e',  null, null, null, null, '서울특별시 강남구 신사동',null, null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '병원관리자', '압구정앤성형외과', null, null, 'f', 'f', '광대뼈, 사각턱 축소술, 안면윤곽, 눈성형 등 코성형 전문 성형외과.', '02-546-7185', null, null, '서울특별시 강남구 신사동 598-6','삼신빌딩 2층', null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '병원관리자', '줄리엣성형외과', null, null, 'g', 'g', null, null, null, null, '서울특별시 강남구 역삼동', null, null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '병원관리자', '더블유 성형외과', null, null, 'h', 'h', '가슴 성형, 미세이중매몰법, 매부리코교정, 안면주름 및 지방주입술 전문.', '02-566-7433', null, null, '서울특별시 강남구 역삼1동 820-11', '시계탑빌딩 4층', null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '병원관리자', 'BK동양성형외과', null, null, 'i', 'i', '서울특별시 강남구 논현동 위치, 쌍꺼풀, 코, 유방, 안면윤곽, 지방흡입 등 진료 안내.', '1688-8886', null, null, '서울특별시 강남구 논현동 1-2', null, null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '병원관리자', '레알성형외과', null, null, 'j', 'j', '강남구 신사동 위치, 쌍꺼풀, 코성형, 가슴성형, 안면윤곽, 가상성형 등 비용 상담.', '02-512-1616', null, null, '서울특별시 강남구 신사동 580', '아세아빌딩 202호', null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '병원관리자', '세미성형외과', null, null, 'k', 'k', '압구정역 인근 위치, 성형외과 눈, 코, 가슴성형, 지방흡입 등 시술.', '02-517-5200', null, null, '서울특별시 강남구 신사동 582','청박메니컬센터 3층', null);

INSERT INTO hospital_member values (1, '일반','1','남','1','1','1','1','1','1','1','1','1','1');
INSERT INTO hospital_member values (2, '일반','2','여','2','2','2','2','2','2','2','2','2','2');
select * from hospital_member

commit;