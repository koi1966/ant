// - прога
//  при возобновлении договора проверить по тарифу на двойную запись восстановления
//  создать процедуру

// аннулирование и приостановка договоров записывалась
// в ant_old - перенести в ant

// CALL sa_table_fragmentation 
// 


insert into tarif (dogovor,data_N,status,tarif)
select dogovor,data,annulir,tarif
from dogovor
where annulir = '0'
and data <='2004.06.01'

go

// заполянем таблицу tarif из таблицы dogovor
// новый  tarif - 0.60

insert into tarif (dogovor,data_N,data_K,status,tarif,symma)
select dogovor,data,'2004.01.01','1',0.50,symma = (datediff(month,Data,'2004.01.01') * 0.5)
from dogovor
where tarif =0.6
and data < '2004.01.01'
and Annulir = '0'

go

insert into tarif (dogovor,data_N,data_K,status,tarif,symma)
select dogovor,'2004.01.01',data_nachisl,'0',0.60,symma = (datediff(month,'2004.01.01',data_nachisl) * 0.6)
from dogovor, dat
where tarif =0.6
and data < '2004.01.01'
and Annulir = '0'

go

insert into tarif (dogovor,data_N,data_K,status,tarif,symma)
select dogovor,Data,data_nachisl,'0',0.60,symma = (datediff(month,Data,data_nachisl) * 0.6)
from dogovor, dat
where tarif =0.6
and data >= '2004.01.01'
and Annulir = '0'

go



// заполянем таблицу tarif из таблицы dogovor
// новый  tarif - 0.80

insert into tarif (dogovor,data_N,data_K,status,tarif,symma)
select dogovor,data,'2004.01.01','1',0.60,symma = (datediff(month,Data,'2004.01.01') * 0.6)
from dogovor
where tarif =0.8
and data < '2004.01.01'
and Annulir = '0'

go

insert into tarif (dogovor,data_N,data_K,status,tarif,symma)
select dogovor,'2004.01.01',data_nachisl,'0',0.80,symma = (datediff(month,'2004.01.01',data_nachisl) * 0.8)
from dogovor, dat
where tarif =0.8
and data < '2004.01.01'
and Annulir = '0'

go

insert into tarif (dogovor,data_N,data_K,status,tarif,symma)
select dogovor,Data,data_nachisl,'0',0.80,symma = (datediff(month,Data,data_nachisl) * 0.8)
from dogovor, dat
where tarif =0.8
and data >= '2004.01.01'
and Annulir = '0'

go


// заполянем таблицу tarif из таблицы dogovor
// новый  tarif - 1.60

insert into tarif (dogovor,data_N,data_K,status,tarif,symma)
select dogovor,data,'2004.01.01','1',1.20,symma = (datediff(month,Data,'2004.01.01') * 1.2)
from dogovor
where tarif =1.6
and data < '2004.01.01'
and Annulir = '0'

go

insert into tarif (dogovor,data_N,data_K,status,tarif,symma)
select dogovor,'2004.01.01',data_nachisl,'0',1.60,symma = (datediff(month,'2004.01.01',data_nachisl) * 1.6)
from dogovor, dat
where tarif =1.6
and data < '2004.01.01'
and Annulir = '0'

go

insert into tarif (dogovor,data_N,data_K,status,tarif,symma)
select dogovor,Data,data_nachisl,'0',1.60,symma = (datediff(month,Data,data_nachisl) * 1.6)
from dogovor, dat
where tarif =1.6
and data >= '2004.01.01'
and Annulir = '0'

go



// добавить в таблицу договоа два поля

alter table DBA.dogovor add
  data_pley date null
go
COMMIT WORK
go
alter table DBA.dogovor add
  tarif_kabel numeric(18,2) null
go
COMMIT WORK
go
