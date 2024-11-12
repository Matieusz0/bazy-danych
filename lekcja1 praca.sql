DROP DATABASE IF EXISTS lekcja1;

CREATE DATA IF NOT EXISTS lekcja1 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE lekcja1:

create table kategorie(
    id smallint not null primary key AUTO_INCREMENT,
    nazwa varchar(32) not null unique,
    created_on timestamp not null default current_timestamp,
    updated_on timestamp not null default current_timestamp on update current_timestamp,
    emp_count int not null default 0 check (emp_count >= 0)
    base_salary decimal(10,2) default 2500.00 check(base_salary >= 2500.00),
    gender char default 'M' check (gender in ('M', 'F'))
);

create table produkty
(
    id int not null primary key AUTO_INCREMENT,
    nazwa varchar(64) not null unique,
    base_price decimal(12, 3) not null unique,
    create_on timestamp not null default current_timestamp,
    updated_on timestamp not null default current_timestamp on update current_timestamp,
    product_count int not null default 0 check (product_count >= 0),
    category_id smallint not null,
    foreign key (category_id) references kategorie(id) on update restrict on delete restrict
);
