--
-- This command file reloads a database that was unloaded using "dbunload".
--
-- (version:  8.0.2.4361)
--

SET OPTION Statistics          = 3
go
SET OPTION Date_order          = 'YMD'
go
SET OPTION describe_java_format= 'binary'
go
SET OPTION PUBLIC.Preserve_source_format = 'OFF'
go


-------------------------------------------------
--   Создание кодов пользователей и предоставление полномочий пользователей
-------------------------------------------------

GRANT CONNECT TO "DBA" IDENTIFIED BY "SQL"
go
GRANT RESOURCE, DBA, SCHEDULE TO "DBA"
go
GRANT CONNECT TO "dbo"  
go
GRANT GROUP TO "dbo"
go
GRANT RESOURCE, DBA TO "dbo"
go
GRANT CONNECT TO "oleg"   IDENTIFIED BY ENCRYPTED '\xD8\x0C\xF6\xEC\x22\x03\x09\x38\x1F\xE2\xBC\x39\x8C\x3C\x0E\xA7\x3A\xE0\xD3\xFE\xDC\x1A\xE7\x36\x39\xCA\x60\xBA\x5A\xEC\x03\x81\x90\x5E\x8D\x02'
go
GRANT RESOURCE, DBA, REMOTE DBA TO "oleg"
go
commit work
go


-------------------------------------------------
--   Создание удаленных системных кодов пользователей и предоставление полномочий
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Создание пользовательских типов
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Установка пользовательских классов
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Предоставление членства пользователей
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Создание внешних серверов
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Создание таблиц
-------------------------------------------------

CREATE TABLE "DBA"."dogovor"
(
	"Dogovor"       		varchar(7) NOT NULL DEFAULT current user,
	"Data"  			date NOT NULL,
	"Famile"        		varchar(17) NOT NULL,
	"I"     			varchar(14) NOT NULL,
	"O"     			varchar(14) NOT NULL,
	"Strit" 			varchar(20) NOT NULL,
	"Dom"   			varchar(7) NOT NULL,
	"Kv"    			varchar(4) NOT NULL,
	"Telefon"       		varchar(8) NOT NULL,
	"Annulir"       		varchar(1) NOT NULL,
	"tarif" 			numeric(18,2) NOT NULL,
	"ostatok"       		numeric(18,2) NOT NULL,
	"test"  			varchar(1) NULL,
	"lgota" 			varchar(1) NULL,
	"opisanie"      		varchar(100) NULL,
	"data_vv"       		date NULL,
	"data_stop"     		date NULL,
	"data_pley"     		date NULL,
	"tarif_kabel"   		numeric(18,2) NULL,
	PRIMARY KEY ("Dogovor")
)
go

ALTER TABLE "DBA"."dogovor" ADD UNIQUE 
(
	"Dogovor"
)
go
CREATE TABLE "DBA"."karta"
(
	"NZA"   			numeric(17,0) NOT NULL DEFAULT autoincrement,
	"Dogovor"       		varchar(7) NOT NULL,
	"Data_R"        		datetime NULL,
	"Data_End"      		date NULL,
	"Famile"        		varchar(17) NOT NULL,
	"I"     			varchar(14) NOT NULL,
	"O"     			varchar(14) NOT NULL,
	"Strit" 			varchar(20) NOT NULL,
	"Dom"   			varchar(7) NOT NULL,
	"Kv"    			varchar(4) NOT NULL,
	"Telefon"       		varchar(8) NOT NULL,
	"Summ"  			numeric(18,2) NOT NULL,
	"Tarif" 			numeric(18,2) NOT NULL,
	"Lico"  			varchar(10) NOT NULL,
	"Annulir"       		varchar(1) NOT NULL,
	"test"  			varchar(1) NULL,
	"kvitancia"     		varchar(7) NULL,
	PRIMARY KEY ("NZA")
)
go

