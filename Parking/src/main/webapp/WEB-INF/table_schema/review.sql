create table reviewBoard(
review_num number not null,
review_title varchar2(100) not null,
review_content varchar2(1000) not null,
review_date date,
mem_num number,
park_id number,
park_name varchar2(100),
img varchar2(100),
constraint review_num_pk primary key (review_num),
constraint park_id_review_fk foreign key (park_id) references parking (park_id),
constraint mem_num_review_fk foreign key (mem_num) references member (mem_num)
);


create sequence review_seq nocache nocycle;
drop sequence review_seq;

select* from reviewBoard;
drop table reviewBoard;