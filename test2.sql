SELECT kk.Dogovor, kk.Data_R, kk.Data_End, kk.Famile, kk.I, kk.O,kk.Strit,kk.Dom,kk.Kv, kk.Telefon, kk.Summ, d.Tarif, kk.Annulir, kk.test, kk.lico,kk.kvitancia,d.lgota, d.ostatok AS sskk, case when sskk > 0 then sskk else 0 end as dolg,case when sskk < 0 then sskk else 0 end as perepl,(kk.strit + kk.dom) AS rr,(kk.Famile +'  '+left(kk.I,1)+left(kk.O,1)) AS Fam,l.familia,d.opisanie 
FROM karta kk, lico l, dogovor d, ukaz u  
WHERE kk.lico in (l.nik,l.familia) 
AND d.dogovor = kk.dogovor  
and kk.dogovor = u.dogovor  
AND kk.annulir in ('0','1','2') 
AND kk.annulir not in ('1','6') 
AND kk.annulir not in ('2','5') 
AND kk.Dogovor like '10%' 
AND kk.Data_R=(SELECT max(k2.Data_R) FROM karta k2 WHERE k2.Dogovor = kk.Dogovor) 
ORDER BY kk.Dogovor, kk.Data_R





SELECT distinct kk.Dogovor, kk.Data_R, kk.Data_End, kk.Famile, kk.I, kk.O,kk.Strit,kk.Dom,kk.Kv, kk.Telefon, kk.Summ, d.Tarif, kk.Annulir, kk.test, kk.lico,kk.kvitancia,d.lgota, d.ostatok AS sskk, case when sskk > 0 then sskk else 0 end as dolg,case when sskk < 0 then sskk else 0 end as perepl,(kk.strit + kk.dom) AS rr,(kk.Famile +'  '+left(kk.I,1)+left(kk.O,1)) AS Fam,l.familia,d.opisanie 
FROM karta kk, lico l, dogovor d, ukaz u  
WHERE kk.lico in (l.nik,l.familia) 
AND d.dogovor = kk.dogovor  
and kk.dogovor != u.dogovor  
AND kk.annulir in ('0','1','2') 
AND kk.annulir not in ('1','6') 
AND kk.annulir not in ('2','5') 
AND kk.Dogovor like '10%' 
AND kk.Data_R=(SELECT max(k2.Data_R) FROM karta k2 WHERE k2.Dogovor = kk.Dogovor) 
ORDER BY kk.Dogovor, kk.Data_R