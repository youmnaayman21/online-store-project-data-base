-- CREATE ..

CREATE TABLE DELIVERY
(
tracking_no varchar(50) PRIMARY KEY,
shipping_type varchar(50) NOT NULL,
customer_location varchar(50) NOT NULL,
no_of_items int NOT NULL,
)
CREATE TABLE LOGIN
(
user_id VARCHAR(10) primary key,
username varchar(50) not null,
password varchar(100)not null,
email varchar(50)not null
)
CREATE TABLE ADMIN
(
admin_Id int primary key not null,
admin_name varchar(50)not null,
admin_role varchar(50)not null,
admin_email varchar(50) not null, 
user_id varchar(10) FOREIGN KEY REFERENCES LOGIN (user_id) ,
)
CREATE TABLE CUSTOMER
(
cus_id varchar(50)  PRIMARY KEY ,
gender varchar(50)  NULL ,
cus_name varchar(1000) Not NULL,
Address varchar(50) Not NULL,
username varchar(50) NOT NULL,
tracking_no varchar(50) NOT NULL FOREIGN KEY REFERENCES DELIVERY (tracking_no),
admin_id int not null foreign key references ADMIN (admin_Id),
user_id VARCHAR(10) null foreign key references LOGIN (user_id), 
)
CREATE TABLE CART
(
cart_id int PRIMARY KEY,
no_of_items int NOT NULL,
total_cost int NOT NULL,
arriaval_date date NOT NULL,
) 
CREATE TABLE PAYMENT
(
payment_id int PRIMARY KEY  ,
cus_id varchar(50) NOT NULL FOREIGN KEY REFERENCES CUSTOMER (cus_id),
cart_id int NOT NULL FOREIGN KEY REFERENCES CART (cart_id),
cash int  NULL,
visa varchar(50) NULL,
payment_amount int NULL ,
)
CREATE TABLE CATEGORY
(
category_id varchar(50) PRIMARY KEY,
gender varchar(50) NOT NULL ,
category_name varchar(1000) NULL,
)
CREATE TABLE WAREHOUSE
( 
id INT PRIMARY KEY ,
section_name varchar(50) ,
item_quality int not null,
import_date date not null,
Export_date date not null,
)
CREATE TABLE PRODUCT
(
prod_code int PRIMARY KEY,
image image  NULL ,
price int NOT NULL ,
quantity int not NULL,
size int not null,
material varchar(50)  null,
model varchar(50)  null,
category_id varchar(50) NOT NULL FOREIGN KEY REFERENCES CATEGORY (category_id),
product_review int not null,
id INT FOREIGN KEY REFERENCES WAREHOUSE (id),
admin_Id INT FOREIGN KEY REFERENCES Admin (admin_id),
section_name varchar(50)  null,
)
--*********************************************************
 -- TABLES MANY TO MANY

CREATE TABLE CUS_PROD 
(
cus_prod_id int PRIMARY KEY NOT NULL ,
cus_id varchar(50) FOREIGN KEY REFERENCES CUSTOMER (cus_id) ,
prod_code int FOREIGN KEY REFERENCES PRODUCT (prod_code)
)
CREATE TABLE PROD_DELV 
(
prod_delv_id  int PRIMARY KEY NOT NULL ,
tracking_no varchar(50) NOT NULL FOREIGN KEY REFERENCES DELIVERY (tracking_no),
prod_code int FOREIGN KEY REFERENCES PRODUCT (prod_code)
)
CREATE TABLE CART_PROD
(
cart_prod_id  VARCHAR(50) PRIMARY KEY NOT NULL ,
cart_id int FOREIGN KEY REFERENCES CART (cart_id) ,
prod_code int FOREIGN KEY REFERENCES PRODUCT (prod_code)
)
CREATE TABLE CUS_EMAIL 
(
cus_id varchar(50)   , 
 email varchar(50) NOT NULL  ,
FOREIGN KEY (cus_id) REFERENCES CUSTOMER(cus_id),
);
CREATE TABLE CUS_PHONE 
(
cus_id varchar(50)   , 
 phone varchar(50) NOT NULL ,
FOREIGN KEY (cus_id) REFERENCES CUSTOMER(cus_id),
);

  --*************************************************************************
      -- INSERT ..
	  
