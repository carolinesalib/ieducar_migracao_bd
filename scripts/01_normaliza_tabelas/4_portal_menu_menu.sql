alter table portal.menu_menu
  add caminho varchar(255) default '#' :: character varying;

alter table portal.menu_menu
  add ord_menu integer default 9999;

alter table portal.menu_menu
  add ativo boolean default true;

alter table portal.menu_menu
  add icon_class varchar(20);

