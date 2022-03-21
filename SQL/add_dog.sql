alter table "DBA".dogovor add
  data_vv date null

comment on column "DBA".dogovor.data_vv is null

create index Dat_voda on "DBA".dogovor(data_vv asc)
go
comment on index "DBA".Dat_voda is null
go

comment on index "DBA".Dat_voda is 'data_vvoda'
go

COMMIT WORK