insert into DELIVERY (tracking_no, shipping_type,customer_location ,no_of_items)
values ('1010', 'local','cairo', '1'),
       ('2020', 'express','tanta', '5'),
       ('3030', 'sameday','alexandria', '10'),
       ('4040', 'express','cairo', '9'),
       ('5050', 'local','cairo', '21'),
       ('6060', 'overnight','banha', '4'),
       ('7070', 'sameday','beni suef', '2'),
       ('8080', 'express','mansora', '7'),
       ('9090', 'local','cairo', '6'),
       ('9999', 'express','cairo', '9'),
	   ('1111', 'local','cairo', '1'),
       ('2222', 'express','tanta', '5'),
       ('3333', 'sameday','alexandria', '10'),
       ('4444', 'express','benisuef', '9'),
       ('5555', 'local','cairo', '21'),
       ('6666', 'overnight','banha', '4'),
       ('7777', 'sameday','beni suef', '2'),
       ('8888', 'express','mansora', '7'),
       ('9900', 'local','cairo', '6'),
       ('1002', 'express','cairo', '9');

	   insert into LOGIN (user_id, username, password, email)
values   ('C1','habibakhaled','2004','habibakhaled@gmail.com'),
         ('C2','samagmal','sama123','samagmal@gmail.com'),
         ('C3','fares345','fares','fares345@gmail.com'),
         ('C4', 'mohammed','mkhl','mohammed@gmail.com'),
         ('C5', 'haneenNagaty','haneen2003','haneenNagaty@gmail.com'),
         ('C6', 'Eliasine2019','2011','Eliasine2019@gmail.com'),
         ('C7', 'hameda','hameda12','hameda@gmail.com'),
         ('C8','Ibrahim','abcd','Ibrahim@gmail.com'),
         ('C9','Mahmoud','mahth','Mahmoud@gmail.com'),
         ('C10','salman','xyz','salman@gmail.com'),
		 ('A111','muh1','01123456789','muhammed_gamal@gmail.com'),
		 ('A222','kar1','0122345678','kareem_nagaty@gmail.com'),
		 ('A333','bas1','01234456789','basmala_omar@gmail.com'),
		 ('A444','yass1','01233456789','yaseen_mahmoud@gmail.com'),
		 ('A555','zein1','01234556789','zienab_khaled@gmail.com'),
		 ('A666','sal1','01234566789','salma_mohamed@gmail.com'),
		 ('A777','yas1','01223456778','yasmen_hemdan@gmail.com'),
		 ('A888','hab1','012344567889','habiba_khaled@gmail.com'),
		 ('A999','nad1','012334567899','nada_mahmoud@gmail.com'),
		 ('A000','mar1','012134556789','mariam1_zaghlol@gmail.com'),
		 ('C11','mana_85','123','mana_85@gmail.com'),
         ('C12','xx_malak','456','xx_malak@gmail.com'),
         ('C13','hossam485','789','hossam485@gmail.com'),
         ('C14','yasser45','101','yasser45@gmail.com'),
         ('C15','sara mohamed','111','sara mohamed@gmail.com'),
         ('C16','philip_ff','121','philip_ff@gmail.com'),
         ('C17','dina khaled','389','dina khaled@gmail.com'),
         ('C18','mohsen 12','095','mohsen 12@gmail.com'),
         ('C19','ahmed_hossam','4984','ahmed_hossam@gmail.com'),
         ('C20','adham87','465','adham87@gmail.com');

