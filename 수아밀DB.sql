create table membership (
 name varchar(30) not null,
 id VARCHAR(30) not null,
 pass VARCHAR(30) not null,
 tel VARCHAR(11) NOT NULL,
 mobile VARCHAR(11) NOT NULL,
 email VARCHAR(30) NOT NULL,
 address VARCHAR(50) NOT NULL,
 regidate datetime default CURRENT_TIMESTAMP,
 primary key(id)
);