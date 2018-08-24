create table event
(
    e_num number not null,
    e_title varchar2(200) not null,
    e_content varchar2(2000) not null,
    e_postdate date default sysdate,
    e_id varchar2(50) not null,
    e_hits number not null,
    h_name varchar2(200) not null,
        
    primary key(e_num),
    foreign key(e_id) references hospital_member(mem_id),
    foreign key(h_name) references hospital_t(hp_name)
);

drop table event;

insert into event values (1, '보톡스', '보톡스 1회 비용',sysdate, 'a',0);

insert into event values (seq_e.nextval, '보톡스', '보톡스 1회 비용',sysdate, 'a',0);

select seq_e.nextval from dual;

create sequence seq_e
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
    
insert into event values (seq_e.nextval, '필러', '필러 5회 할인',sysdate, 'a',0);
insert into event values (seq_e.nextval, '지방흡입', '지방흡입 10회 할인',sysdate, 'a',0);
insert into event values (seq_e.nextval, '보톡스', '보톡스 5회 할인',sysdate, 'a',0);

drop table event;

--이벤트 관리 쿼리문
create table event
(
    e_num number primary key,
    e_title varchar2(200) not null,
    e_content varchar2(2000) not null,
    e_postdate date default sysdate,
    e_id varchar2(50) not null,
    e_hits number not null,
    h_idx number not null,
         
    foreign key(h_idx) references hospital_member(mem_idx)
);


insert into event values (1, '[필러]', '필러 5회 할인',sysdate, '병원관리자',0,154306);
insert into event values (2,  '[지방흡입]', '지방흡입 10회 할인',sysdate, '병원관리자',0,154307);
insert into event values (3, '[보톡스]', '보톡스 5회 할인',sysdate, '병원관리자',0,154308);
insert into event values (4, '[광대]', '광대 축소!!',sysdate, '병원관리자',0,154309);
insert into event values (5, '[보형물]', '보형물 안녕하시나요?',sysdate, '병원관리자',0,154310);
insert into event values (6, '[곰팡이 제거]', '곰팡이가 ? 보형물에!!!',sysdate, '병원관리자',0,154311);
insert into event values (7, '[돌려깎기]', '너도이제 ? V라인!',sysdate, '병원관리자',0,154312);
insert into event values (8, '[뒷트임]', '파라오 가즈아~~~',sysdate, '병원관리자',0,154313); 
insert into event values (9, '[앞트임]', '눈끼리 입맞춤~~~',sysdate, '병원관리자',0,154314);
insert into event values (10, '[앞+뒷트임]', '왕눈이 가즈아~~~',sysdate, '병원관리자',0,154315);
insert into event values (11, '[가슴성형]', '아직도 작니? 글래머 가즈아~~~',sysdate, '병원관리자',0,154316);


commit;