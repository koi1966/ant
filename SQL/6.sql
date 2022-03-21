alter table "DBA".dogovor add
  data_stop date null
go

comment on column "DBA".dogovor.data_stop is null
go

alter table "DBA".pasport_doma add
  data_stop date null
go

create table "dba".dogovor_stop(
  nza numeric(17,0)  NOT NULL DEFAULT autoincrement,
  dogovor varchar(7) not null,
  data_home date null,
  data_end date null,
  primary key(nza),
  )
go

comment on column "dba".dogovor_stop.nza is null
go

ALTER TABLE "DBA"."dogovor_stop" ADD UNIQUE ( "NZA"
)
go

comment on column "dba".dogovor_stop.dogovor is null
go

comment on column "dba".dogovor_stop.data_home is null
go

comment on column "dba".dogovor_stop.data_end is null
go

create index dog_stop on "DBA".dogovor_stop(dogovor asc)
go

comment on index "DBA".dog_stop is null
go

comment on index "DBA".dog_stop is null
go

COMMIT WORK
