create table technology(
id int,
technology varchar(25)
);

drop table technology;

insert into technology values (1,'DS'),
(1,'PowerBI'),
(1,'Python'),
(2,'SQL'),
(2,'PowerBI'),
(2,'Python'),
(3,'SQL'),
(3,'PowerBI'),
(3,'Python'),
(4,'SQL');

select * from technology;

select id from technology where technology in ("DS","SQL","Python");

select id 
from technology 
where technology = 'DS' 
and id in (
	select id 
	from technology 
	where technology = 'SQL' 
    and id in (
		select id 
		from technology 
		where technology = 'Python' 
        
	)
);

create table product_info(
product_id int,
product_name varchar(25)
);

create table product_info_like(
user_id int,
product_id int,
liked_date date
);

insert into product_info values(1001,'Blog'),
(1002,'Youtube'),
(1003,'education');

drop table product_info_like;

insert into product_info_like values(1,1001,'2023-08-19');
insert into product_info_like values(1,1003,'2023-01-18');

select * from product_info_like;
select * from product_info;

SELECT p.product_id
FROM Product_info p
LEFT JOIN Product_info_like pl ON p.product_id = pl.product_id
WHERE pl.liked_date IS NULL OR pl.product_id IS NULL;

SELECT product_info.product_id
FROM product_info
left join product_info_like on product_info.product_id=product_info_like.product_id
WHERE product_info_like.liked_date is null or product_info_like.product_id is null;