ALTER TABLE "DBA"."karta" ADD UNIQUE 
(
	"NZA"
)
go
CREATE TABLE "DBA"."jek"
(
	"Jek"   			varchar(3) NOT NULL DEFAULT current user,
	"Data_dogovora" 		date NOT NULL,
	"Adress"        		varchar(30) NULL,
	"test"  			varchar(1) NULL,
	PRIMARY KEY ("Jek")
)
go

ALTER TABLE "DBA"."jek" ADD UNIQUE 
(
	"Jek"
)
go
CREATE TABLE "DBA"."lico"
(
	"Nza"   			numeric(17,0) NOT NULL DEFAULT autoincrement,
	"Familia"       		varchar(17) NULL,
	"Ima"   			varchar(10) NULL,
	"Nik"   			varchar(17) NOT NULL,
	"Pass"  			varchar(10) NOT NULL,
	"test"  			varchar(1) NULL,
	PRIMARY KEY ("Nza")
)
go

ALTER TABLE "DBA"."lico" ADD UNIQUE 
(
	"Nza"
)
go
CREATE TABLE "DBA"."strit"
(
	"Nza"   			numeric(17,0) NOT NULL DEFAULT autoincrement,
	"Strit" 			varchar(20) NOT NULL,
	"Jek"   			varchar(9) NOT NULL,
	"test"  			varchar(1) NULL,
	PRIMARY KEY ("Nza")
)
go
CREATE TABLE "DBA"."dom"
(
	"id_dom"        		varchar(10) NOT NULL,
	"strit" 			varchar(20) NOT NULL,
	"dom"   			varchar(7) NOT NULL,
	"podezd"        		numeric(2,0) NOT NULL,
	"krisha"        		varchar(10) NOT NULL,
	"test"  			varchar(1) NOT NULL,
	PRIMARY KEY ("id_dom")
)
go
CREATE TABLE "DBA"."pasport_doma"
(
	"NZA"   			numeric(17,0) NOT NULL DEFAULT autoincrement,
	"Dver"  			varchar(10) NOT NULL,
	"Usilitel"      		varchar(10) NOT NULL,
	"Keyy"  			varchar(10) NOT NULL,
	"Lift"  			varchar(10) NOT NULL,
	"tri"   			varchar(10) NOT NULL,
	"sem"   			varchar(10) NOT NULL,
	"DMV"   			varchar(10) NOT NULL,
	"AKT"   			varchar(30) NOT NULL,
	"Stop_dogovor"  		integer NOT NULL,
	"id_dom"        		varchar(10) NOT NULL,
	"kv_home"       		integer NOT NULL,
	"kv_end"        		integer NOT NULL,
	"podezd"        		varchar(2) NOT NULL,
	"test"  			varchar(1) NULL,
	"data_stop"     		date NULL,
	PRIMARY KEY ("NZA")
)
go

