CREATE TABLE "DBA"."ob_vedomost"
(
"id_nza"		numeric(17,0)  NOT NULL DEFAULT autoincrement,
"jek"			varchar(3) null, 
"data_vedomosti"	varchar(15) null, 
"kol_dogovor"		numeric(5,0) null,
"kol_dogovor_l"		numeric(5,0) null,
"borg_n"		numeric(18,2) null,
"perepl_n"		numeric(18,2) null,
"narahov"		numeric(18,2) null,
"nadishlo"		numeric(18,2) null,
"borg_end"		numeric(18,2) null,
"perepl_end"		numeric(18,2) null,
)
go

alter table "DBA".ob_vedomost add
  primary key(id_nza)
go
commit work
