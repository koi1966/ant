update dogovor
set data ='2003.01.01'
go

insert into karta (dogovor,data_r,data_end,Famile,I,O,strit,dom,kv,Telefon,summ, tarif,lico,Annulir,test)
select d.dogovor,d.data,d.data,d.Famile,d.I,d.O,d.strit,d.dom,d.kv,d.Telefon,(d.tarif-d.tarif) as summ,d.tarif,'договор','0','0'
from dogovor d
go
commit work
