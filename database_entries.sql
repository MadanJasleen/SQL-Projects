create database campusx;
USE campusx;

CREATE TABLE users(
user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
pass VARCHAR(255) NOT NULL
);
INSERT INTO campusx.users (user_id, username, email, pass)
VALUE (NULL,'jasleen','jmadan@gmail.com', '1234#');
INSERT INTO campusx.users 
VALUE (NULL,'ankit','ankit@gmail.com', 'blah');
INSERT INTO campusx.users (username, pass)
VALUE ('amit', '123456'); #will not work since email does not have a default
INSERT INTO campusx.users VALUES #values for multiple insertion
(NULL, 'ghc','ghc@gmail.com','pou'),
(NULL, 'abc', 'abc@gmail.com', 'pppr')