insert into ADMIN(admin_id,admin_name,admin_email,admin_role,user_id)
values ('111','muhammed','muhammed_gamal@gmail.com','super admin','A111'),
       ('222','kareem','kareem_nagaty@gmail.com','content admin','A222'),
       ('333','basmala','basmala_omar@gmail.com','curator','A333'),
       ('444','yaseen','yaseen_mahmoud@gmail.com','analyst','A444'),
       ('555','zienab','zienab_khaled@gmail.com','help desk admin','A555'),
       ('666','salma','salma_mohamed@gmail.com','storage admin','A666'),
       ('777','yasmen','yasmen_hemdan@gmail.com','services admin','A777'),
       ('888','habiba','habiba_khaled@gmail.com','analyst','A888'),
       ('999','nada','nada_mahmoud@gmail.com','curator','A999'),
       ('000','mariam','mariam1_zaghlol@gmail.com','help desk admin','A000');

	 insert into CUSTOMER (cus_id,cus_name,gender,Address,username,tracking_no,admin_id,user_id)
values   ('1', 'Ammar','male', 'cairo','Ammarkhaled','1010','111',null),
         ('2', 'sama','female', 'tanta','samagmal','2020','111','C2'),
         ('3', 'Fares','male', 'alexandria','fares345','3030','333','C3'),
         ('4', 'Mohammedkhaled','male', 'benisuef','mohammed','4040','000','C4'),
         ('5', 'haneen','female', 'cairo','haneenNagaty','5050','111','C5'),
         ('6', 'Elias','male', 'banha','Eliasine2019','6060','333','C6'),
         ('7', 'Hafsa','female', 'benisuef','hameda','7070','000',null),
         ('8', 'Ibrahim','male', 'mansora','Ibrahim','8080','333','C8'),
         ('9', 'Mahmoud','male', 'cairo','Mahmoud','9090','333' ,'C9'),
         ('10', 'salman','male', 'cairo','salman','9999','000','C10'),
		 ('11', 'manar','female', 'cairo','mana_85','1111','000',null),
         ('12', 'malak','female', 'tanta','xx_malak','2222','333',null),
         ('13', 'hossam','male', 'alexandria','hossam485','3333','111',null),
         ('14', 'yasser','male', 'benisuef','yasser45','4444','111',null),
         ('15', 'sara','female', 'cairo','sara mohamed','5555','000',null),
         ('16', 'philip','male', 'banha','philip_ff','6666','111',null),
         ('17', 'dina','female', 'beni suef','dina khaled','7777','333','C1'),
         ('18', 'mohsen','male', 'mansora','mohsen 12','8888','333',null),
         ('19', 'ahmed','male', 'cairo','ahmed_hossam','9999','111','A000'),
         ('20', 'adham','male', 'cairo','adham87','1002','000',null);


insert into WAREHOUSE (id , section_name, item_quality ,import_date ,Export_date )  
values( '1','new born', '50', '2015-12-17', '2015-12-17'),  
       ('2','kids', '70','2022-5-17','2022-12-17' ),  
       ('3','female','500', '2022-11-17','2022-11-5'),  
       ('4','new born','151','2022-1-15','2023-12-8'),  
       ('5','male', '546','2022-2-17','2024-5-15'),  
       ('6','male', '498','2022-5-7', '2025-12-17'),
       ('7','kids','616','2022-10-1','2015-12-17'),  
       ('8','female', '156','2022-1-8','2025-9-17'),  
       ('9','male', '185', '2022-7-25','2023-12-18'),  
       ('10','female', '161 ','2022-1-1','2024-6-17'),
	   ('11','male', '457', '2015-1-25', '2019-3-15'),  
       ('12','new born', '528','2022-5-13','2022-12-19' );
     
