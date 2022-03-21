CREATE TABLE "DBA"."ob_vedomost"
(
"id_nza"		numeric(17,0)  NOT NULL DEFAULT autoincrement,
"jek"			varchar(3) not null, 
"data_vedomosti"	varchar(15) not null, 
"kol_dogovor"		numeric(5,0) not null,
"kol_dogovor_l"		numeric(5,0) not null,
"borg_n"		numeric(18,2) not null,
"perepl_n"		numeric(18,2) not null,
"narahov"		numeric(18,2) not null,
"nadishlo"		numeric(18,2) not null,
"borg_end"		numeric(18,2) not null,
"perepl_end"		numeric(18,2) not null,
)

alter table "DBA".ob_vedomost add
  primary key(id_nza)
go
