create database aula;
use aula;

create table usuario (codigo int(3) not null auto_increment, login varchar(15) not null, senha varchar(15) not null, primary key (codigo));
show tables;
create table cidade (codigo int(3) not null auto_increment, nome varchar(30), primary key(codigo));

create user gerencia identified by '123';
grant select on aula.cidade to gerencia;
grant all privileges on aula.cidade to gerencia;
grant all privileges on *.* to gerencia;
revoke all privileges on aula.* from gerencia;
drop user gerencia;

create user chefe@localhost identified by '123';
grant all privileges on aula.* to chefe@localhost;
drop user chefe@localhost;