CREATE TABLE point
(
   p_num number(10),
   p_clean number(10),
   p_cvn number(10),
   p_wtime number(10),
   p_visitdate date default sysdate,
   p_kind number(10),
   p_sat number(10),
   p_total number,
   hname varchar2(500),
   dname varchar2(100),
   PRIMARY KEY (p_num),
   foreign key(hname) references hospital_member(mem_name),
   foreign key(dname) references doctor(doc_name)
);

create sequence seq_point
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;

insert into point (p_num, p_clean, p_cvn, p_wtime, p_visitdate, p_total, hname, mem_idx) values (seq_point.nextval, 1,2,3,sysdate, 3, '탑클래스성형외과', 154306);
insert into point (p_num, p_clean, p_cvn, p_wtime, p_visitdate, p_total, hname, mem_idx) values (seq_point.nextval, 3,4,5,sysdate, 5, '탑클래스성형외과', 154306);
insert into point (p_num, p_clean, p_cvn, p_wtime, p_visitdate, p_total, hname, mem_idx) values (seq_point.nextval, 3,4,5,sysdate, 5, '로미안성형외과', 154307);
insert into point (p_num, p_visitdate, p_kind, p_sat, p_total, dname, mem_idx) values (seq_point.nextval, sysdate, 1,2,3,'공유',1);
insert into point (p_num, p_visitdate, p_kind, p_sat, p_total, dname, mem_idx) values (seq_point.nextval, sysdate, 3,4,5,'김태희',2);

alter table point add mem_idx number;

alter table point add foreign key (mem_idx) references hospital_member(mem_idx);

SELECT * FROM ( 
				SELECT Tb.*, rownum rNum FROM ( 
						SELECT P.*
                        FROM point P INNER JOIN hospital_member M
                        ON P.mem_idx = M.mem_idx
                        ORDER BY p_num DESC 
			) Tb 
		 ) 
WHERE (p_cvn IS NOT NULL) and mem_idx=154306;

delete from point where p_num = 24 or p_num=25;

commit;


create table comboard
(
    com_idx number,
    com_id varchar2(50),
    com_content varchar2(1000),
    com_postdate date default sysdate,
    com_bnum number,
    primary key (com_idx)
);