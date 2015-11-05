drop database travel
create database travel;
use travel
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  email varchar(20),
  `username` char(20) DEFAULT NULL,
  created_at timestamp NOT NULL default CURRENT_TIMESTAMP,
  password varchar(20),
  is_admin boolean,
  PRIMARY KEY (`id`)
  );
  create table article(

  `id` int(11) NOT NULL AUTO_INCREMENT,
  created_at timestamp NOT NULL default CURRENT_TIMESTAMP,
  title varchar(200),
  maincontent text,
  content  text,
  img  text,
  authorname  varchar(200),
  authorid	int(11),
  PRIMARY KEY (`id`)

);
create table comment(

  `id` int(11) NOT NULL AUTO_INCREMENT,
  created_at timestamp NOT NULL default CURRENT_TIMESTAMP,
  username varchar(20),
  content text,
  article_id int(11),
 PRIMARY KEY (`id`)
);

create  table activity(
 `id` int(11) NOT NULL AUTO_INCREMENT,
  created_at timestamp NOT NULL default CURRENT_TIMESTAMP,
  spend varchar(20),
  theme varchar(20),
  location varchar(20),
  need_person varchar(20),
  
  created_by_name varchar(20),
  
  created_by_id  int(11),
  
  introduce text,
  
   PRIMARY KEY (`id`)


)

drop table activity
select * from activity