create database sbi;
use sbi;
create table customer(customer_name varchar(15) not null unique,customer_street varchar(12) not null, 
customer_city varchar(15) not null, primary key(customer_name));
create table account(account_number varchar(15) not null unique, branch_name varchar(12) not null,loan varchar(15) not null,
primary key(account_number));
create table loan(loan_number varchar(15) not null unique, branch_name varchar(12) not null,
 balance varchar(15) not null, primary key(loan_number));
 create table branch(branch_name varchar(15) not null unique, branch_city varchar(12) not null,
 amount varchar(15) not null, primary key(branch_name)); 
create table depositor(customer_name varchar(15) not null,
 account_number varchar(15) not null unique,primary key (customer_name,account_number),
 foreign key(account_number) references account(account_number),
 foreign key (customer_name) references customer(customer_name));
 create table borrower(customer_name varchar(15) not null unique, 
 loan_number varchar(12) not null unique, 
 primary key(customer_name,loan_number),foreign key(loan_number)  references loan (loan_number),
 foreign key (customer_name) references customer(customer_name));
 
 insert into account values('A-101','Downtown',500); 
 insert into account values('A-215','mianus',700);
 insert into account values('A-102','perryridge',400);
 insert into account values('A-305','round hil',350);
 insert into account values('A-201','perryridge',900);
 insert into account values('A-222','redwood',700);
 select *from account;
 
 
 insert into branch values('downtown','brooklyn',900000);
 insert into branch values('redwood','paloalto',2100000);
 insert into branch values('perrybridge','horseneck',1700000);
 insert into branch values('mianus','horseneck',400200);
 insert into branch values('roundhill','horeseneck',8000000);
 select *from branch;
 
 
insert into customer values('jones','main','harrison');	
insert into customer values('smith','main','rye');		
insert into customer values('hayes','main','harrison');	
insert into customer values('curry','north','rye');	
insert into customer values('lindsay','park','pittsfield');
insert into customer values('turner','putuam','stamford');
insert into customer values('jonhson','north','rye');
insert into customer values('jackson','north','rye');
select *from customer; 

insert into loan values('L-17','DOWNTOUN',1000);
insert into loan values('L-23','REDWOOD',2000);
insert into loan values('L-15','PERRYBRIDGE',1500);
insert into loan values('L-14','DOWNTOWN',1500);
insert into loan values('L-93','MAINUS',500);
insert into loan values('L-11','ROUND HILL',900);
insert into loan values('L-20','PERRYBRIDGE',1500);
insert into loan values('L-27','DOWNTOUN',null);
insert into loan values('L-22','round hill',0);


SELECT *FROM LOAN;
SELECT *FROM depositor;
insert into depositor values('smith','A-215');
insert into depositor values('hayes','A-102');
insert into depositor values('hayes','A-101');
insert into depositor values('turner','A-305');
insert into depositor values('jones','A-201');

select *from borrower;

insert into borrower values('jones','L-17');
insert into borrower values('hayes','L-15');
insert into borrower values('jackson','L-14');
insert into borrower values('curry','L-93');
insert into borrower values('smith','L-11');

select *from branch;

select branch_name from loan;

select loan_number from loan
where
balance is null;
select *from loan;
alter table loan modify balance numeric(10) null;
select loan_number from loan where balance is null;
alter table branch add assests varchar(15);

select customer_name,loan_number,balance from borrower natural join loan;

select customer_name,loan_number,balance from borrower natural join loan where branch_name = "perrybridge";

select customer_name,loan_number,balance from borrower natural join loan;

select distinct T.branch_name from branch as T,branch as S where T.assets>S.assets and S.branch_city='brooklyn';


select distinct T.branch_name from branch T, branch S where T.assets > S.assets and S.branch_city ='brooklyn';

select *from branch;

select customer_name from customer where customer_street like "%main%";
select customer_name from customer where customer_street="main";

select distinct customer_name from borrower,loan where borrower.loan_number=loan.loan_number and branch_name = 'perrybridge' order by customer_name;


use sbi;
create view cust_account as select customer_name,account_number,branch_name,balance from customer,account;