ALTER TABLE "DBA"."pasport_doma" ADD UNIQUE 
(
	"NZA"
)
go
CREATE TABLE "DBA"."tem"
(
	"nza"   			numeric(17,0) NOT NULL,
	"a1"    			varchar(40) NOT NULL,
	"a2"    			varchar(40) NOT NULL,
	"a3"    			varchar(40) NOT NULL,
	"a4"    			varchar(40) NOT NULL,
	"b1"    			integer NOT NULL,
	"b2"    			integer NOT NULL,
	"b3"    			integer NOT NULL,
	"b4"    			integer NOT NULL,
	"c1"    			money NOT NULL,
	"c2"    			money NOT NULL,
	"c3"    			money NOT NULL,
	"c4"    			money NOT NULL,
	"d1"    			datetime NOT NULL,
	"d2"    			datetime NOT NULL,
	"d3"    			date NOT NULL,
	"d4"    			date NOT NULL,
	PRIMARY KEY ("nza")
)
go
CREATE TABLE "DBA"."dat"
(
	"data_nachisl"  		date NOT NULL,
	"NZA"   			varchar(6) NOT NULL
)
go
CREATE TABLE "DBA"."aa"
(
	"dogovor"       		varchar(9) NULL
)
go
CREATE TABLE "DBA"."ob_vedomost"
(
	"id_nza"        		numeric(17,0) NOT NULL DEFAULT autoincrement,
	"jek"   			varchar(3) NULL,
	"data_vedomosti"        	varchar(7) NULL,
	"kol_dogovor"   		numeric(5,0) NULL,
	"kol_dogovor_l" 		numeric(5,0) NULL,
	"borg_n"        		numeric(18,2) NULL,
	"perepl_n"      		numeric(18,2) NULL,
	"narahov"       		numeric(18,2) NULL,
	"nadishlo"      		numeric(18,2) NULL,
	"borg_end"      		numeric(18,2) NULL,
	"perepl_end"    		numeric(18,2) NULL,
	PRIMARY KEY ("id_nza")
)
go
CREATE TABLE "DBA"."tarif"
(
	"NZA"   			numeric(17,0) NOT NULL DEFAULT autoincrement,
	"Dogovor"       		varchar(9) NOT NULL,
	"Data_N"        		date NOT NULL,
	"Data_K"        		date NULL,
	"Status"        		varchar(1) NOT NULL,
	"tarif" 			numeric(18,2) NULL,
	"symma" 			numeric(18,2) NULL,
	PRIMARY KEY ("NZA")
)
go
CREATE TABLE "DBA"."dogovor_stop"
(
	"nza"   			numeric(17,0) NOT NULL DEFAULT autoincrement,
	"dogovor"       		varchar(7) NOT NULL,
	"data_home"     		date NULL,
	"data_end"      		date NULL,
	"status"        		varchar(1) NULL,
	PRIMARY KEY ("nza")
)
go

ALTER TABLE "DBA"."dogovor_stop" ADD UNIQUE 
(
	"nza"
)
go
commit work
go


-------------------------------------------------
--   Перезагрузка статистики
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Перезагрузка данных
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Добавление определений внешних ключей
-------------------------------------------------


CREATE INDEX "Dogovor_Data" ON "DBA"."dogovor"
(
	"Data" ASC
)
go

CREATE INDEX "Dat_voda" ON "DBA"."dogovor"
(
	"data_vv" ASC
)
go

CREATE INDEX "dogovor" ON "DBA"."karta"
(
	"Dogovor" ASC
)
go

CREATE INDEX "data_r" ON "DBA"."karta"
(
	"Data_R" ASC
)
go

CREATE INDEX "data_end" ON "DBA"."karta"
(
	"Data_End" ASC
)
go

CREATE INDEX "famile" ON "DBA"."karta"
(
	"Famile" ASC
)
go

CREATE INDEX "strit" ON "DBA"."karta"
(
	"Strit" ASC
)
go

CREATE INDEX "dom" ON "DBA"."karta"
(
	"Dom" ASC
)
go

CREATE INDEX "in_test" ON "DBA"."karta"
(
	"test" ASC
)
go

CREATE INDEX "in_kvitancia" ON "DBA"."karta"
(
	"kvitancia" ASC
)
go

CREATE INDEX "dog_stop" ON "DBA"."dogovor_stop"
(
	"dogovor" ASC
)
go
commit work
go


-------------------------------------------------
--   Создание функций
-------------------------------------------------

setuser "DBA" 
go
commit work
go


-------------------------------------------------
--   Создание представлений
-------------------------------------------------

setuser "DBA" 
go
commit work
go


-------------------------------------------------
--   Создание сообщений пользователей
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Создание процедур
-------------------------------------------------

setuser "DBA" 
go
commit work
go


-------------------------------------------------
--   Создание триггеров
-------------------------------------------------

setuser "DBA" 
go

create trigger tr_tarif_update before update of tarif
order 1 on DBA.dogovor
referencing old as old_name new as new_name
for each row
begin
  /* dba.tarif - дочерняя таблица */
  /* tarif - имя поля дочерняй таблицы */
  /* new_name.tarif - имя поля ведущей таблицы */
  update dba.tarif set
    data_k = new_name.data,
    symma = (datediff(month,Data_N,new_name.Data)*tarif),
    status = '1' where
    /* условие упдейта */
    /* дочернее  = ведомое */
    dogovor = new_name.dogovor and
    status = '0';
  insert into dba.tarif(tarif,data_n,Data_K,status,dogovor,symma) values(
    new_name.tarif,new_name.data,new_name.data,'0',new_name.dogovor,0)