insert into CATEGORY (category_id, gender, category_name)  
values('34','male', 'shoes' ),  
       ('30', 'female', 'dresses'),  
       ('24', 'girls', 'toys'),  
       ('45', 'female', 'dresses'),  
       ('83', 'male', 'jackets'),  
       ('25', 'male', 'shirts'),  
       ('63', 'female', 'dresses'),  
       ('35', 'both', 'tools'),  
       ('20', 'female', 'skirts'),  
       ('33','female', 'blouses'),
	   ('100','male', 'shoes'),  
       ('200', 'female', 'dresses'),  
       ('300', 'girls', 'toys'),  
       ('400', 'female', 'dresses'),  
       ('500', 'male', 'jackets'),  
       ('600', 'male', 'shirts'),  
       ('700', 'female', 'dresses'),  
       ('800', 'both', 'tools'),  
       ('900', 'female', 'skirts'),  
       ('1000','female', 'blouses');

insert into CART (cart_id, no_of_items,total_cost,arriaval_date)
values ('111' ,' 100' , '5000 ','2022-12-1' ),
       ('222' ,' 2' , '200 ','2022-1-15' ),
       ('333' ,' 5' , '2000 ','2022-4-18' ),
       ('444' ,' 10' , '3000 ','2022-2-11' ),
       ('555' ,' 1' , '100 ','2022-7-15' ),
       ('666' ,' 50' , '5000 ','2022-1-13' ),
       ('777' ,' 5' , '300 ','2022-5-11' ),
       ('888' ,' 18' , '2000 ','2022-11-12' ),
       ('999' ,' 100' , '20000 ','2022-4-11' ),
       ('1000' ,' 100' , '6000 ','2022-8-11' ),
	   ('4545' ,' 100' , '5000 ','2022-5-1' ),
       ('1212' ,' 2' , '200 ','2023-1-25' ),
       ('2323' ,' 5' , '2000 ','2023-4-18' ),
       ('8989' ,' 10' , '3000 ','2023-2-11' ),
       ('7878' ,' 1' , '100 ','2022-7-15' ),
       ('1414' ,' 50' , '5000 ','2023-2-13' ),
       ('8789' ,' 5' , '300 ','2022-5-11' ),
       ('7865' ,' 18' , '2000 ','2022-1-12' ),
       ('1471' ,' 100' , '20000 ','2022-5-1' ),
       ('9898' ,' 100' , '6000 ','2022-9-5' );

insert into PRODUCT (id , prod_code, price, quantity ,size ,material , model,category_id,product_review, 
section_name , admin_id)  
values
('5','20', '250', '2', '38', 'silk', 'short','34','4', 'male','999'), 
('3','21', '200','1', '36' , 'cotton ' , 'denim','30','5', 'female','666'),  
('3','50', '500','2', '40', 'polyester', 'dress','24','2', 'female','333'),  
('2','210', '100', '3', '32', 'cotton', 't_shirt','45','2', 'kids','222'),  
('3','45', '150', '6', '42', 'silk', 'dress','83','5', 'female','999'),  
('6','83', '350', '2', '30' ,'cotton', 'jacket','25','1' , 'male','999'),  
('4','25', '230', '1', '38' ,'polyester', 'shirt','63','3' , 'new born','666' ),  
('10','63', '100', '4', '32', 'silk', 'dress','35','2' , 'female','666'),  
('5','33', '110', '1', '30', 'cotton', 'shirt','20','5' , 'male','333'),   
('6','35','170', '1 ', '34', 'cotton', 'shirt','33','0' , 'male','222'),
('7','40', '250', '2', '38', 'silk', 'short','100','4' , 'kids' ,'999'), 
('5','102', '100','6', '35' , 'cotton ' , 'denim','200','5' , 'female','333'),  
('8','103', '500','2', '40', 'polyester', 'dress','300','2', 'female','999'),  
('9','241', '800', '3', '31', 'silk', 'short','400','2' , 'male','999'),  
('10','450', '150', '4', '42', 'silk', 'dress','500','5'  ,'female','333'),  
('7','838', '800', '2', '22' ,'cotton', 'jacket','600','1' , 'kids','333'),  
('3','256', '230', '1', '37' ,'polyester', 'shirt','700','3' , 'female','999'),  
('8','634', '1200', '8', '36', 'silk', 'dress','800','2' , 'female' ,'222'),  
('5','787', '110', '2', '15', 'cotton', 'jacket','900','5' , 'male','999'),   
('12','542','890', '4 ', '40', 'cotton', 'shirt','1000','0' , 'new born' ,'666')

