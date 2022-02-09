/* Adicionando chave primaria ensaios */
ALTER TABLE IF EXISTS public.ensaios
ADD CONSTRAINT ensaios_pkey PRIMARY KEY (id);

/* Criando tabela doencas */
CREATE TABLE doencas(
	id SERIAL PRIMARY KEY,
	nome TEXT NOT NULL,
	abreviacao TEXT
);

/* Criando tabela ENSAIOS_DOENCAS */
CREATE TABLE ensaios_doencas(
	idensaio_doenca serial PRIMARY KEY,
	chave_doenca TEXT NOT NULL,
	Data_leitura DATE NOT NULL,
	Valor double precision NOT NULL,
	Maximo double precision NOT NULL,
	id_doenca BIGINT NOT NULL,
	id_ensaio BIGINT NOT NULL,
	FOREIGN KEY(id_doenca) REFERENCES doencas(id)
);

/* Inserindo doencas */
INSERT INTO doencas (nome,abreviacao)
VALUES
('Fusarium oxysporum','FO'),
('Fusarium Solani','FS');
	