end
go
COMMENT TO PRESERVE FORMAT ON TRIGGER "DBA"."dogovor"."tr_tarif_update" IS 
{create TRIGGER tr_tarif_update BEFORE UPDATE OF "tarif"
	ORDER 1 ON "DBA"."dogovor"
REFERENCING OLD AS old_name NEW AS new_name 
	FOR EACH ROW
BEGIN
/* dba.tarif - дочерняя таблица */
/* tarif - имя поля дочерняй таблицы */
/* new_name.tarif - имя поля ведущей таблицы */
	update dba.tarif set 
    data_k = new_name.data, 
    symma = (datediff(month,Data_N,new_name.Data) * tarif),
    status = '1'
/* условие упдейта */
/* дочернее  = ведомое */
    where dogovor = new_name.dogovor
    and status = '0';

insert into dba.tarif (tarif, data_n, Data_K, status, dogovor,symma) 
         values (new_name.tarif, new_name.data,new_name.data, '0', new_name.dogovor,0)
END


}
go

create trigger tr_dogovor_insert before insert order 1 on
DBA.dogovor
referencing new as new_name
for each row
begin
  if new_name.tarif_kabel is not null then
    if new_name.data_pley is null then
      insert into dba.tarif(tarif,data_n,data_k,status,dogovor,symma) values(
        new_name.tarif,new_name.data,new_name.data,'5',new_name.dogovor,0)
    end if;
    if new_name.data_pley is not null then
      insert into dba.tarif(tarif,data_n,data_k,status,dogovor,symma) values(
        new_name.tarif,new_name.data_pley,new_name.data_pley,'4',new_name.dogovor,0)
    end if
  end if;
  if new_name.tarif_kabel is null then
    insert into dba.tarif(tarif,data_n,data_k,status,dogovor,symma) values(
      new_name.tarif,new_name.data_pley,new_name.data_pley,'0',new_name.dogovor,0)
  end if;
  insert into dba.karta(dogovor,data_R,Famile,I,O,Strit,Dom,Kv,telefon,tarif,Annulir,Test,Summ,Lico) values(
    new_name.dogovor,new_name.data,new_name.Famile,new_name.I,new_name.O,
    new_name.Strit,new_name.Dom,new_name.Kv,new_name.telefon,
    new_name.tarif,new_name.Annulir,new_name.Test,0,'договор')
end
go
COMMENT TO PRESERVE FORMAT ON TRIGGER "DBA"."dogovor"."tr_dogovor_insert" IS 
{create TRIGGER tr_dogovor_insert BEFORE INSERT
	ORDER 1 ON "DBA"."dogovor"
	 REFERENCING NEW AS new_name 
	FOR EACH ROW
	
BEGIN
if new_name.tarif_kabel is not NULL then
   
    if new_name.data_pley is NULL then
  	insert into dba.tarif (tarif, data_n,data_k, status, dogovor,symma) 
         values (new_name.tarif, new_name.data,new_name.data, '5', new_name.dogovor,0)
    end if;

    if new_name.data_pley is not NULL then
 	insert into dba.tarif (tarif, data_n,data_k, status, dogovor,symma) 
         values (new_name.tarif, new_name.data_pley,new_name.data_pley, '4', new_name.dogovor,0);
    end if;

end if;

if new_name.tarif_kabel is NULL then
   insert into dba.tarif (tarif, data_n,data_k, status, dogovor,symma) 
   values (new_name.tarif, new_name.data_pley,new_name.data_pley, '0', new_name.dogovor,0);
end if;

	insert into dba.karta (dogovor, data_R, Famile, I, O, Strit, Dom, Kv, telefon, tarif,Annulir,Test,Summ,Lico)
         values (new_name.dogovor,new_name.data,new_name.Famile,new_name.I,new_name.O,
                 new_name.Strit, new_name.Dom, new_name.Kv, new_name.telefon, 
                 new_name.tarif,new_name.Annulir,new_name.Test,0,'договор');
END
}
go

