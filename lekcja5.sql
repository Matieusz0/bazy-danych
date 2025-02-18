DROP DATABASE IF EXISTS lekcja5;
CREATE DATABASE IF NOT EXISTS lekcja5 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE lekcja5;

drop table if EXISTS waluta;
create table if not EXISTS waluta
(
	id smallint not null primary key AUTO_INCREMENT,
    nazwa varchar(32) not null unique,
    kod CHARACTER(3) not null UNIQUE
);

drop table if exists kursy;
create table if not EXISTS kursy
(
	id int not null primary key AUTO_INCREMENT,
    waluta_id SMALLINT not null,
    data_kursu timestamp not null DEFAULT CURRENT_TIMESTAMP,
    kurs_wzg_usd decimal(18, 4) not null DEFAULT 1.0 CHECK (kurs_wzg_usd >= 1.00)
);

alter table kursy add CONSTRAINT fk_kursy_waluta_id FOREIGN key (waluta_id)
REFERENCES waluta(id) on update RESTRICT on delete RESTRICT;

insert into waluta (nazwa, kod) values ('dolar amerykanski', 'USD'),
('złoty polski', 'PLN'), ('kolumbijskie pesos', 'CPE'), ('dolar zimbabwe', 'ZWD');

insert into kursy (waluta_id, kurs_wzg_usd, data_kursu) values
(1, 1.000, '2025-02-18 08:00:00'),
(2, 3.9865, '2025-02-18 08:00:00'),
(3, 4132.000, '2025-02-18 08:00:00'),
(4, 361.000, '2025-02-18 08:00:00'),
(1, 1.000, '2025-02-19 10:00:00'),
(2, 4.9865, '2025-02-19 10:00:00'),
(3, 2000.000, '2025-02-19 10:00:00'),
(4, 592.000, '2025-02-19 10:00:00');