insert into PAYMENT (payment_id,cus_id,cart_id,cash,visa,payment_amount)
values ('11' ,'1' , '111 ','787','01025468437' ,null ),
       ('22' ,'2' , '222',null ,'2486-1789-2154', null),
       ('33' ,'3' , '333',null, '7824-3987-2587',null),
       ('44' ,'4' , '444','320','8910-4567-123', null),
       ('55' ,'5' , '555',null,'7532-2589-9514','478'),
       ('66' ,'6' , '666',null,'1298-4127-2069' ,'515'),
       ('77' ,'7' , '777','1000','7891-1489-2030',null),
       ('88' ,'8' , '888',null, '1256-4132-7169','498'),
       ('99' ,'9' , '999','454' ,'3642-6842-9534',null),
       ('100' ,'10','1000',null,'1298-4127-2069', '500'),
	   ('12' ,'11' , '4545 ','787','9874-2155-3232',null ),
	   ('13' ,'12','1212',null,'7412-1879-7193', '852'),
       ('14' ,'13' , '2323',null, '5421-9856-2587',null),
       ('15' ,'14' , '8989','320','7485-2312-123', null),
       ('16' ,'15' , '7878',null,'7896-0125-4444','785'),
       ('17' ,'16' , '1414',null,'1852-3211-0258','874'),
       ('18' ,'17' , '8789','1000','7891-8759-2585','525'),
       ('19' ,'18' , '7865',null, '1256-8963-9865','152'),
       ('20' ,'19' , '1471','454' ,'3642-6547-9534',null),
       ('21' ,'20','9898',null,'7812-7124-2888', '963');



insert into CART_PROD (cart_prod_id , cart_id, prod_code)
values   ('1','111','20'),
         ('2','111','21'),
         ('3','111','50'),
         ('4', '444','210'),
         ('5', '555','45'),
         ('6', '666','83'),
         ('7', '777','25'),
         ('8','888','63'),
         ('9','999','33'),
         ('10','1000','33'),
		 ('11','4545','33'),
		 ('12','1212','102'),
		 ('13','2323','103'),
		 ('14','8989','241'),
		 ('15','1414','450'),
		 ('16','1414','838'),
		 ('17','8789','256'),
		 ('18','7865','634'),
		 ('19','1471','787'),
		 ('20','9898','787');

insert into PROD_DELV (prod_delv_id , tracking_no, prod_code)
values   ('1','1010','20'),
         ('2','2020','20'),
         ('3','3030','50'),
         ('4', '4040','210'),
         ('5', '5050','45'),
         ('6', '6060','45'),
         ('7', '7070','25'),
         ('8','8080','63'),
         ('9','9090','33'),
         ('10','9999','33'),
		 ('11','1111','40'),
		 ('12','2222','102'),
		 ('13','3333','103'),
		 ('14','4444','241'),
		 ('15','5555','450'),
		 ('16','5555','838'),
		 ('17','7777','256'),
		 ('18','8888','634'),
		 ('19','9999','787'),
		 ('20','9999','542');

insert into CUS_PROD (cus_prod_id , cus_id , prod_code)
values   ('1','1','21'),
         ('2','2','21'),
         ('3','3','50'),
         ('4', '4','210'),
         ('5', '4','45'),
         ('6', '6','83'),
         ('7', '7','25'),
         ('8','8','63'),
         ('9','9','33'),
         ('10','11','33'),
		 ('11','11','40'),
		 ('12','12','102'),
		 ('13','13','103'),
		 ('14','14','241'),
		 ('15','14','450'),
		 ('16','16','838'),
		 ('17','17','256'),
		 ('18','18','787'),
		 ('19','19','787'),
		 ('20','20','542');

 insert into CUS_EMAIL(cus_id , email)
