drop database if exists lekcja4;
create database if not EXISTS lekcja4 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use lekcja4;

create table dane
(
    id int not null primary key AUTO_INCREMENT,
    wyrob_id int not null DEFAULT 0,
    ilosc_obecna int not null DEFAULT 0 check (ilosc_obecna >= 0),
    ilosc_poczatkowa int not null DEFAULT 0 check (ilosc_obecna >= 0),
    owner_id SMALLINT
);

insert into dane (wyrob_id, ilosc_obecna, ilosc_poczatkowa, owner_id) VALUES
(1, 0, 10, 1),
(2, 10, 10, 1),
(3, 4, 5, 2),
(4, 0, 0, null),
(5, 10, 10, 2),
(6, 0, 10, 1);

-- zapytania



