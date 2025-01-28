drop database if EXISTS zadanie2;
create database if not EXISTS zadanie2 DEFAULT CHARACTER set utf8mb4 COLLATE utf8mb4_unicode_ci;
use zadanie2;

create table samochod
(
    id int not null primary key AUTO_INCREMENT,
    vin varchar(50) not null UNIQUE,
    numer_rejestracyjny varchar(50) not null UNIQUE
);
create table wazenie
(
  samochod_id int not null,
  masa_pojazdu bigint not null,
  data_wazenia timestamp not null DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP
);

alter table wazenie add CONSTRAINT FOREIGN key
fk_samochod_wazenie_samochod_id(samochod_id)
REFERENCES samochod(id)
on UPDATE RESTRICT on delete RESTRICT;