values   ('1','habibakhaled@gmail.com'),
         ('2','samagmal@gmail.com'),
         ('3','fares345@gmail.com'),
         ('4','mohammed@gmail.com'),
         ('5','haneenNagaty@gmail.com'),
         ('6','Eliasine2019@gmail.com'),
         ('7','hameda@gmail.com'),
         ('8','Ibrahim@gmail.com'),
         ('9','Mahmoud@gmail.com'),
         ('10','salman@gmail.com'),
		 ('11','mana_85@gmail.com'),
		 ('12','xx_malak@gmail.com'),
		 ('13','hossam485@gmail.com'),
		 ('14','yasser45@gmail.com'),
		 ('15','sara mohamed@gmail.com'),
		 ('16','philip_ff@gmail.com'),
		 ('17','dina khaled@gmail.com'),
		 ('18','mohsen 12@gmail.com'),
		 ('19','ahmed_hossam@gmail.com'),
		 ('20','adham87@gmail.com');
		 

 insert into CUS_PHONE(cus_id , phone)
values   ('1','01021548796'),
         ('2','01254876221'),
         ('3','01245787455'),
         ('4','01587987456'),
         ('5','01125489655'),
         ('6','01254963582'),
         ('7','01147859632'),
         ('8','01021201254'),
         ('9','01252054879'),
         ('10','01124569630'),
		 ('11','01547845966'),
		 ('12','01014578458'),
		 ('13','01254879658'),
		 ('14','01548796588'),
		 ('15','01024589637'),
		 ('16','01147582965'),
		 ('17','01045784963'),
		 ('18','01548796588'),
		 ('19','01555487699'),
		 ('20','01124578544');

		 insert into CUS_EMAIL(cus_id,email)
   values ('1','ammar123@yahoo.com'),
		  ('1','ammar@skype,com'),
		  ('4','**ibra@gmail.com'),
		  ('17','dinadina@gmail.com'),
		  ('19','12ahmed.gmail.com')

	insert into CUS_PHONE(cus_id,phone)
	values('2','01523684973'),
		  ('6','01035271446'),
		 ('10','011116668837'),
		('17','01256879881')
  
	
	   --*************************************************************************
    -- UPDATE ..

	   UPDATE CART set total_cost = 10000 
	     where cart_id = 111
	   UPDATE CATEGORY set category_name = 'dresses'
	     where category_id = 33
	   UPDATE CUSTOMER set Address = 'giza'
	     where cus_id = 5
	   UPDATE DELIVERY set shipping_type = 'express'
	     where tracking_no = 7070
	   UPDATE PAYMENT set cash = 7075
	     where payment_id = 22
	   UPDATE PRODUCT set price = 30000 
	     where prod_code = 25
	   UPDATE CUSTOMER set username = 'xx_ibrahim_xx'
	     where cus_id = 8
	   UPDATE PAYMENT set cash = 5050 
	     where payment_id = 88
	   UPDATE PRODUCT set quantity = 100
	     where prod_code = 50
	   UPDATE PRODUCT set price = 50000 
	     where prod_code = 50
	   UPDATE CART set no_of_items = 40 
	     where cart_id = 555
	   UPDATE CART set arriaval_date = '2023-01-15'
	     where cart_id = 111
	   UPDATE CART set arriaval_date = '2023-04-30'
	     where cart_id = 888
		  update ADMIN set admin_role='requests managers' where admin_Id=0
   update ADMIN set admin_role='requests managers'where admin_Id=111
   update ADMIN set admin_role='requests managers'  where admin_Id=333
   update ADMIN set admin_role='customer service'  where admin_Id=444
   update ADMIN set admin_role='customer service'  where admin_Id=666
	  update CUSTOMER set tracking_no ='3030' where  cus_id = 10
	  

	   --*************************************************************************
	   -- DELETE ..

	 DELETE FROM WAREHOUSE where section_name='drinks'
     DELETE FROM PAYMENT where cart_id=222
     DELETE FROM CART_PROD where cart_id=222
     DELETE FROM CART where cart_id=222
     DELETE FROM CART_PROD where prod_code = 33
     DELETE FROM CUS_PROD where prod_code = 33
     DELETE FROM PROD_DELV where prod_code = 33
     DELETE FROM PRODUCT where prod_code=33
     DELETE FROM PRODUCT where category_id=20
     DELETE FROM PAYMENT where payment_id=20
     DELETE FROM PAYMENT where cart_id = 333
     DELETE FROM CART_PROD where cart_id = 333
     DELETE FROM CART where cart_id = 333
     DELETE FROM CUS_PROD where cus_id = 6
     DELETE FROM PROD_DELV where prod_code = 83
     DELETE FROM CART_PROD where prod_code = 83
     DELETE FROM PRODUCT where category_id = 25
     DELETE FROM CATEGORY where category_id = 25
     DELETE FROM PAYMENT where cus_id = 1
     DELETE FROM WAREHOUSE where section_name = 'clothes'
    
	   --*************************************************************************
	 -- SELECT ..

	 Select * from ADMIN ;

	 Select cart_id 
	 from CART ;

	 Select (item_quality+100)*3 
	 From WAREHOUSE ;

	 Select (item_quality+100)*3 As NUM
	 From WAREHOUSE ;

	 Select  Distinct price
	 From PRODUCT ;

	 Select price , quantity , size , product_review
	 From PRODUCT 
	 Where product_review = 2 ;

	 Select price , quantity , size , product_review ,material
	 From PRODUCT 
	 Where material = 'silk' ;

	 Select price , quantity , size , product_review
	 From PRODUCT 
	 Where price >= 800 ;

	 Select price , quantity , size , product_review
	 From PRODUCT 
	 Where size BETWEEN 30 AND 40 ;

	 Select price , quantity , size , product_review
	 From PRODUCT 
	 Where size IN(40,38) ;

	 Select price , quantity , size , product_review
	 From PRODUCT
	 Where size NOT BETWEEN 30 AND 40 ;

	 Select price , quantity , size , product_review
	 From PRODUCT
	 Where size BETWEEN 30 AND 40 
	 AND price >= 800 ;

	 Select price , quantity , size , product_review
	 From PRODUCT 
	 Where size BETWEEN 30 AND 40 
	 OR price >= 800 ;

	 Select * from CUSTOMER where cus_name like '_h%'
	 Select * from CUSTOMER  where cus_name like '%f%'

	 Select section_name , item_quality , Export_date 
	 From WAREHOUSE
	 ORDER BY Export_date  ;

	 Select section_name , item_quality , import_date 
	 From  WAREHOUSE
	 ORDER BY import_date DESC ;

	 Select price , quantity , size , product_review
	 From PRODUCT 
	 Where size BETWEEN 30 AND 40 
	 OR price >= 800 
	 AND product_review >=2 ;

	 --*************************************************************************
	 -- SELECT GROUP BY ..

  select cart_id , MAX (total_cost)  
  From CART   
  GROUP BY cart_id  
  
  select COUNT(cus_id) 
  From CUSTOMER   
  GROUP BY tracking_no
  
  
  select cart_id , SUM (no_of_items) 
  From CART 
  GROUP BY cart_id 
  
  select cart_id , AVG (total_cost)  
  From CART
  GROUP BY cart_id
  HAVING AVG (total_cost)>100  

  select cart_id, min(prod_code),max(price)
    from PRODUCT , CART 
    group by cart_id;