create trigger tr_nachislenie before update of data_nachisl
order 1 on DBA.dat
referencing old as old_name new as new_name
for each row
begin
  // Начисление за пользование антеной      - 0 
  // Начисление за пользование кабельным ТV - 4 
  update dba.dogovor set
    ostatok = ostatok+tarif where
    annulir = '0' and
    dogovor not like '20%' and
    // учитывать дату заключения договора
    data < new_name.data_nachisl;
  update dba.dogovor set
    ostatok = ostatok+tarif where
    annulir = '4' and
    data_pley is not null and
    dogovor not like '20%' and
    // учитывать дату заключения договора
    data < new_name.data_nachisl;
  update dba.tarif set
    data_K = new_name.data_nachisl where
    Status in('0','4')
end
go
COMMENT TO PRESERVE FORMAT ON TRIGGER "DBA"."dat"."tr_nachislenie" IS 
{create TRIGGER tr_nachislenie BEFORE UPDATE OF "data_nachisl"
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
UPDATE dba.dogovor 
SET ostatok=ostatok + tarif 
WHERE annulir = '4'
AND data_pley IS NOT NULL
AND dogovor NOT like '20%'
 // учитывать дату заключения договора
AND data < new_name.data_nachisl
;

UPDATE dba.tarif
SET data_K = new_name.data_nachisl 
WHERE Status in ('0','4')

END
}
go

create trigger tr_Data_k_update before update of Data_K
order 1 on DBA.tarif
referencing old as old_ new as new_
for each row
begin
  update dba.tarif set
    symma = (datediff(month,Data_N,new_.Data_K)*tarif) where
    /* условие упдейта */
    /* дочернее = ведомое */
    dogovor = new_.dogovor and
    nza = new_.nza and
    status = new_.status
end
go
COMMENT TO PRESERVE FORMAT ON TRIGGER "DBA"."tarif"."tr_Data_k_update" IS 
{create TRIGGER tr_Data_k_update BEFORE UPDATE OF "Data_K"
	ORDER 1 ON "DBA"."tarif"
	REFERENCING OLD AS old_ NEW AS new_ 
	FOR EACH ROW
	
BEGIN
    update dba.tarif set 
    symma = (datediff(month,Data_N,new_.Data_K) * tarif)
/* условие упдейта */
/* дочернее = ведомое */
    where dogovor = new_.dogovor
    and nza = new_.nza
    and status = new_.status
    ;
END


}
go
setuser "DBA" 
go
commit work
go


-------------------------------------------------
--   Создание определений SQL remote
-------------------------------------------------

CREATE REMOTE TYPE "FILE" ADDRESS ''
go
CREATE REMOTE TYPE "MAPI" ADDRESS ''
go
CREATE REMOTE TYPE "VIM" ADDRESS ''
go
CREATE REMOTE TYPE "SMTP" ADDRESS ''
go
CREATE REMOTE TYPE "FTP" ADDRESS ''
go
GRANT PUBLISH TO "oleg"
go
commit work
go


-------------------------------------------------
--   Удаление определений SQL remote
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Смещения подтверждений RepServer
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Проверка определений представлений
-------------------------------------------------

GRANT CONNECT TO "DBA" IDENTIFIED BY ENCRYPTED '\x28\x7A\x53\x20\x8B\x85\x87\x00\x8E\xD7\xFD\xCF\x91\x49\x19\x0E\x7C\xB5\xF3\xB3\xAA\x55\x11\xED\x3A\xE7\xC8\xD8\xAB\x38\xFB\x1D\xB7\xFB\x6A\x3B'
go
commit work
go


-------------------------------------------------
--   Создание интегрированных входов
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Создание событий
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Задание значений параметров
-------------------------------------------------


