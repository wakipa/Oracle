create table service
(
srv_num number,
srv_nom varchar2(15),
srv_nbr_lit number(3),
constraint pk_service primary key (srv_num),
constraint c_srv_nbr_lit check (srv_nbr_lit between 15 and 250),
constraint c_srv_nom_check  check(srv_nom in ('ORL','URGENCES','CHIRURGIE'))
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