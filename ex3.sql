use aula;
create table funcionario (cod int(4) not null auto_increment, nome varchar(45) not null, sexo char(1), salario decimal(6,2), primary key (cod));
insert into funcionario values (null, 'Pedro', 'M', 7820.00);
insert into funcionario values (null, 'Maria', 'F', 9320.00);
insert into funcionario values (null, 'Joao', 'M', 9390.00);
insert into funcionario values (null, 'Marta', 'F', 3450.75);
select * from funcionario;
delimiter $$
create function salario(id smallint)
returns decimal(6,2)
return (select salario from funcionario where cod = id);
$$
select salario (1);
select * from funcionario;


create table backup (cod int(3) not null auto_increment, nome varchar(45) not null, salario decimal(7,2) not null, primary key (cod));
show tables;
delimiter $$
create trigger faz_backup before delete
on funcionario
for each row
begin
insert into backup (nome, salario) values (old.nome, old.salario);
end
$$

select * from backup;
delete from funcionario where cod =1;

delimiter $$
create function num_backup()
returns int
return (select count(*) from backup);
$$
select num_backup();

delimiter $$
create procedure num_sexo(p_sexo char)
begin 
if (p_sexo = 'M') then
select count(*) from funcionario where sexo = 'M';
elseif (p_sexo = 'F') then
select count(*) from funcionario where sexo = 'F';
end if;
end;
$$
call num_sexo('F');
select * from funcionario;

delimiter $$
create procedure ver_func(p_sexo char)
begin
if(p_sexo = 'M') then
select  * from funcionario where sexo = 'M';
elseif (p_sexo = 'F') then
select * from funcionario where sexo = 'F';
end if;
end
$$
call ver_func('F');
