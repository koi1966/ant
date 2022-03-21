ALTER TRIGGER tr_delete BEFORE DELETE
   ORDER 1 ON "DBA"."permis"
   REFERENCING OLD AS old_
   FOR EACH ROW
   /* WHEN ( search_condition ) */
BEGIN
insert into dba.log_permis ( Familia, Ima, Otchestvo, Data_born, Data_error, stata_chast, data_reshenia, oragn_reshenia, 
 sydia, lishon_na, vilycheno) 
         values (old_.Familia, old_.Ima, old_.Otchestvo, old_.Data_born, old_.Data_error, old_.stata_chast, old_.data_reshenia, old_.oragn_reshenia,
 old_.sydia, old_.lishon_na, old_.vilycheno)
   ;
END
