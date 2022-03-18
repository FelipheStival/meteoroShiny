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

/* Removendo colunas tabela ensaios */
ALTER TABLE ensaios
DROP COLUMN IF EXISTS numero_linhas_parcela_util,
DROP COLUMN IF EXISTS comprimento_linhas_parcela_util,
DROP COLUMN IF EXISTS numero_de_plantas_na_parcela_util_vegetativo_linha_dois,
DROP COLUMN	IF EXISTS numero_medio_plantas_parcela_util_vegetativo,
DROP COLUMN	IF EXISTS numero_de_plantas_na_parcela_util_reprodutivo_linha_um,
DROP COLUMN	IF EXISTS numero_de_plantas_na_parcela_util_reprodutivo_linha_dois,
DROP COLUMN	IF EXISTS numero_medio_plantas_parcela_util_reprodutivo,
DROP COLUMN	IF EXISTS plantasm2fin,
DROP COLUMN	IF EXISTS parcela,
DROP COLUMN	IF EXISTS populacao_planejada,
DROP COLUMN	IF EXISTS populacao_medida,
DROP COLUMN	IF EXISTS alteracao_genotipo,
DROP COLUMN	IF EXISTS numero_linhas_parcelas,
DROP COLUMN	IF EXISTS comprimento_linhas_parcelas,
DROP COLUMN	IF EXISTS espacamento_linhas_parcela_util,
DROP COLUMN	IF EXISTS area_colhida,
DROP COLUMN	IF EXISTS gramas_na_parcela_util,
DROP COLUMN	IF EXISTS peso_250_graos,
DROP COLUMN	IF EXISTS massa_cem_sementes,
DROP COLUMN	IF EXISTS replantio,
DROP COLUMN	IF EXISTS cor_do_grao,
DROP COLUMN	IF EXISTS numero_de_plantas_sclerotinia,
DROP COLUMN	IF EXISTS antraquinose_severidade,
DROP COLUMN	IF EXISTS mancha_angular_severidade,
DROP COLUMN	IF EXISTS mancha_alternaria_severidade,
DROP COLUMN	IF EXISTS ferrugem_folha_severidade,
DROP COLUMN	IF EXISTS oidio_severidade,
DROP COLUMN	IF EXISTS oidio_severidade,
DROP COLUMN	IF EXISTS xantamonas_severidade,
DROP COLUMN	IF EXISTS fusarium_oxysporum_severidade,
DROP COLUMN	IF EXISTS fusarium_solani_severidade,
DROP COLUMN	IF EXISTS curto_bacterium_severidade,
DROP COLUMN	IF EXISTS mosaico_dourado_severidade,
DROP COLUMN	IF EXISTS mosaico_comum_severidade,
DROP COLUMN	IF EXISTS rhizoctonia_solani_severidade,
DROP COLUMN	IF EXISTS fitotoxicidade_hebicida_inseticida_oleo_severidade,
DROP COLUMN	IF EXISTS bronzeado_causado_por_acaro,
DROP COLUMN	IF EXISTS estatura_planta_um,
DROP COLUMN	IF EXISTS estatura_planta_dois,
DROP COLUMN	IF EXISTS estatura_planta_tres,
DROP COLUMN	IF EXISTS acamamento,
DROP COLUMN	IF EXISTS planta_adaptada,
DROP COLUMN	IF EXISTS dano_geada_severidade,
DROP COLUMN	IF EXISTS largata_elasmo,
DROP COLUMN	IF EXISTS dano_spodopte,
DROP COLUMN	IF EXISTS granizo_sem_debulha,
DROP COLUMN	IF EXISTS data_verificacao_granizo_sem_debulha,
DROP COLUMN	IF EXISTS granizo_com_debulha,
DROP COLUMN	IF EXISTS estadio_granizo_sem_debulha,
DROP COLUMN	IF EXISTS data_verificacao_granizo_com_debulha,
DROP COLUMN	IF EXISTS estadio_granizo_com_debulha,
DROP COLUMN	IF EXISTS folhas_rendilhadas_idem_sintoma_psudomonas,
DROP COLUMN	IF EXISTS haste_verde_severidade,
DROP COLUMN	IF EXISTS retencao_foliar_severidade,
DROP COLUMN	IF EXISTS lebre_severidade,
DROP COLUMN	IF EXISTS antracnose_colheita,
DROP COLUMN	IF EXISTS seca_pos_floracao,
DROP COLUMN	IF EXISTS tecnica,
DROP COLUMN	IF EXISTS tratamento,
DROP COLUMN	IF EXISTS umidade,
DROP COLUMN	IF EXISTS data_debaste,
DROP COLUMN	IF EXISTS data_entrada_amostra,
DROP COLUMN	IF EXISTS data_processamento_amostra,
DROP COLUMN	IF EXISTS data_leitura_cor_do_grao,
DROP COLUMN	IF EXISTS flor_das,
DROP COLUMN	IF EXISTS flor_dae,
DROP COLUMN	IF EXISTS ciclo_das,
DROP COLUMN	IF EXISTS ciclo_dae,
DROP COLUMN	IF EXISTS validacao;

