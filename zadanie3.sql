drop database if EXISTS zadanie3;
create database if not EXISTS zadanie3 DEFAULT CHARACTER set utf8mb4 COLLATE utf8mb4_unicode_ci;
use zadanie3;

create table stacje(
	id int not null primary key AUTO_INCREMENT,
    kod int not null UNIQUE,
    szerokosc_geograficzna decimal(8,6) not null,
    dlugosc_geograficzna decimal(8,6) not null,
    kraj_id int not null,
    data_instalacji timestamp not null,
    data_kolejnego_przegladu timestamp not null DEFAULT CURRENT_TIMESTAMP
);

create table kraj(
    id int not null primary key AUTO_INCREMENT,
    kraj varchar(50) not null
);

create table rodzajpomiaru(
    id int not null PRIMARY key AUTO_INCREMENT,
    rodzaj varchar(50) not null
);

create table pomiary(
  	Data_wykonania timestamp not null DEFAULT CURRENT_TIMESTAMP,
    stacja_id int not null,
    rodzaj_pomiaru_id int not null,
    wartosc decimal(4,3) not null
);

alter table pomiary add CONSTRAINT FOREIGN key
fk_stacje_pomiary_stacja_id(stacja_id)
REFERENCES stacje(id)
on UPDATE RESTRICT on delete RESTRICT;

alter table pomiary add CONSTRAINT FOREIGN key
fk_rodzajpomiaru_pomiary_rodzaj_pomiaru_id(rodzaj_pomiaru_id)
REFERENCES rodzajpomiaru(id)
on UPDATE RESTRICT on delete RESTRICT;

alter table stacje add CONSTRAINT FOREIGN key
fk_kraj_stacje_kraj_id(kraj_id)
REFERENCES kraj(id)
on UPDATE RESTRICT on delete RESTRICT;
