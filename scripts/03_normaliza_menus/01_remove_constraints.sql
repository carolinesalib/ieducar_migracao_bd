alter table portal.menu_submenu drop constraint menu_submenu_ibfk_1;
alter table portal.menu_funcionario drop constraint menu_funcionario_ibfk_1;
alter table pmicontrolesis.menu drop constraint menu_ref_cod_menu_pai_fkey;
alter table pmicontrolesis.menu drop constraint menu_ref_cod_menu_submenu_fkey;
alter table pmicontrolesis.menu drop constraint fk_to_tutor;
