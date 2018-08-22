ALTER TABLE hospital_member
         DROP primary key CASCADE;

alter table hospital_member add primary key (mem_id);
         
alter table hospital_t add primary key (idx);

ALTER TABLE doctor
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
    mem_pass varchar2(30) ,
    mem_dis varchar2(50), 
    tel varchar2(30),
    mobile varchar2(30) ,
    zipcode varchar2(15) ,
    addr1 varchar2(100) ,
    addr2 varchar2(200) ,
    email varchar2(50) ,
    
    
    primary key (mem_id) 
);
delete from hospital_member;
commit;