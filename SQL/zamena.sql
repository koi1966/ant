update dogovor 
SET d.ostatok = ((select sum(t.symma) as sym_tar from tarif t where t.dogovor = d.dogovor)-
(select sum(summ) as summa from karta k where k.dogovor = d.dogovor))
from dogovor d
where d.annulir = 0