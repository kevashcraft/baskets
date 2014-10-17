--
-- DROP IF EXISTS
--
DROP DATABASE IF EXISTS baskets;

--
-- CREATE
--
-- db=baskets
-- tables:
--	baskets
--	basketsitems
--	contractors
--	helpers
--	images
--	jobs
--	jobparts
--	models
--	parts
--	settings
--	suppliers
--	users
--	workers


CREATE DATABASE baskets;
GRANT ALL ON baskets.* TO baskets@localhost IDENTIFIED BY 'baskets';
USE baskets;

CREATE TABLE baskets(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	dt DATETIME,
	dtu DATETIME,
	basket VARCHAR(16),
	PRIMARY KEY (id)
) ENGINE InnoDB;

CREATE TABLE basketitems(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	dt DATETIME,
	dtu DATETIME,
	basketid INT UNSIGNED,
	jobid INT UNSIGNED,
	PRIMARY KEY (id)
) ENGINE InnoDB;

CREATE TABLE contractors(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	dt DATETIME,
	dtu DATETIME,
	contractor VARCHAR(128),
	address VARCHAR(256),
	phone VARCHAR(32),
	email VARCHAR(128),
	fax VARCHAR(32),
	valid BOOLEAN,
	PRIMARY KEY (id)
) ENGINE InnoDB;

CREATE TABLE images(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	dt DATETIME,
	filename VARCHAR(32),
	partid INT UNSIGNED,
	workerid INT UNSIGNED,
	helperid INT UNSIGNED,
	userid INT UNSIGNED,
	jobid INT UNSIGNED,
	valid BOOLEAN,
	PRIMARY KEY (id)
) ENGINE InnoDB;

CREATE TABLE estimates(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	dt DATETIME,
	dtu DATETIME,
	contractorid INT UNSIGNED,
	model VARCHAR(128),
	hours SMALLINT,
	margin TINYINT,
	PRIMARY KEY (id)
) ENGINE InnoDB;

CREATE TABLE estimateparts(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	room VARCHAR(128),
	partid INT UNSIGNED,
	bidit INT UNSIGNED,
	price DECIMAL(8,2),
	PRIMARY KEY (id)
) ENGINE InnoDB;



CREATE TABLE jobs(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	dt DATETIME,
	dtu DATETIME,
	job VARCHAR(128),
	contractor INT UNSIGNED,
	model INT UNSIGNED,
	worker INT UNSIGNED,
	helper INT UNSIGNED,
	PRIMARY KEY (id)
) ENGINE InnoDB;

CREATE TABLE jobparts(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	jobid INT UNSIGNED,
	partid INT UNSIGNED,
	room VARCHAR(32),
	status SMALLINT,
	comment TEXT,
	imageid INT UNSIGNED,
	PRIMARY KEY (id)
) ENGINE InnoDB;

CREATE TABLE models(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	dt DATETIME,
	dtu DATETIME,
	model VARCHAR(128),
	contractorid INT UNSIGNED,
	PRIMARY KEY (id)
) ENGINE InnoDB;


CREATE TABLE sessions(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	dt DATETIME,
	userid INT UNSIGNED,
	cookid VARCHAR(128),
	useragent VARCHAR(256),
	valid BOOLEAN,
	PRIMARY KEY (id)
) ENGINE InnoDB;

CREATE TABLE settings(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (id)
) ENGINE InnoDB;


CREATE TABLE bids(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	dt DATETIME,
	expiration DATE,
	bid VARCHAR(64),
	supplierid INT UNSIGNED,
	valid BOOLEAN,
	PRIMARY KEY (id)
) ENGINE InnoDB;

CREATE TABLE bidparts(
	bidid INT UNSIGNED,
	partid INT UNSIGNED,
	price DECIMAL(8,2)
) ENGINE InnoDB;

CREATE TABLE parts(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	partid VARCHAR(64),
	partname VARCHAR(128),
	partdesc VARCHAR(512),
	PRIMARY KEY (id)
) ENGINE InnoDB;

CREATE TABLE suppliers(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	dt DATETIME,
	dtu DATETIME,
	supplier VARCHAR(64),
	address VARCHAR(256),
	email VARCHAR(128),
	fax VARCHAR(32),
	phone VARCHAR(32),
	valid BOOLEAN,
	PRIMARY KEY (id)
) ENGINE InnoDB;





CREATE TABLE users(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	dt DATETIME,
	dtu DATETIME,
	wid INT UNSIGNED,
	username VARCHAR(128),
	password VARCHAR(255),
	authlevel TINYINT UNSIGNED,
	valid BOOLEAN,
	PRIMARY KEY (id)
) ENGINE InnoDB;


CREATE TABLE visits(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	dt DATETIME,
	ua VARCHAR(128),
	ip INT UNSIGNED,
	PRIMARY KEY (id)
);

CREATE TABLE workers(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	dt DATETIME,
	dtu DATETIME,
	department VARCHAR(16),
	name VARCHAR(128),
	email VARCHAR(128),
	phone VARCHAR(32),
	address VARCHAR(256),
	firstday DATE,
	lastday DATE,
	employed BOOLEAN,
	PRIMARY KEY (id)
) ENGINE InnoDB;

