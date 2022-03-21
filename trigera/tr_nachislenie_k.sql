ALTER TRIGGER tr_nachislenie_k BEFORE UPDATE OF "data_nachisl_k"
	ORDER 2 ON "DBA"."dat"
	 REFERENCING OLD AS old_name NEW AS new_name 
	FOR EACH ROW
	/* WHEN ( search_condition ) */
BEGIN
UPDATE dba.dogovor 
SET ostatok=ostatok + tarif 
WHERE annulir = '4'
AND data_pley IS NOT NULL
AND dogovor NOT like '20%'
 // учитывать дату заключения договора
AND data < new_name.data_nachisl_k
;

UPDATE dba.tarif
SET data_K = new_name.data_nachisl_k 
WHERE Status = '4'
// WHERE Status in ('0','4')	;
END