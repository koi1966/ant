SELECT distinct d.dogovor, (datediff(month,d.data,da.data_nachisl) * d.tarif - (select sum(kk.summ) from karta kk where kk.dogovor = d.dogovor)) as s, d.ostatok 
from dogovor d, karta k, dat da
where d.dogovor = k.dogovor
and d.annulir = 0
and s!=d.ostatok
