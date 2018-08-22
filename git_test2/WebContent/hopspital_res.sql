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
commit;