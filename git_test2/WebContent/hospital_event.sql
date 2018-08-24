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

insert into event values (1, '���彺', '���彺 1ȸ ���',sysdate, 'a',0);

insert into event values (seq_e.nextval, '���彺', '���彺 1ȸ ���',sysdate, 'a',0);

select seq_e.nextval from dual;

create sequence seq_e
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
    
insert into event values (seq_e.nextval, '�ʷ�', '�ʷ� 5ȸ ����',sysdate, 'a',0);
insert into event values (seq_e.nextval, '��������', '�������� 10ȸ ����',sysdate, 'a',0);
insert into event values (seq_e.nextval, '���彺', '���彺 5ȸ ����',sysdate, 'a',0);

drop table event;

--�̺�Ʈ ���� ������
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


insert into event values (1, '[�ʷ�]', '�ʷ� 5ȸ ����',sysdate, '����������',0,154306);
insert into event values (2,  '[��������]', '�������� 10ȸ ����',sysdate, '����������',0,154307);
insert into event values (3, '[���彺]', '���彺 5ȸ ����',sysdate, '����������',0,154308);
insert into event values (4, '[����]', '���� ���!!',sysdate, '����������',0,154309);
insert into event values (5, '[������]', '������ �ȳ��Ͻó���?',sysdate, '����������',0,154310);
insert into event values (6, '[������ ����]', '�����̰� ? ��������!!!',sysdate, '����������',0,154311);
insert into event values (7, '[�������]', '�ʵ����� ? V����!',sysdate, '����������',0,154312);
insert into event values (8, '[��Ʈ��]', '�Ķ�� �����~~~',sysdate, '����������',0,154313); 
insert into event values (9, '[��Ʈ��]', '������ �Ը���~~~',sysdate, '����������',0,154314);
insert into event values (10, '[��+��Ʈ��]', '�մ��� �����~~~',sysdate, '����������',0,154315);
insert into event values (11, '[��������]', '������ �۴�? �۷��� �����~~~',sysdate, '����������',0,154316);


commit;