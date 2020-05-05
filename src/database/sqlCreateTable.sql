create asdatabases;

create table users(
	id bigint(20) AUTO_INCREMENT primary key,
    name nvarchar(50),
    full_name nvarchar(70),
    user_name nchar,
    created_date datetime,
    created_by nchar,
    modified_date datetime,
    modified_by nchar
);
create table role(
	id bigint(20) AUTO_INCREMENT primary key,
    description varchar(255),
    name varchar(255)
);
create table permission(
	id bigint AUTO_INCREMENT primary key,
    user_id bigint(20),
    role_id bigint(20),

);
create table databasess(
	id bigint AUTO_INCREMENT primary key,
    name varchar(255)
);
create table lesson(
	id bigint AUTO_INCREMENT primary key,
	name_lesson varchar(500),
    tutorial text,
    example text,
    databasess_id bigint
);
create table feedback(
	id bigint AUTO_INCREMENT primary key,
    content text
);
create table contact(
	id bigint AUTO_INCREMENT primary key,
	phone bigint,
    email varchar(255),
    face varchar(255)
)