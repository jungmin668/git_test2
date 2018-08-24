--테이블생성
create table reserve(
res_num number primary key,
res_hname varchar(100) not null,
res_sub varchar(50) not null,
res_time varchar(50) not null,
res_note varchar(1000) not null,
res_id varchar(100) not null
);

drop table reserve;

alter table reserve add h_idx number;
alter table reserve add res_date date;
alter table reserve add foreign key (h_idx) references hospital_t(idx);

--reserve 테이블생성
create table reserve(
res_num number primary key,
res_hname varchar(100) not null,
res_sub varchar(50) not null,
res_date varchar(50) not null,
res_time varchar(50) not null,
res_note varchar(1000) not null,
res_id varchar(100) not null,
h_idx number,
foreign key (h_idx) references hospital_member(mem_idx)
);


--시퀀스 생성
create sequence reserve_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

insert into reserve values(reserve_seq.nextval,'가산내과','내과', sysdate ,'17시0분','비염 장염','test1',154306);
insert into reserve values(reserve_seq.nextval,'가산내과','산부인과', sysdate ,'10시30분','출산','test2',154307);
insert into reserve values(reserve_seq.nextval,'가산내과','안과', sysdate ,'9시30분','눈알레르기','test5',154308);
insert into reserve values(reserve_seq.nextval,'가산내과','외과', sysdate ,'15시30분','골절','test7',154309);
insert into reserve values(reserve_seq.nextval,'가산내과','내과', sysdate ,'10시30분','골절','test8',154310);
insert into reserve values(reserve_seq.nextval,'가산내과','안과', sysdate ,'15시30','골절','test11',154311);
insert into reserve values(reserve_seq.nextval,'가산내과','외과', sysdate ,'15시30분','눈알레르기','test80',154312);
insert into reserve values(reserve_seq.nextval,'가산내과','안과', sysdate ,'12시10분','골절','test00',154313);
insert into reserve values(reserve_seq.nextval,'가산내과','내과', sysdate ,'10시30분','눈알레르기','test90',154314);
insert into reserve values(reserve_seq.nextval,'가산내과','안과', sysdate ,'12시10분','장염','test99',154315);
insert into reserve values(reserve_seq.nextval,'가산내과','내과', sysdate ,'10시30분','비염','test91',154316);



commit;