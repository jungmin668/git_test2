--���̺����
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

--reserve ���̺����
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


--������ ����
create sequence reserve_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

insert into reserve values(reserve_seq.nextval,'���곻��','����', sysdate ,'17��0��','�� �忰','test1',154306);
insert into reserve values(reserve_seq.nextval,'���곻��','����ΰ�', sysdate ,'10��30��','���','test2',154307);
insert into reserve values(reserve_seq.nextval,'���곻��','�Ȱ�', sysdate ,'9��30��','���˷�����','test5',154308);
insert into reserve values(reserve_seq.nextval,'���곻��','�ܰ�', sysdate ,'15��30��','����','test7',154309);
insert into reserve values(reserve_seq.nextval,'���곻��','����', sysdate ,'10��30��','����','test8',154310);
insert into reserve values(reserve_seq.nextval,'���곻��','�Ȱ�', sysdate ,'15��30','����','test11',154311);
insert into reserve values(reserve_seq.nextval,'���곻��','�ܰ�', sysdate ,'15��30��','���˷�����','test80',154312);
insert into reserve values(reserve_seq.nextval,'���곻��','�Ȱ�', sysdate ,'12��10��','����','test00',154313);
insert into reserve values(reserve_seq.nextval,'���곻��','����', sysdate ,'10��30��','���˷�����','test90',154314);
insert into reserve values(reserve_seq.nextval,'���곻��','�Ȱ�', sysdate ,'12��10��','�忰','test99',154315);
insert into reserve values(reserve_seq.nextval,'���곻��','����', sysdate ,'10��30��','��','test91',154316);



commit;