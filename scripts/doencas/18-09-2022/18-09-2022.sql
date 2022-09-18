/* Criando tabela genotipos_doencas */
CREATE TABLE genotipos_doencas(
	idgenotipo_doencas serial primary key,
	valor float not null,
	id_genotipo bigint references genotipos(id),
	id_doenca bigint references doencas(id)
)

/* Inserindo tipo de grao 'p' */
INSERT INTO tipos_de_graos(sigla) VALUES('p')

/* inserindo novos genotipos */
INSERT INTO 
	genotipos(nome,id_tipo_grao) 
VALUES 
	('PR10-4-4/24',9),
	('FAP-F3-2',1),
	('TAACariocaL-013',1),
    ('IAC97-2',1),
    ('Marhe',1);
	
/* Inserindo dados doencas */
INSERT INTO 
	genotipos_doencas(valor,id_genotipo,id_doenca) 
VALUES 
	(1.6,16,1),
	(1.8,153,1),
	(1.6,16,1),
	(1.4,26,1),
	(1,150,1),
	(0.6,16,1),
	(0.6,16,1),
	(0.6,180,1),
	(0.2,36,1),
	(0.1,20,1),
	(0.1,13,1),
	(0.1,10,1),
	(0.1,19,1),
	(0.2,37,1),
	(0.6,30,1),
	(0.3,53,1),
	(0.1,34,1),
	(0.1,18,1),
	(0.2,27,1),
	(0.5,150,1),
	(0.1,180,1),
	(0.2,29,1),
	(1.2,143,1),
	(0.2,45,1),
	(0.2,54,1),
	(0.6,27,1),
	(0.8,8,1),
	(0.2,153,1),
	(0.2,20,1),
	(0.1,26,1),
	(0.2,37,1),
	(0.6,18,1),
	(0.2,11,1),
	(0.1,19,1),
	(0.6,30,1),
	(0.6,34,1),
	(0.2,13,1),
	(0.2,150,1),
	(0.8,147,1),
	(0.1,45,1),
	(0.5,29,1),
	(0.5,27,1),
	(0.8,143,1),
	(0.1,11,1),
	(0.2,34,1),
	(0.4,13,1),
	(0.5,58,1),
	(0.6,28,1),
	(0.4,20,1),
	(0.1,54,1),
	(0.4,29,1),
	(0.6,45,1),
	(0.2,18,1),
	(0.6,53,1),
	(0.1,26,1),
	(0.2,37,1),
	(0.8,30,1),
	(0.1,181,1),
	(0.1,153,1),
	(0.2,19,1),
	(0.3,58,1),
	(0.2,18,1),
	(1.5,30,1),
	(0.6,28,1),
	(0.8,143,1),
	(0.2,36,1),
	(0.3,34,1),
	(0.6,27,1),
	(0.6,29,1),
	(0.2,16,1),
	(0.2,20,1),
	(1,150,1),
	(0.4,54,1),
	(1,47,1),
	(0.8,13,1),
	(0.4,63,1),
	(1.2,27,1),
	(0.2,12,1),
	(0.4,63,1),
	(0.6,63,1),
	(0.4,56,1),
	(0.4,12,1),
	(1.2,36,1),
	(0.6,147,1),
	(0.8,56,1),
	(1,20,1),
	(0.1,20,1),
	(0.5,20,1),
	(0.3,20,1),
	(1.5,149,1),
	(0.3,149,1),
	(0.2,149,1),
	(1.5,149,1),
	(0.1,155,1),
	(0.1,155,1),
	(0,155,1),
	(0.3,147,1),
	(0.2,147,1),
	(0.5,19,1),
	(0.1,19,1),
	(0.1,19,1),
	(0.3,19,1),
	(1.5,63,1),
	(0.1,37,1),
	(0.2,50,1),
	(1.5,50,1),
	(1,18,1),
	(0,152,1),
	(0,152,1),
	(0,152,1),
	(0.2,31,1),
	(0.1,31,1),
	(0,31,1),
	(0,31,1),
	(1.2,38,1),
	(0.2,38,1),
	(0.2,57,1),
	(0.5,57,1),
	(0.8,57,1),
	(0.1,61,1),
	(0,61,1),
	(0.2,60,1),
	(0.3,60,1),
	(0.5,60,1),
	(0,68,1),
	(0.1,68,1),
	(0.8,68,1),
	(0.3,27,1),
	(1,17,1),
	(1,17,1),
	(1.5,17,1),
	(0.1,148,1),
	(0.1,148,1),
	(0.1,148,1),
	(0,12,1),
	(0.1,12,1),
	(0.5,16,1),
	(0.1,16,1),
	(0.2,16,1),
	(0,153,1),
	(0.1,153,1),
	(0.5,153,1),
	(0.5,153,1),
	(0.1,150,1),
	(0.1,150,1),
	(0.1,150,1),
	(0.1,13,1),
	(0.5,13,1),
	(0.1,13,1),
	(0.5,29,1),
	(0.5,29,1),
	(1,29,1),
	(1.5,45,1),
	(0.3,45,1),
	(0.3,59,1),
	(0.5,59,1),
	(1,59,1),
	(0.3,145,1),
	(1.5,145,1),
	(1.5,13,1),
	(1,144,1),
	(1.5,19,1),
	(1.5,18,1),
	(0.5,152,1),
	(0.5,12,1),
	(0.5,75,1),
	(0.5,153,1),
	(1,150,1),
	(0.8,145,1),
	(0.1,159,1),
	(1,166,1),
	(1.5,158,1),
	(0.8,151,1),
	(0.8,67,1),
	(0.2,159,1),
	(0.8,18,1),
	(1.5,153,1),
	(0.8,18,1),
	(0.2,144,1),
	(0.2,159,1),
	(0.1,150,1),
	(1,75,1),
	(1.5,158,1),
	(0.8,18,1),
	(1,155,1),
	(0.8,75,1),
	(0.5,153,1),
	(0.8,12,1),
	(1.5,14,1),
	(1,20,1),
	(0.8,13,1),
	(0.2,147,1),
	(0.2,19,1),
	(0.4,63,1),
	(0.1,158,1),
	(0.1,37,1),
	(0.2,55,1),
	(0.2,77,1),
	(0.2,178,1),
	(0.8,161,1),
	(0.3,27,1),
	(0.4,17,1),
	(0.1,70,1),
	(0.3,12,1),
	(0.4,75,1),
	(0.8,16,1),
	(0.5,153,1),
	(1,150,1),
	(0.2,151,1),
	(0.1,145,1),
	(0.4,59,1),
	(1,182,1),
	(0.8,81,1),
	(0.1,29,1),
	(0,156,1),
	(0,156,1),
	(0,55,1),
	(0.5,150,1),
	(0.2,158,1),
	(0.1,77,1),
	(0.8,29,1),
	(0,16,1),
	(0,75,1),
	(0.1,151,1),
	(0,153,1),
	(0.8,66,1),
	(0.1,63,1),
	(0.5,59,1),
	(0.8,145,1),
	(0.5,20,1),
	(0.2,19,1),
	(0.2,37,1),
	(0.2,84,1),
	(0.5,38,1),
	(0,178,1),
	(0,147,1),
	(1.5,81,1),
	(0.2,161,1),
	(0.5,17,1),
	(0.1,12,1),
	(0,4,1),
	(0.2,13,1),
	(0.8,14,1),
	(0,27,1),
	(0.5,70,1),
	(0,161,1),
	(0.8,37,1),
	(0,158,1),
	(0.4,81,1),
	(0.5,17,1),
	(0,63,1),
	(0.2,4,1),
	(1.5,84,1),
	(0,75,1),
	(0.4,55,1),
	(0.5,16,1),
	(0,12,1),
	(0.2,27,1),
	(0,147,1),
	(0.1,13,1),
	(0.2,153,1),
	(0,77,1),
	(0.8,182,1),
	(0.8,145,1),
	(0.2,19,1),
	(0.2,20,1),
	(0.8,29,1),
	(0,150,1),
	(0,151,1),
	(0.5,38,1),
	(0.3,70,1),
	(0,156,1),
	(0.2,59,1),
	(0,178,1),
	(0.8,182,1),
	(0.5,38,1),
	(0,16,1),
	(0.5,63,1),
	(0.2,17,1),
	(0.5,4,1),
	(0,12,1),
	(0.2,37,1),
	(0,75,1),
	(0.1,161,1),
	(0.2,27,1),
	(0,70,1),
	(1.5,66,1),
	(0,59,1),
	(0,77,1),
	(0.5,151,1),
	(0.5,19,1),
	(1,145,1),
	(0.8,84,1),
	(0.2,55,1),
	(0.3,153,1),
	(0.8,29,1),
	(0.5,150,1),
	(0.5,178,1),
	(0.2,158,1),
	(0.8,81,1),
	(0,13,1),
	(0.5,147,1),
	(1.5,20,1),
	(0.1,156,1),
	(1,147,1),
	(1,158,1),
	(1,17,1),
	(10,9,1),
	(1,75,1),
	(1,16,1),
	(1,151,1),
	(1,145,1),
	(1,59,1),
	(1,29,1),
	(1,145,1),
	(1,75,1),
	(1,183,1),
	(1,158,1),
	(1,161,1),
	(1,12,1),
	(1,153,1),
	(10,161,1),
	(1,77,1),
	(1,75,1),
	(10,38,1),
	(1,12,1),
	(10,38,1),
	(10,84,1),
	(1,75,1),
	(0,52,1),
	(0,20,1),
	(0,167,1),
	(0,147,1),
	(0,19,1),
	(0,158,1),
	(0,164,1),
	(0,157,1),
	(0,37,1),
	(0,84,1),
	(0,77,1),
	(0,183,1),
	(0,161,1),
	(0,38,1),
	(0.8,9,1),
	(0,12,1),
	(0,75,1),
	(0,16,1),
	(0,153,1),
	(0,150,1),
	(0,151,1),
	(0,145,1),
	(0,59,1),
	(0,29,1),
	(0,59,1),
	(0,19,1),
	(0,164,1),
	(0.8,29,1),
	(0,16,1),
	(0,145,1),
	(0,167,1),
	(0,9,1),
	(0,17,1),
	(0,75,1),
	(0,66,1),
	(0,147,1),
	(0,52,1),
	(0,183,1),
	(0,158,1),
	(0,161,1),
	(0,63,1),
	(0,84,1),
	(1.5,150,1),
	(0,153,1),
	(0,20,1),
	(0,77,1),
	(0,157,1),
	(0,27,1),
	(0,38,1),
	(0,12,1),
	(0,151,1),
	(0,147,1),
	(0,150,1),
	(0,16,1),
	(0,153,1),
	(0,157,1),
	(0,161,1),
	(0,84,1),
	(1.5,77,1),
	(1.5,183,1),
	(0,145,1),
	(0,37,1),
	(0,75,1),
	(0,20,1),
	(0,66,1),
	(0,19,1),
	(0,52,1),
	(0,59,1),
	(0,158,1),
	(0,63,1),
	(0,9,1),
	(0,12,1),
	(0,151,1),
	(0,38,1),
	(0,164,1),
	(0,29,1),
	(0,12,1),
	(0,16,1),
	(10,183,1),
	(0,161,1),
	(0,77,1),
	(0,29,1),
	(0,153,1),
	(0,52,1),
	(0,38,1),
	(1.5,63,1),
	(0,157,1),
	(0,84,1),
	(0,20,1),
	(0,151,1),
	(0,66,1),
	(0,75,1),
	(0,167,1),
	(0,164,1),
	(0,19,1),
	(0,9,1),
	(0,158,1),
	(0,17,1),
	(0,145,1),
	(0.8,59,1),
	(0,150,1),
	(0,37,1),
	(1,20,1),
	(0,147,1),
	(1,158,1),
	(10,100,1),
	(10,17,1),
	(0,12,1),
	(0,75,1),
	(1,153,1),
	(1,151,1),
	(10,66,1),
	(0,147,1),
	(0,153,1),
	(0,151,1),
	(10,161,1),
	(1,77,1),
	(1,75,1),
	(0,75,1),
	(0,16,1),
	(1,158,1),
	(0,153,1),
	(10,184,1),
	(0,20,1),
	(0,12,1),
	(0,75,1),
	(1,77,1),
	(1,167,1),
	(1,153,1),
	(0,20,1),
	(0,167,1),
	(0,147,1),
	(0,19,1),
	(0,66,1),
	(0,63,1),
	(0,158,1),
	(0,100,1),
	(0,84,1),
	(0,77,1),
	(0,79,1),
	(0,161,1),
	(0,27,1),
	(0,17,1),
	(0,9,1),
	(0,12,1),
	(0,75,1),
	(0,16,1),
	(0,153,1),
	(0,150,1),
	(0,151,1),
	(0,184,1),
	(0,145,1),
	(0,59,1),
	(0,29,1),
	(0,66,1),
	(0,84,1),
	(0,184,1),
	(0,79,1),
	(0,147,1),
	(0,153,1),
	(0,145,1),
	(0,151,1),
	(0,63,1),
	(0,19,1),
	(0,20,1),
	(0,17,1),
	(0,100,1),
	(0,9,1),
	(0,158,1),
	(0,161,1),
	(0,59,1),
	(0,16,1),
	(0,167,1),
	(0,27,1),
	(0,77,1),
	(0,75,1),
	(0,12,1),
	(0,150,1),
	(0,29,1),
	(0,19,1),
	(0,59,1),
	(0,184,1),
	(0,145,1),
	(0,77,1),
	(0,9,1),
	(0,161,1),
	(0,27,1),
	(0,17,1),
	(0,79,1),
	(0,151,1),
	(0,167,1),
	(0,75,1),
	(0,16,1),
	(0,63,1),
	(0,66,1),
	(0,20,1),
	(0,100,1),
	(0,158,1),
	(0,153,1),
	(0,150,1),
	(0,147,1),
	(0,29,1),
	(0,12,1),
	(0,84,1),
	(0,150,1),
	(0,184,1),
	(0,17,1),
	(0,9,1),
	(0,27,1),
	(0,145,1),
	(0,20,1),
	(0,12,1),
	(0,19,1),
	(0,158,1),
	(0,75,1),
	(0,77,1),
	(0,161,1),
	(0,167,1),
	(0,29,1),
	(0,63,1),
	(0,151,1),
	(0,147,1),
	(0,84,1),
	(0,66,1),
	(0,153,1),
	(0,100,1),
	(0,16,1),
	(0,59,1),
	(0,79,1),
	(1.2,16,2),
	(1.4,153,2),
	(1,16,2),
	(0.4,26,2),
	(1.8,150,2),
	(0.2,16,2),
	(1,16,2),
	(1.4,180,2),
	(0.1,36,2),
	(0.3,20,2),
	(0.1,13,2),
	(0.1,10,2),
	(0.3,19,2),
	(0.2,37,2),
	(0.1,30,2),
	(0.1,53,2),
	(0.1,34,2),
	(0.5,18,2),
	(0.3,27,2),
	(0.1,150,2),
	(0.2,180,2),
	(0.2,29,2),
	(0.1,143,2),
	(0.1,45,2),
	(0.5,54,2),
	(0.5,27,2),
	(1.5,8,2),
	(0.5,153,2),
	(0.5,20,2),
	(0.5,26,2),
	(0.2,37,2),
	(0.5,18,2),
	(0.2,11,2),
	(0.8,19,2),
	(1.5,30,2),
	(0.5,34,2),
	(1,13,2),
	(1,150,2),
	(0.1,147,2),
	(0.3,45,2),
	(0.8,29,2),
	(0.2,27,2),
	(0.3,143,2),
	(0.2,11,2),
	(0.5,34,2),
	(0.5,13,2),
	(0.3,58,2),
	(0.2,28,2),
	(0.5,20,2),
	(1.5,54,2),
	(0.2,29,2),
	(0.3,45,2),
	(0.2,18,2),
	(0.1,53,2),
	(0.1,26,2),
	(0.2,37,2),
	(0.6,30,2),
	(1.5,181,2),
	(0.2,153,2),
	(1,19,2),
	(0.1,58,2),
	(0.3,18,2),
	(0.1,30,2),
	(1,28,2),
	(1.2,143,2),
	(0.3,36,2),
	(1,34,2),
	(0.2,27,2),
	(0.2,29,2),
	(0.2,16,2),
	(0.8,20,2),
	(0.8,150,2),
	(0.2,54,2),
	(1.6,47,2),
	(1.8,13,2),
	(0.8,63,2),
	(1.4,27,2),
	(1.4,12,2),
	(1,63,2),
	(1.4,63,2),
	(1.6,56,2),
	(1.2,12,2),
	(1.2,36,2),
	(1.8,147,2),
	(1.2,56,2),
	(0.2,20,2),
	(0.6,20,2),
	(0.8,20,2),
	(1,20,2),
	(1,149,2),
	(1.2,149,2),
	(1.6,149,2),
	(1.8,149,2),
	(0.4,155,2),
	(1.2,155,2),
	(1.4,155,2),
	(0.2,147,2),
	(0.6,147,2),
	(0.2,19,2),
	(0.4,19,2),
	(0.4,19,2),
	(0.8,19,2),
	(0.2,63,2),
	(0.4,37,2),
	(0.2,50,2),
	(0.4,50,2),
	(0.2,18,2),
	(0.2,152,2),
	(0.2,152,2),
	(0.2,152,2),
	(0.6,31,2),
	(0.8,31,2),
	(1,31,2),
	(1.8,31,2),
	(0.2,38,2),
	(0.6,38,2),
	(0.2,57,2),
	(0.4,57,2),
	(0.4,57,2),
	(0.2,61,2),
	(0.4,61,2),
	(0.2,60,2),
	(0.4,60,2),
	(0.4,60,2),
	(0.2,68,2),
	(0.2,68,2),
	(0.4,68,2),
	(0.2,27,2),
	(0.2,17,2),
	(0.2,17,2),
	(0.2,17,2),
	(1,148,2),
	(1.2,148,2),
	(1.2,148,2),
	(0.2,12,2),
	(0.2,12,2),
	(0.4,16,2),
	(0.6,16,2),
	(0.6,16,2),
	(0.2,153,2),
	(0.2,153,2),
	(0.4,153,2),
	(0.6,153,2),
	(0.2,150,2),
	(0.6,150,2),
	(0.8,150,2),
	(0.4,13,2),
	(0.4,13,2),
	(0.6,13,2),
	(0.4,29,2),
	(0.4,29,2),
	(0.4,29,2),
	(0.2,45,2),
	(0.8,45,2),
	(0.2,59,2),
	(0.2,59,2),
	(0.2,59,2),
	(0.2,145,2),
	(0.4,145,2),
	(1.5,13,2),
	(0.4,144,2),
	(1,19,2),
	(1,18,2),
	(1.5,152,2),
	(0.2,12,2),
	(0.4,75,2),
	(1,153,2),
	(0.5,150,2),
	(0.5,145,2),
	(0.4,159,2),
	(1,166,2),
	(0.5,158,2),
	(0.2,151,2),
	(0.8,67,2),
	(1,159,2),
	(0.8,18,2),
	(0.5,153,2),
	(0.5,18,2),
	(1.5,144,2),
	(1,159,2),
	(0.5,150,2),
	(0.5,75,2),
	(1,158,2),
	(1.5,18,2),
	(1.5,155,2),
	(0.2,75,2),
	(0.3,153,2),
	(1,12,2),
	(0.1,14,2),
	(0.2,20,2),
	(0.1,13,2),
	(0,147,2),
	(0.8,19,2),
	(0,63,2),
	(0,158,2),
	(0,37,2),
	(0.1,55,2),
	(0,77,2),
	(0.2,178,2),
	(0.1,161,2),
	(0.5,27,2),
	(0,17,2),
	(0,70,2),
	(0,12,2),
	(0.8,75,2),
	(0.2,16,2),
	(0,153,2),
	(0.5,150,2),
	(0,151,2),
	(0.2,145,2),
	(0.1,59,2),
	(0.2,182,2),
	(0.1,81,2),
	(0.2,29,2),
	(0.1,156,2),
	(0.1,156,2),
	(0,55,2),
	(0.2,150,2),
	(0,158,2),
	(0,77,2),
	(0.3,29,2),
	(0.2,16,2),
	(0.1,75,2),
	(0,151,2),
	(0,153,2),
	(0,66,2),
	(0,63,2),
	(0.2,59,2),
	(0.8,145,2),
	(0,20,2),
	(0,19,2),
	(0,37,2),
	(0,84,2),
	(0,38,2),
	(0.2,178,2),
	(0.2,147,2),
	(0,81,2),
	(0,161,2),
	(0.2,17,2),
	(0.5,12,2),
	(0.4,4,2),
	(0.2,13,2),
	(0,14,2),
	(0,27,2),
	(0,70,2),
	(0,161,2),
	(0,37,2),
	(0,158,2),
	(0.1,81,2),
	(0.2,17,2),
	(0.4,63,2),
	(0.5,4,2),
	(0,84,2),
	(0,75,2),
	(0,55,2),
	(0.2,16,2),
	(0,12,2),
	(0.5,27,2),
	(0,147,2),
	(0,13,2),
	(0,153,2),
	(0,77,2),
	(0,182,2),
	(0,145,2),
	(0,19,2),
	(0,20,2),
	(0,29,2),
	(0.4,150,2),
	(0.2,151,2),
	(0,38,2),
	(0.1,70,2),
	(0,156,2),
	(0,59,2),
	(0,178,2),
	(0,182,2),
	(0,38,2),
	(0,16,2),
	(0,63,2),
	(0,17,2),
	(0.8,4,2),
	(0,12,2),
	(0,37,2),
	(0.2,75,2),
	(0.5,161,2),
	(0.1,27,2),
	(0,70,2),
	(0,66,2),
	(0,59,2),
	(0,77,2),
	(0.2,151,2),
	(0,19,2),
	(0.2,145,2),
	(0.1,84,2),
	(0.1,55,2),
	(0,153,2),
	(0,29,2),
	(0,150,2),
	(0,178,2),
	(0.2,158,2),
	(0,81,2),
	(0.1,13,2),
	(0,147,2),
	(0,20,2),
	(0.1,156,2),
	(0,147,2),
	(0,158,2),
	(0,17,2),
	(0,9,2),
	(0,75,2),
	(0,16,2),
	(0,151,2),
	(0,145,2),
	(0,59,2),
	(0,29,2),
	(1,145,2),
	(0,75,2),
	(0,183,2),
	(0,158,2),
	(0,161,2),
	(0,12,2),
	(0,153,2),
	(0,161,2),
	(0,77,2),
	(1,75,2),
	(0,38,2),
	(0,12,2),
	(1,38,2),
	(0,84,2),
	(0,75,2),
	(0,52,2),
	(0,20,2),
	(0,167,2),
	(0,147,2),
	(0,19,2),
	(0,158,2),
	(1,164,2),
	(1,157,2),
	(0,37,2),
	(0,84,2),
	(0,77,2),
	(0,183,2),
	(0,161,2),
	(0,38,2),
	(0,9,2),
	(0,12,2),
	(0,75,2),
	(0,16,2),
	(0,153,2),
	(0.8,150,2),
	(0,151,2),
	(0,145,2),
	(0,59,2),
	(0,29,2),
	(0,59,2),
	(0,19,2),
	(0,164,2),
	(0.5,29,2),
	(0,16,2),
	(0,145,2),
	(0,167,2),
	(0,9,2),
	(1.5,17,2),
	(0,75,2),
	(0.8,66,2),
	(1,147,2),
	(0,52,2),
	(0,183,2),
	(0,158,2),
	(0,161,2),
	(0,63,2),
	(0,84,2),
	(0,150,2),
	(0,153,2),
	(0,20,2),
	(0,77,2),
	(0,157,2),
	(0,27,2),
	(0,38,2),
	(0,12,2),
	(0,151,2),
	(1.5,147,2),
	(0,150,2),
	(0,16,2),
	(0,153,2),
	(0,157,2),
	(0,161,2),
	(0,84,2),
	(0,77,2),
	(0,183,2),
	(0,145,2),
	(0,37,2),
	(0,75,2),
	(0,20,2),
	(0,66,2),
	(0,19,2),
	(0,52,2),
	(0,59,2),
	(0,158,2),
	(0,63,2),
	(0,9,2),
	(0,12,2),
	(0,151,2),
	(0,38,2),
	(0,164,2),
	(0,29,2),
	(0,12,2),
	(0,16,2),
	(0,183,2),
	(0.5,161,2),
	(0,77,2),
	(0,29,2),
	(0,153,2),
	(0,52,2),
	(0,38,2),
	(0,63,2),
	(0,157,2),
	(0,84,2),
	(0,20,2),
	(0,151,2),
	(0,66,2),
	(0,75,2),
	(0,167,2),
	(0,164,2),
	(0,19,2),
	(0,9,2),
	(0,158,2),
	(0,17,2),
	(0,145,2),
	(1,59,2),
	(0,150,2),
	(0,37,2),
	(0,20,2),
	(0,147,2),
	(0,158,2),
	(1,100,2),
	(1,17,2),
	(1,12,2),
	(0,75,2),
	(1,153,2),
	(0,151,2),
	(1,66,2),
	(1,147,2),
	(0,153,2),
	(0,151,2),
	(0,161,2),
	(0,77,2),
	(0,75,2),
	(0,75,2),
	(0,16,2),
	(0,158,2),
	(0,153,2),
	(1,184,2),
	(0,20,2),
	(0,12,2),
	(0,75,2),
	(0,77,2),
	(0,167,2),
	(0,153,2),
	(0,20,2),
	(0,167,2),
	(0,147,2),
	(0,19,2),
	(0,66,2),
	(0,63,2),
	(0,158,2),
	(0,100,2),
	(0,84,2),
	(0,77,2),
	(0,79,2),
	(0,161,2),
	(0,27,2),
	(0,17,2),
	(0,9,2),
	(0,12,2),
	(0,75,2),
	(0,16,2),
	(0,153,2),
	(0,150,2),
	(0,151,2),
	(0,184,2),
	(0,145,2),
	(0,59,2),
	(0,29,2),
	(0,66,2),
	(0,84,2),
	(0,184,2),
	(0,79,2),
	(0,147,2),
	(0,153,2),
	(0,145,2),
	(0,151,2),
	(0,63,2),
	(0,19,2),
	(0,20,2),
	(0,17,2),
	(0,100,2),
	(0,9,2),
	(0,158,2),
	(0,161,2),
	(0,59,2),
	(0,16,2),
	(0,167,2),
	(0,27,2),
	(0,77,2),
	(0,75,2),
	(0,12,2),
	(0,150,2),
	(0,29,2),
	(0,19,2),
	(0,59,2),
	(0,184,2),
	(0,145,2),
	(0,77,2),
	(0,9,2),
	(0,161,2),
	(0,27,2),
	(0,17,2),
	(0,79,2),
	(0,151,2),
	(0,167,2),
	(0,75,2),
	(0,16,2),
	(0,63,2),
	(0,66,2),
	(0,20,2),
	(0,100,2),
	(0,158,2),
	(0,153,2),
	(0,150,2),
	(0,147,2),
	(0,29,2),
	(0,12,2),
	(0,84,2),
	(0,150,2),
	(0,184,2),
	(0,17,2),
	(0,9,2),
	(0,27,2),
	(0,145,2),
	(0,20,2),
	(0,12,2),
	(0,19,2),
	(0,158,2),
	(0,75,2),
	(0,77,2),
	(0,161,2),
	(0,167,2),
	(0,29,2),
	(0,63,2),
	(0,151,2),
	(0,147,2),
	(0,84,2),
	(0,66,2),
	(0,153,2),
	(0,100,2),
	(0,16,2),
	(0,59,2),
	(0,79,2);