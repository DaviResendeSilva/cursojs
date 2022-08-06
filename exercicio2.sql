create database sistema;
use sistema;
create table cad_cidade (codigo int(2) not null auto_increment, nome varchar(30) not null, uf varchar(2) not null, primary key(codigo));
show tables;
insert into cad_cidade (nome, uf) values ('Curitiba', 'PR');
insert into cad_cidade (nome, uf) values ('Rio de Janeiro', 'RJ');
insert into cad_cidade (nome, uf) values ('Ponta Grossa', 'PR');
insert into cad_cidade (nome, uf) values ('São Paulo', 'SP');
insert into cad_cidade (nome, uf) values ('Ribeirão', 'SP');

select * from cad_cidade;

describe cad_cidade;
alter table cad_cidade rename cidade;
create table funcionario (codigo int(3) not null auto_increment, nome varchar(30) not null, endereço varchar(40) not null, numero int(6) not null, salario decimal(6,2) not null, codigo_cidade int(2) not null, primary key(codigo)) ;

alter table funcionario add sexo char(1);
describe funcionario;
select * from funcionario;
insert into funcionario (nome, endereço, numero, salario, codigo_cidade, sexo) values('Pedro', 'Rua Flores', 30, 1500.00, 2, 'M');
insert into funcionario (nome, endereço, numero, salario, codigo_cidade, sexo) values('Maria', 'Avenida Brasil', 400, 1970.00, 1, 'F');
insert into funcionario (nome, endereço, numero, salario, codigo_cidade, sexo) values('Josi', 'Rua do João', 759, 3800.00, 6, 'F');
insert into funcionario (nome, endereço, numero, salario, codigo_cidade, sexo) values('Marco', 'Avenida Santa Rita', 2, 3450.50, 2, 'M');
select * from funcionario where salario > '2000.00';
select * from funcionario where sexo = 'M' and salario < '1500';

select *from funcionario order by salario asc;

select * from funcionario where salario >= 2000 and salario <= 3000;

select * from funcionario where nome not like 'M%';

alter table funcionario add setor varchar(10);
select * from funcionario;
describe funcionario;

update funcionario set setor='produção';
update funcionario set setor='gerente' where codigo = 3;
describe funcionario;
select * from funcionario;
delete  from funcionario where codigo > '3';
select * from cidade where uf = 'MS';

select funcionario.nome, cidade.nome from funcionado join cidade on funcionario.codigo_cidade = cidade.codigo;

select avg(salario) from funcionario group by sexo;
select sum(salario) from funcionario;
select count(*) as 'qtd cidade' from cidade;