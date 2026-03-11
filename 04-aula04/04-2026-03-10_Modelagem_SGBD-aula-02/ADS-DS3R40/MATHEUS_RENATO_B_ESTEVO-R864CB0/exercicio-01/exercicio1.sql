CREATE TABLE UNIVERSIDADES (
    CNPJ VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE PROFESSORES (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(255),
    titulo VARCHAR(255),
    CNPJ_universidade VARCHAR(14),
    FOREIGN KEY (CNPJ_universidade) REFERENCES UNIVERSIDADES(CNPJ)
);

CREATE TABLE CURSOS (
    codigo_curso INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    duracao INT,
    coordenador VARCHAR(255),
    CNPJ_universidade VARCHAR(14),
    FOREIGN KEY (CNPJ_universidade) REFERENCES UNIVERSIDADES(CNPJ)
);

CREATE TABLE DISCIPLINAS (
    codigo_disciplina INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    cpf_professor VARCHAR(11),
    codigo_curso INTEGER,
    FOREIGN KEY (cpf_professor) REFERENCES PROFESSORES(cpf),
    FOREIGN KEY (codigo_curso) REFERENCES CURSOS(codigo_curso)
);