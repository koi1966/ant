ALTER procedure DBA.pr_insert_e(in @kart_id varchar(20),in @data_oper datetime,in @num_dv varchar(20),in @num_cuz varchar(20),in @num_shas varchar(20),in @data_v numeric(4),in @color varchar(25),in @cuzov varchar(25),in @tip varchar(25),in @marka varchar(20),in @model varchar(20),in @who smallint,in @teh_pasp varchar(9),in @type_zn integer,in @znak varchar(9),in @annot varchar(100),in @code_oper varchar(10),in @region varchar(25),in @regim varchar(15),in @power varchar(8),in @volume varchar(8),in @cylinder varchar(4),in @door varchar(3),in @fuel varchar(1),in @place varchar(8),in @tom varchar(8),in @sob_id varchar(1),in @family varchar(80),in @fname varchar(18),in @sec_name varchar(18),in @permis varchar(9),in @born datetime,in @pasport varchar(14),in @pasp_cto varchar(30),in @obl varchar(20),in @rajon varchar(30),in @city varchar(30),in @street varchar(30),in @house varchar(5),in @corp varchar(5),in @kv varchar(5),in @tel varchar(10),in @tel_work varchar(10),in @office varchar(25),in @dolj varchar(15),in @obl_g varchar(20),in @rajon_g varchar(30),in @city_g varchar(30),in @street_g varchar(30),in @corp_g varchar(5),in @house_g varchar(5),in @tel_g varchar(10),in @masa1 varchar(20))
/* ( @parameter_name parameter_value [= default_value] [OUTPUT], ... ) */
begin
  insert into karta(kart_id,
    data_oper,num_dv,num_cuz,num_shas,data_v,
    color,cuzov,tip,marka,model,who,teh_pasp,type_zn,znak,
    annot,code_oper,
    region,regim,power,volume,cylinder,
    door,fuel,place,tom,sob_id,family,fname,sec_name,
    permis,born,pasport,pasp_cto,
    obl,rajon,city,street,house,corp,kv,tel,tel_work,office,
    dolj,obl_g,rajon_g,city_g,street_g,corp_g,house_g,tel_g,
    masa1) values(
    @kart_id,@data_oper,@num_dv,@num_cuz,@num_shas,@data_v,
    @color,@cuzov,@tip,@marka,@model,@who,@teh_pasp,@type_zn,@znak,
    @annot,@code_oper,
    @region,@regim,@power,@volume,@cylinder,
    @door,@fuel,@place,@tom,@sob_id,@family,@fname,@sec_name,
    @permis,@born,@pasport,@pasp_cto,
    @obl,@rajon,@city,@street,@house,@corp,@kv,@tel,@tel_work,@office,
    @dolj,@obl_g,@rajon_g,@city_g,@street_g,@corp_g,@house_g,@tel_g,
    @masa1)
end
