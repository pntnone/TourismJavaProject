

create table account(
	id bigint primary key identity(1,1),
	username varchar(150) unique not null,
	password varchar(150) not null,
	name varchar(150) null,
	status int not null,
	role_id bigint not null,
	created_date date null,
	modified_date date null,
	created_by varchar(255) null,
	modified_by varchar(255) null
)

create table role(
	id bigint primary key identity(1,1),
	name varchar(255) not null,
	code varchar(255) not null,
	created_date date null,
	modified_date date null,
	created_by varchar(255) null,
	modified_by varchar(255) null
)

alter table account add foreign key (role_id) references role(id)

create table category_tour(
	id bigint primary key identity(1,1),
	name varchar(255) not null,
	code varchar(255) not null,
	created_date date null,
	modified_date date null,
	created_by varchar(255) null,
	modified_by varchar(255) null	
)

create table avail_tour(
	id bigint primary key identity(1,1),
	thumbnail nvarchar(255) null,
	departure nvarchar(255) not null,
	destination nvarchar(255) not null,
	start_time date null,
	end_time date null,
	flight nvarchar(255) not null,
	category_tour_id bigint not null,
	created_date date null,
	modified_date date null,
	created_by varchar(255) null,
	modified_by varchar(255) null
)

create table tour(
	id bigint primary key identity(1,1),
        title nvarchar(255),
        thumbnail nvarchar(255) null,
	departure nvarchar(255) not null,
	destination nvarchar(255) not null,
	start_time date null,
	end_time date null,
	flight nvarchar(255) not null,
	description text null,
	status int not null,
	category_tour_id bigint not null,
	created_date date null,
	modified_date date null,
	created_by varchar(255) null,
	modified_by varchar(255) null
)

alter table avail_tour add foreign key (category_tour_id) references category_tour(id)
alter table tour add foreign key (category_tour_id) references category_tour(id)

create table user_trip(
	id bigint primary key identity(1,1),
	tour_id bigint not null,
	account_id bigint not null,
	status int not null,
	created_date date null,
	modified_date date null,
	created_by varchar(255) null,
	modified_by varchar(255) null
)

alter table user_trip add foreign key (tour_id) references tour(id)
alter table user_trip add foreign key (account_id) references account(id)

create table comment(
	id bigint primary key identity(1,1),
	content text not null,
	tour_id bigint not null,
	account_id bigint not null,
	created_date date null,
	modified_date date null,
	created_by varchar(255) null,
	modified_by varchar(255) null
)

alter table comment add foreign key (tour_id) references tour(id)
alter table comment add foreign key (account_id) references account(id)




