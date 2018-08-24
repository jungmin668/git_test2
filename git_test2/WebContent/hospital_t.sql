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

INSERT INTO hospital_member VALUES(seq_hp.nextval, '����������', 'žŬ���������ܰ�', null, null, 'a', 'a', '������ ��ġ, �ȸ�����, �ֲ�Ǯ �� ��Ʈ��, ����Ȯ��, �ڼ���, �����ָ�, �������� ����.', '02-567-3456', null, null, '����Ư���� ������ ���ﵿ 820-10', '�۷���Ÿ�� 14��', null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '����������', '�ι̾ȼ����ܰ�', null, null, 'b', 'b', '�簢��, �����, �ְ���, �����Ծ�Ǽ��� �� �����̽�, ��, �ȸ�����, ��������.', '02-566-6623', null, null, '����Ư���� ������ ���ﵿ 820-9','�۶�Ÿ�� 8��', null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '����������', '�伺���ܰ�', null, null, 'c', 'c', '����Ư���� ������ ���ﵿ ��ġ, ��������, �ȸ�����, �ڼ���, �ʷ�, ���彺 �� ���� �ȳ�.', '02-539-1177', null, null, '����Ư���� ������ ���ﵿ 821','����Ÿ�� 11��', null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '����������', '���̽��÷��������ܰ�', null, null, 'd', 'd',  null, null, null, null, '����Ư���� ������ �Ż絿',null, null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '����������', '�׷��强���ܰ�', null, null, 'e', 'e',  null, null, null, null, '����Ư���� ������ �Ż絿',null, null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '����������', '�б����ؼ����ܰ�', null, null, 'f', 'f', '�����, �簢�� ��Ҽ�, �ȸ�����, ������ �� �ڼ��� ���� �����ܰ�.', '02-546-7185', null, null, '����Ư���� ������ �Ż絿 598-6','��ź��� 2��', null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '����������', '�ٸ��������ܰ�', null, null, 'g', 'g', null, null, null, null, '����Ư���� ������ ���ﵿ', null, null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '����������', '������ �����ܰ�', null, null, 'h', 'h', '���� ����, �̼����߸Ÿ���, �źθ��ڱ���, �ȸ��ָ� �� �������Լ� ����.', '02-566-7433', null, null, '����Ư���� ������ ����1�� 820-11', '�ð�ž���� 4��', null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '����������', 'BK���缺���ܰ�', null, null, 'i', 'i', '����Ư���� ������ ������ ��ġ, �ֲ�Ǯ, ��, ����, �ȸ�����, �������� �� ���� �ȳ�.', '1688-8886', null, null, '����Ư���� ������ ������ 1-2', null, null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '����������', '���˼����ܰ�', null, null, 'j', 'j', '������ �Ż絿 ��ġ, �ֲ�Ǯ, �ڼ���, ��������, �ȸ�����, ������ �� ��� ���.', '02-512-1616', null, null, '����Ư���� ������ �Ż絿 580', '�Ƽ��ƺ��� 202ȣ', null);
INSERT INTO hospital_member VALUES(seq_hp.nextval, '����������', '���̼����ܰ�', null, null, 'k', 'k', '�б����� �α� ��ġ, �����ܰ� ��, ��, ��������, �������� �� �ü�.', '02-517-5200', null, null, '����Ư���� ������ �Ż絿 582','û�ڸ޴��ü��� 3��', null);

INSERT INTO hospital_member values (1, '�Ϲ�','1','��','1','1','1','1','1','1','1','1','1','1');
INSERT INTO hospital_member values (2, '�Ϲ�','2','��','2','2','2','2','2','2','2','2','2','2');
select * from hospital_member

commit;