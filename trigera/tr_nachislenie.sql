ALTER TRIGGER tr_nachislenie BEFORE UPDATE OF "data_nachisl"
	ORDER 1 ON "DBA"."dat"
	REFERENCING OLD AS old_name NEW AS new_name
	FOR EACH ROW
	
BEGIN
// Начисление за пользование антеной      - 0 
// Начисление за пользование кабельным ТV - 4 
UPDATE dba.dogovor 
SET ostatok=ostatok + tarif 
WHERE annulir = '0'
AND dogovor NOT like '20%'
 // учитывать дату заключения договора
AND data < new_name.data_nachisl
;
 //UPDATE dba.dogovor 
 //SET ostatok=ostatok + tarif 
 //WHERE annulir = '4'
 //AND data_pley IS NOT NULL
 //AND dogovor NOT like '20%'
 // // учитывать дату заключения договора
 //AND data < new_name.data_nachisl
 //;

UPDATE dba.tarif
SET data_K = new_name.data_nachisl 
WHERE Status = '0'
// WHERE Status in ('0','4')
END