select  cus_id ,count(Address) ,count(gender)
from CUSTOMER
group by  cus_id ;

select cart_id ,AVG(total_cost),no_of_items
from CART
group by cart_id,no_of_items
having AVG(total_cost)>100;

select category_id ,count(*), MAX (price),min (price)
   From PRODUCT
   GROUP BY category_id

select model ,count(*), MAX (price), AVG (price)
   From PRODUCT
   GROUP BY model

select shipping_type ,count(*), MAX (no_of_items) 
   From DELIVERY
   GROUP BY shipping_type


select shipping_type ,count(*), MAX (no_of_items) 
   From DELIVERY
   GROUP BY shipping_type
   HAVING MAX (no_of_items) > 5

   --*************************************************************************
      --JOIN ..
	  SELECT CUSTOMER.cus_id , cus_name ,
 DELIVERY.tracking_no , shipping_type
  FROM CUSTOMER , DELIVERY
  WHERE CUSTOMER.tracking_no =  DELIVERY.tracking_no
 
  SELECT CART.cart_id ,no_of_items ,
 PAYMENT.payment_id , cash 
 FROM CART , PAYMENT
 WHERE CART.cart_id = PAYMENT.cart_id

 SELECT CART.cart_id ,no_of_items ,
 PAYMENT.payment_id , cash 
 FROM CART LEFT OUTER JOIN payment 
 on (CART.cart_id = PAYMENT.cart_id);

 SELECT CART.cart_id ,no_of_items ,
 PAYMENT.payment_id , cash 
 FROM cart RIGHT OUTER JOIN payment 
 on (CART.cart_id = PAYMENT.cart_id);

 SELECT CART.cart_id ,no_of_items ,
 PAYMENT.payment_id , cash 
 FROM CART FULL OUTER JOIN PAYMENT
 on (CART.cart_id = PAYMENT.cart_id);

 select prod_code,product_review,category_name,C.category_id
