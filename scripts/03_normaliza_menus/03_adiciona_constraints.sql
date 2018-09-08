alter table portal.menu_submenu
	add constraint menu_submenu_ibfk_1
		foreign key (ref_cod_menu_menu) references portal.menu_menu
			on update restrict on delete restrict;

alter table portal.menu_funcionario
	add constraint menu_funcionario_ibfk_1
		foreign key (ref_cod_menu_submenu) references portal.menu_submenu
			on update restrict on delete restrict;

alter table pmicontrolesis.menu
	add constraint menu_ref_cod_menu_pai_fkey
		foreign key (ref_cod_menu_pai) references pmicontrolesis.menu
			on update restrict on delete restrict;

alter table pmicontrolesis.menu
	add constraint menu_ref_cod_menu_submenu_fkey
		foreign key (ref_cod_menu_submenu) references portal.menu_submenu
			on update restrict on delete restrict;

alter table pmicontrolesis.menu
	add constraint fk_to_tutor
		foreign key (ref_cod_tutormenu) references pmicontrolesis.tutormenu;