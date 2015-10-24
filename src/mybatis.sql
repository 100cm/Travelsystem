CREATE TABLE users (
  id int(11) NOT NULL AUTO_INCREMENT,
  name char(20) DEFAULT NULL,
  created_at timestamp NOT NULL default CURRENT_TIMESTAMP,
  password varchar(20),
  PRIMARY KEY ('id')
)
Create table books(

 id int(11) NOT NULL AUTO_INCREMENT,
name char(20) DEFAULT NULL,
userid int(11),

created_at timestamp NOT NULL default CURRENT_TIMESTAMP,
about char(20) DEFAULT NUll,
PRIMARY KEY (id)

);