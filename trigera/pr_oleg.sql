ALTER procedure DBA.pr_oleg(in @kart_id varchar(20),in @data_oper datetime,in @num_dv varchar(20),in @num_cuz varchar(20),in @num_shas varchar(20))
 /* ( @parameter_name parameter_value [= default_value] [OUTPUT], ... ) */
begin
  insert into oleg(kart_id,
    data_oper,num_dv,num_cuz,num_shas) values(
    @kart_id,@data_oper,@num_dv,@num_cuz,@num_shas)
end
