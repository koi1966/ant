UPDATE dogovor SET d.ostatok = d.ostatok + 0.10, d.tarif = 0.60 
 FROM dogovor d
 WHERE d.tarif = 0.50
 AND d.lgota != '1'
go

UPDATE dogovor SET d.lgota = '0'
 FROM dogovor d
 WHERE d.lgota is null
go

commit WORK

