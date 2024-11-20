create data if not EXISTS zadanie1 DEFAULT CHARACTER set utf8mb4 COLLATE uft8mb4_unicode_ci;
use zadanie1;

create table pracownicy
(
    pracownik_id int not null primary key AUTO_INCREMENT,
    imie varchar(50) not null,
    nazwisko varchar(50) not null,
    data_zatrudnienia timestamp not null DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP,
    czy_aktywny boolean not null DEFAULT true check (czy_aktywny in (true, false))
);
create table maszyny
(
  maszyna_id int not null primary key AUTO_INCREMENT,
  nazwa_maszyny varchar(100) not null UNIQUE,
  typ varchar(50) not null,
  data_zakupu timestamp not null DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP,
  czy_aktywny boolean not null DEFAULT true check (czy_aktywny in (true, false))
);
create table pracownicy_maszyn
(
	pracownik_id SMALLINT,
    FOREIGN KEY (pracownik_id) REFERENCES pracownicy.pracownik_id (on UPDATE RESTRICT on delete RESTRICT),
    maszyna_id SMALLINT,
    FOREIGN KEY (maszyna_id) REFERENCES maszyny.maszyna_id (on UPDATE RESTRICT on delete RESTRICT),
    data_przypisania timestamp DEFAULT CURRENT_TIMESTAMP on UPDATE CURRENT_TIMESTAMP
);
insert into pracownicy (imie, nazwisko) values ("Jan","Kowalski"), ("Marek","Marucha"), ("Karol","Pietruszka");
insert into maszyny (nazwa_maszyny, typ) values ("Maszyna do drewna","Drewno"), ("Maszyna do metalu","Metal"), ("Maszyna do żelaza","Żelazo");
insert into pracownicy_maszyny (pracownik_id, maszyna_id) values (1,1), (1,2), (2,3), (3,1), (2,2);
