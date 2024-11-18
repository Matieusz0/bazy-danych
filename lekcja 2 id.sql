CREATE DATA IF NOT EXISTS lekcja2 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use lekcja2;

create table pracownicy
(
    id int not null primary key AUTO_INCREMENT,
    imie varchar(32) not null,
    nazwisko varchar(32) not null
);
create table stanowiska
(
    id SMALLINT not null primary key AUTO_INCREMENT,
    nazwa varchar(64) not null UNIQUE
);
create table pracownicy_stanowiska
(
    id int not null primary key AUTO_INCREMENT,
	pracownik_id int not null,
    stanowisko_id smallint not null
);

alter table pracownicy_stanowiska add CONSTRAINT FOREIGN key
fk_pracownicy_stanowiska_pracownik_id(pracownik_id)
REFERENCES pracownicy(id)
on UPDATE RESTRICT on delete RESTRICT;

alter table pracownicy_stanowiska add CONSTRAINT FOREIGN key
fk_pracownicy_stanowiska_stanowisko_id(stanowisko_id)
REFERENCES stanowiska(id)
on UPDATE RESTRICT on delete RESTRICT;

insert into pracownicy (imie, nazwisko) values ("jan","kowalski");
insert into stanowiska (nazwa) values ("admin"), ("kierowca");
insert into pracownicy_stanowiska (pracownik_id, stanowisko_id) values (1,1), (1,2);