SET OPTION Statistics =
go
SET OPTION Date_order =
go
SET OPTION describe_java_format=
go
SET OPTION PUBLIC.Preserve_source_format=
go
commit work
go


-------------------------------------------------
--   Уничтожение кодов пользователей
-------------------------------------------------



--
--Параметры операторов SQL для пользователя PUBLIC
--

SET OPTION "PUBLIC"."Optimization_goal" = 'All-rows'
go
SET OPTION "PUBLIC"."Echo" = 'On'
go
SET OPTION "PUBLIC"."Describe_Java_Format" = 'Varchar'
go
SET OPTION "PUBLIC"."Commit_on_exit" = 'On'
go
SET OPTION "PUBLIC"."Command_delimiter" = ';'
go
SET OPTION "PUBLIC"."Char_OEM_Translation" = 'Detect'
go
SET OPTION "PUBLIC"."Bell" = 'On'
go
SET OPTION "PUBLIC"."Auto_refetch" = 'On'
go
SET OPTION "PUBLIC"."Auto_commit" = 'Off'
go
SET OPTION "PUBLIC"."Read_past_deleted" = 'On'
go
SET OPTION "PUBLIC"."Subsume_row_locks" = 'Off'
go
SET OPTION "PUBLIC"."Optimistic_wait_for_commit" = 'Off'
go
SET OPTION "PUBLIC"."Update_statistics" = 'On'
go
SET OPTION "PUBLIC"."On_Charset_conversion_failure" = 'Ignore'
go
SET OPTION "PUBLIC"."Pinned_cursor_percent_of_cache" = '10'
go
SET OPTION "PUBLIC"."Sort_Collation" = 'Internal'
go
SET OPTION "PUBLIC"."Headings" = 'On'
go
SET OPTION "PUBLIC"."Max_plans_cached" = '20'
go
SET OPTION "PUBLIC"."Exclude_operators" = ''
go
SET OPTION "PUBLIC"."Min_table_size_for_histogram" = '1000'
go
SET OPTION "PUBLIC"."First_day_of_week" = '7'
go
SET OPTION "PUBLIC"."Truncate_timestamp_values" = 'Off'
go
SET OPTION "PUBLIC"."Truncate_date_values" = 'On'
go
SET OPTION "PUBLIC"."Log_max_requests" = '100'
go
SET OPTION "PUBLIC"."Log_detailed_plans" = 'On'
go
SET OPTION "PUBLIC"."Optimization_logging" = 'Off'
go
SET OPTION "PUBLIC"."Prevent_article_pkey_update" = 'Off'
go
SET OPTION "PUBLIC"."Max_work_table_hash_size" = '20'
go
SET OPTION "PUBLIC"."Max_hash_size" = '10'
go
SET OPTION "PUBLIC"."Global_database_id" = '2147483647'
go
SET OPTION "PUBLIC"."User_estimates" = 'Override-magic'
go
SET OPTION "PUBLIC"."Input_format" = 'ASCII'
go
SET OPTION "PUBLIC"."ISQL_log" = ''
go
SET OPTION "PUBLIC"."NULLS" = '(NULL)'
go
SET OPTION "PUBLIC"."SR_TimeStamp_Format" = 'hh:nn:ss.Ssssss yyyy/mm/dd'
go
SET OPTION "PUBLIC"."SR_Time_Format" = 'hh:nn:ss.Ssssss'
go
SET OPTION "PUBLIC"."SR_Date_Format" = 'yyyy/mm/dd'
go
SET OPTION "PUBLIC"."Save_remote_passwords" = 'On'
go
SET OPTION "PUBLIC"."External_remote_options" = 'Off'
go
SET OPTION "PUBLIC"."Compression" = '6'
go
SET OPTION "PUBLIC"."Blob_threshold" = '256'
go
SET OPTION "PUBLIC"."Verify_threshold" = '1000'
go
SET OPTION "PUBLIC"."Subscribe_by_remote" = 'On'
go
SET OPTION "PUBLIC"."Replication_error_piece" = ''
go
SET OPTION "PUBLIC"."Replication_error" = ''
go
SET OPTION "PUBLIC"."Quote_all_identifiers" = 'Off'
go
SET OPTION "PUBLIC"."Delete_old_logs" = 'Off'
go
SET OPTION "PUBLIC"."Verify_all_columns" = 'Off'
go
SET OPTION "PUBLIC"."ISQL_command_timing" = 'On'
go
SET OPTION "PUBLIC"."ISQL_plan_cursor_sensitivity" = 'ASENSITIVE'
go
SET OPTION "PUBLIC"."ISQL_plan_cursor_writability" = 'On'
go
SET OPTION "PUBLIC"."ISQL_plan" = 'Graphical'
go
SET OPTION "PUBLIC"."Qualify_owners" = 'On'
go
SET OPTION "PUBLIC"."ISQL_quote" = ''''
go
SET OPTION "PUBLIC"."ISQL_escape_character" = '\'
go
SET OPTION "PUBLIC"."ISQL_field_separator" = ','
go
SET OPTION "PUBLIC"."Truncation_length" = '30'
go
SET OPTION "PUBLIC"."Statistics" = '3'
go
SET OPTION "PUBLIC"."SQLStart" = ''
go
SET OPTION "PUBLIC"."SQLConnect" = ''
go
SET OPTION "PUBLIC"."Screen_format" = 'TEXT'
go
SET OPTION "PUBLIC"."Quiet" = 'OFF'
go
SET OPTION "PUBLIC"."Percent_as_comment" = 'On'
go
SET OPTION "PUBLIC"."Output_nulls" = ''
go
SET OPTION "PUBLIC"."Output_length" = '0'
go
SET OPTION "PUBLIC"."Output_format" = 'ASCII'
go
SET OPTION "PUBLIC"."On_error" = 'Prompt'
go
SET OPTION "PUBLIC"."Truncate_with_auto_commit" = 'On'
go
SET OPTION "PUBLIC"."Java_input_output" = 'Off'
go
SET OPTION "PUBLIC"."Preserve_source_format" = 'On'
go
SET OPTION "PUBLIC"."Ansi_update_constraints" = 'Cursors'
go
SET OPTION "PUBLIC"."SQL_flagger_warning_level" = 'W'
go
SET OPTION "PUBLIC"."SQL_flagger_error_level" = 'W'
go
SET OPTION "PUBLIC"."Non_keywords" = ''
go
SET OPTION "PUBLIC"."Delayed_commit_timeout" = '500'
go
SET OPTION "PUBLIC"."Delayed_commits" = 'OFF'
go
SET OPTION "PUBLIC"."Cooperative_commit_timeout" = '250'
go
SET OPTION "PUBLIC"."Cooperative_commits" = 'ON'
go
SET OPTION "PUBLIC"."Query_plan_on_open" = 'OFF'
go
SET OPTION "PUBLIC"."Automatic_timestamp" = 'OFF'
go
SET OPTION "PUBLIC"."Allow_nulls_by_default" = 'ON'
go
SET OPTION "PUBLIC"."Quoted_identifier" = 'ON'
go
SET OPTION "PUBLIC"."Wait_for_commit" = 'OFF'
go
SET OPTION "PUBLIC"."Time_format" = 'HH:NN:SS.SSS'
go
SET OPTION "PUBLIC"."Timestamp_format" = 'YYYY-MM-DD HH:NN:SS.SSS'
go
SET OPTION "PUBLIC"."Thread_swaps" = '18'
go
SET OPTION "PUBLIC"."Assume_distinct_servers" = 'Off'
go
SET OPTION "PUBLIC"."Thread_stack" = '750'
go
SET OPTION "PUBLIC"."Scale" = '6'
go
SET OPTION "PUBLIC"."Row_counts" = 'OFF'
go
SET OPTION "PUBLIC"."Replicate_all" = 'OFF'
go
SET OPTION "PUBLIC"."Recovery_time" = '2'
go
SET OPTION "PUBLIC"."Precision" = '30'
go
SET OPTION "PUBLIC"."On_tsql_error" = 'Conditional'
go
SET OPTION "PUBLIC"."Login_procedure" = 'sp_login_environment'
go
SET OPTION "PUBLIC"."Lock_rejected_rows" = 'OFF'
go
SET OPTION "PUBLIC"."Isolation_level" = '0'
go
SET OPTION "PUBLIC"."Date_order" = 'YMD'
go
SET OPTION "PUBLIC"."Date_format" = 'YYYY-MM-DD'
go
SET OPTION "PUBLIC"."Conversion_error" = 'ON'
go
SET OPTION "PUBLIC"."Checkpoint_time" = '60'
go
SET OPTION "PUBLIC"."Blocking_timeout" = '0'
go
SET OPTION "PUBLIC"."Blocking" = 'ON'
go
SET OPTION "PUBLIC"."Thread_count" = '0'
go
SET OPTION "PUBLIC"."Ansi_integer_overflow" = 'OFF'
go
SET OPTION "PUBLIC"."Ansi_blanks" = 'OFF'
go
SET OPTION "PUBLIC"."Divide_by_zero_error" = 'ON'
go
SET OPTION "PUBLIC"."Extended_join_syntax" = 'On'
go
SET OPTION "PUBLIC"."Optimization_level" = '9'
go
SET OPTION "PUBLIC"."TDS_Empty_string_is_null" = 'Off'
go
SET OPTION "PUBLIC"."Auditing" = 'Off'
go
SET OPTION "PUBLIC"."Min_password_length" = '0'
go
SET OPTION "PUBLIC"."Max_cursor_count" = '50'
go
SET OPTION "PUBLIC"."Max_statement_count" = '50'
go
SET OPTION "PUBLIC"."Ansi_close_cursors_on_rollback" = 'Off'
go
SET OPTION "PUBLIC"."Java_page_buffer_size" = '50'
go
SET OPTION "PUBLIC"."Java_namespace_size" = '4000000'
go
SET OPTION "PUBLIC"."Cis_rowset_size" = '50'
go
SET OPTION "PUBLIC"."Cis_option" = '0'
go
SET OPTION "PUBLIC"."Continue_after_raiserror" = 'OFF'
go
SET OPTION "PUBLIC"."Java_heap_size" = '1000000'
go
SET OPTION "PUBLIC"."String_rtruncation" = 'OFF'
go
SET OPTION "PUBLIC"."Escape_character" = 'ON'
go
SET OPTION "PUBLIC"."Prefetch" = 'On'
go
SET OPTION "PUBLIC"."Float_as_double" = 'OFF'
go
SET OPTION "PUBLIC"."Database_authentication" = ''
go
SET OPTION "PUBLIC"."Suppress_TDS_debugging" = 'Off'
go
SET OPTION "PUBLIC"."Login_mode" = 'Standard'
go
SET OPTION "PUBLIC"."Background_priority" = 'OFF'
go
SET OPTION "PUBLIC"."Fire_triggers" = 'ON'
go
SET OPTION "PUBLIC"."Nearest_century" = '0'
go
SET OPTION "PUBLIC"."Chained" = 'ON'
go
SET OPTION "PUBLIC"."Tsql_hex_constant" = 'ON'
go
SET OPTION "PUBLIC"."RI_Trigger_time" = 'AFTER'
go
SET OPTION "PUBLIC"."Tsql_variables" = 'OFF'
go
SET OPTION "PUBLIC"."Close_on_endtrans" = 'ON'
go
SET OPTION "PUBLIC"."Ansi_permissions" = 'ON'
go
SET OPTION "PUBLIC"."Ansinull" = 'ON'
go
SET OPTION "PUBLIC"."Default_timestamp_increment" = '1'
go


--
--Параметры операторов SQL для пользователя DBA
--

SET OPTION "DBA"."Output_format" = 'dBASEIII'
go
SET OPTION "DBA"."ISQL_plan" = 'Graphical'
go
SET OPTION "DBA"."ISQL_command_timing" = 'On'
go
commit work
go

