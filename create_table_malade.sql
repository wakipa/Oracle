create table malade
(
mal_num number,
mal_nom varchar2(15),
mal_service number(2),
constraint pk_malade primary key (mal_num),
constraint fk_mal_srv foreign key(mal_service) references service
)
tablespace users
storage( initial 4 K
	 next 4K
	 pctincrease 0
	 minextents 1
	 maxextents 10
	)
pctfree 5
;