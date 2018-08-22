create table hospital_member
(
    mem_flag varchar2(15),
    mem_name varchar2(30) ,
    mem_gender varchar2(10),
    mem_bir varchar2(20),
    mem_id varchar2(30) not null,
    mem_pass varchar2(30) ,
    mem_dis varchar2(50),
    mem_int varchar2(50),
    tel varchar2(20),
    mobile varchar2(20) ,
    zipcode char(30) ,
    addr1 varchar2(100) ,
    addr2 varchar2(200) ,
    email varchar2(50) ,
         
    primary key (mem_id)
);

commit;
drop table hospital_member;

alter table hospital_member add h_name varchar2(200);

alter table hospital_member add constraint fk_hospital foreign key (h_idx) references hospital_t(idx);

alter table hospital_member rename column h_name to h_idx;
alter table hospital_member modify h_idx number;

commit;