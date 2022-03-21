alter table dogovor
add lgota varchar(1)  null,
add opisanie varchar(100)  null
go


UPDATE dogovor SET d.ostatok = d.ostatok + 0.20, d.tarif = 0.50 FROM karta k, dogovor d
 WHERE k.Data_end >= '2002-10-01'
 AND k.dogovor = d.dogovor
 AND k.dogovor in (select dd.dogovor from dogovor dd where dd.annulir ='0'
 AND dd.tarif = 0.60)
go

UPDATE dogovor SET d.lgota = '1'
 FROM dogovor d, aa a
 WHERE d.dogovor = a.dogovor
go 


create index Dogovor_Data on dogovor(Data)
go


CREATE TABLE "DBA"."ob_vedomost"
(
"id_nza"		numeric(17,0)  NOT NULL DEFAULT autoincrement,
"jek"			varchar(3) null, 
"data_vedomosti"	varchar(7) null, 
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
