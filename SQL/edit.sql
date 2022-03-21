UPDATE dogovor SET d.ostatok = d.ostatok + 0.20, d.tarif = 0.50 FROM karta k, dogovor d
 WHERE k.Data_end >= '2002-10-01'
 AND k.dogovor = d.dogovor
 AND k.dogovor in (select dd.dogovor from dogovor dd where dd.annulir ='0'
 AND dd.tarif = 0.60)
go
commit
go

