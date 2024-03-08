create database db_genesis;
use db_genesis;
create table tb_user(
    id int(10) not null auto_increment primary key,
    nome varchar(60)  not null,
    senha  varchar(20) not null ,
    token varchar(60) not null,
    tipo enum('Al', 'Pr', 'Fa', 'Ad', 'Ps', 'Co' ) comment 'Al: Alunos, Pr: professores, Ps:psicologia, Co: coordenação'
);
alter table tb_user add column matricula varchar(12);
alter table tb_user add column qrcode varchar(60);
alter table tb_user add column macaddress_mobile varchar(60);
alter table tb_user add column macaddress_notebook varchar(60);

select * from tb_user;

create table tb_aluno(
  id_aluno int not null  auto_increment primary key,
    id_user int(10) not null,
    matricula varchar(30) not null,
    id_responsavel int (10) not null,
    email_inst varchar(60)  not null ,
    id_segmento int(10) not null
);
alter table tb_aluno drop column matricula;
select * from tb_aluno;
create table tb_professor(
    id_professor int(10) not null auto_increment primary key,
    id_user varchar(60) not null,
    id_turmas int(10) not null,
    id_segmento int(10) not null,
    email_inst varchar(60) not null,
    discplina varchar(20) not null,
    disponibilidade varchar(60) not null
);
create table disciplina(
  id_disciplina int(10) not null  auto_increment primary key ,
    id_professor int(10) not null,
    nome_disciplina varchar(60) not null,
    carga_horária_semanal int(100) not null
);
alter table disciplina add column email_inst varchar(60) not null;

create table frequencia(
    id_frequencia int(10) not null auto_increment primary key,
    id_aluno int(10) not null,
    dia date not null,
    presenca enum('P', 'F') comment 'P: presença, F: falta'
);
create table tb_professor_diciplina(
  id_professor_diciplina int(10) primary key  not null  auto_increment,
    id_professor int(10) not null,
    id_diciplina int(10) not null
);
create table tb_matricula(
  id_matricula int(10) not null primary key auto_increment,
    matricula varchar(60) not null,
    id_turma int(10) not null,
    ano_letivo year not null,
    status enum('A', 'I') comment 'A: Ativo, I: inativo'
);
create table notas(
  id_nota int(10) not null primary key auto_increment,
    id_aluno int(10) not null ,
    id_disciplina int(10) not null,
    nota DECIMAL(3,1) not null,
    data_avaliacao date not null

);
# falta fazer os relacionamentos