from PRODUCT P LEFT OUTER JOIN CATEGORY C
on (C.category_id = P.category_id);

select A.admin_Id,A.admin_name,C.gender,C.cus_id
from ADMIN A right outer join CUSTOMER C
on(A.admin_Id=C.admin_id);

select shipping_type,username,cus_name 
  from CUSTOMER join DELIVERY
  on customer.tracking_no=Delivery.tracking_no; 
 
  select c.cus_id,p.cash,c.cus_name
  from CUSTOMER c,PAYMENT p; 
 
  select c.category_id,quantity,c.gender,price 
  from PRODUCT,CATEGORY c; 
 
   select p.prod_code,p.product_review,c.category_name,c.category_id 
   from PRODUCT p left outer join CATEGORY c 
   on (c.category_id=p.category_id);

   select user_id ,payment_amount
  from CUSTOMER full outer join PAYMENT
  on CUSTOMER.cus_id=PAYMENT.cus_id

  select CATEGORY.category_id, category_name,CUSTOMER.gender
  from CATEGORY cross join CUSTOMER

  select PAYMENT.cus_id,payment_amount,arriaval_date,no_of_items,visa
   from PAYMENT, CART
    where PAYMENT.cart_id = CART.cart_id
   And payment_amount >500

select A.admin_Id,A.admin_name,C.gender,C.cus_id
from ADMIN A join CUSTOMER C
on(A.admin_Id=C.admin_id)
and C.admin_Id=333;
   
   select CUSTOMER.cus_id,Address,payment_amount
   from CUSTOMER left outer join PAYMENT
  on CUSTOMER.cus_id=PAYMENT.cus_id
   
SELECT CUSTOMER.cus_id , CUSTOMER.cus_name , ADMIN.admin_id , ADMIN.admin_role 
  from CUSTOMER join ADMIN 
  on (CUSTOMER.admin_id = ADMIN.admin_id)

  SELECT CUSTOMER.cus_id , CUSTOMER.cus_name , ADMIN.admin_id , ADMIN.admin_role 
  from CUSTOMER LEFT OUTER join ADMIN 
  on (CUSTOMER.admin_id = ADMIN.admin_id)

  select A.admin_name,A.admin_role,L.username
  from ADMIN A cross join LOGIN L;

  select L.email,L.user_id,C.cus_name,C.gender
  from LOGIN L full outer join CUSTOMER C
  on(L.user_id=C.user_id);

  