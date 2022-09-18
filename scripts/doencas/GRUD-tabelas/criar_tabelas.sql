/*------------------------------------------------
* Script para criar tabelas
* Author: Feliphe Stival Valadares Guiliani
* Versao: 0.1
*/------------------------------------------------

/*------------------------------------
 Tabela estados
*/------------------------------------
CREATE TABLE public.estados
(
    id bigserial NOT NULL,
    nome text NOT NULL,
    PRIMARY KEY (id)
);

/*------------------------------------
 Tabela cidades
*/------------------------------------
CREATE TABLE public.cidades
(
    id bigserial NOT NULL,
    nome text NOT NULL,
    id_estado bigint NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT "FK_CIDADES_ESTADOS" FOREIGN KEY (id_estado)
        REFERENCES public.estados (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

/*------------------------------------
 Tabela locais
*/------------------------------------
CREATE TABLE public.locais
(
    id bigserial NOT NULL,
    nome text NOT NULL,
    id_cidade bigint NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT "FK_LOCAIS_CIDADES" FOREIGN KEY (id_cidade)
        REFERENCES public.cidades (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

/*------------------------------------
 Tabela tipo de graos
*/------------------------------------
CREATE TABLE public.tipos_de_graos
(
    id bigserial NOT NULL,
    sigla text NOT NULL,
    PRIMARY KEY (id)
);

/*------------------------------------
 Tabela cultura
*/------------------------------------
CREATE TABLE public.cultura
(
    id bigserial NOT NULL,
    nome text NOT NULL,
    PRIMARY KEY (id)
);


/*------------------------------------
 Tabela genotipos
*/------------------------------------
CREATE TABLE public.genotipos
(
    id bigserial NOT NULL,
    nome text NOT NULL,
    id_tipo_grao bigserial NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT "FK_GENOTIPO_TIPO_GRAO" FOREIGN KEY (id_tipo_grao)
        REFERENCES public.tipos_de_graos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

/*------------------------------------
 Tabela ensaios
*/------------------------------------
CREATE TABLE public.ensaios(
   id                                                       bigserial NOT NULL
  ,ID_ensaio                                                TEXT NOT NULL
  ,Parcela                                                  NUMERIC  
  ,Safra                                                    TEXT 
  ,Irrigacao                                                BOOLEAN 
  ,Fungicida                                                BOOLEAN 
  ,Populacao_planejada                                      NUMERIC 
  ,Populacao_medida                                         NUMERIC 
  ,Tratamento                                               NUMERIC  
  ,Repeticao                                                NUMERIC  
  ,Alteracao_genotipo                                       TEXT 
  ,numero_linhas_parcelas                                   NUMERIC  
  ,comprimento_linhas_parcelas                              NUMERIC 
  ,numero_linhas_parcela_util                               NUMERIC  
  ,comprimento_linhas_parcela_util                          NUMERIC 
  ,espacamento_linhas_parcela_util                          NUMERIC 
  ,area_colhida                                             NUMERIC 
  ,gramas_na_parcela_util                                   NUMERIC 
  ,umidade                                                  NUMERIC 
  ,produtividade                                            NUMERIC 
  ,peso_250_graos                                           NUMERIC 
  ,massa_cem_sementes                                       NUMERIC 
  ,Numero_de_plantas_na_parcela_util_vegetativo_linha_um    NUMERIC 
  ,Numero_de_plantas_na_parcela_util_vegetativo_linha_dois  NUMERIC 
  ,Numero_medio_plantas_parcela_util_vegetativo             NUMERIC 
  ,Numero_de_plantas_na_parcela_util_reprodutivo_linha_um   NUMERIC 
  ,Numero_de_plantas_na_parcela_util_reprodutivo_linha_dois NUMERIC 
  ,Numero_medio_plantas_parcela_util_reprodutivo            NUMERIC 
  ,PlantasM2fin                                             NUMERIC 
  ,data_semeadura                                           DATE  
  ,replantio                                                BOOLEAN 
  ,data_emergencia                                          DATE 
  ,data_debaste                                             DATE 
  ,data_inicio_floracao                                     DATE 
  ,data_inicio_ponto_colheita                               DATE 
  ,data_inicio_colheita                                     DATE 
  ,data_entrada_amostra                                     DATE 
  ,data_processamento_amostra                               DATE 
  ,data_leitura_cor_do_grao                                 DATE 
  ,cor_do_grao                                              NUMERIC 
  ,Numero_de_plantas_sclerotinia                            NUMERIC 
  ,Antraquinose_severidade                                  NUMERIC 
  ,Mancha_angular_severidade                                NUMERIC 
  ,Mancha_alternaria_severidade                             NUMERIC 
  ,Ferrugem_folha_severidade                                NUMERIC 
  ,Oidio_severidade                                         NUMERIC 
  ,Xantamonas_severidade                                    NUMERIC 
  ,Fusarium_oxysporum_severidade                            NUMERIC 
  ,Fusarium_solani_severidade                               NUMERIC 
  ,Curto_bacterium_severidade                               NUMERIC 
  ,Mosaico_dourado_severidade                               NUMERIC 
  ,Mosaico_comum_severidade                                 NUMERIC 
  ,Rhizoctonia_solani_severidade                            NUMERIC 
  ,Fitotoxicidade_hebicida_inseticida_oleo_severidade       NUMERIC 
  ,Bronzeado_causado_por_acaro                              NUMERIC 
  ,Estatura_planta_um                                       NUMERIC 
  ,Estatura_planta_dois                                     NUMERIC 
  ,Estatura_planta_tres                                     NUMERIC 
  ,Acamamento                                               NUMERIC 
  ,Planta_adaptada                                          NUMERIC 
  ,Dano_geada_severidade                                    NUMERIC 
  ,Largata_elasmo                                           NUMERIC
  ,Dano_spodopte                                            NUMERIC 
  ,Granizo_sem_debulha                                      NUMERIC 
  ,Data_verificacao_Granizo_sem_debulha                     DATE 
  ,Granizo_com_debulha                                      NUMERIC 
  ,Estadio_granizo_sem_debulha                              TEXT 
  ,Data_verificacao_Granizo_com_debulha                     NUMERIC 
  ,Estadio_granizo_com_debulha                              NUMERIC 
  ,Folhas_rendilhadas_idem_sintoma_Psudomonas               NUMERIC 
  ,Haste_verde_severidade                                   NUMERIC 
  ,Retencao_foliar_severidade                               NUMERIC 
  ,Lebre_severidade                                         NUMERIC 
  ,Antracnose_colheita                                      NUMERIC 
  ,Seca_pos_floracao                                        NUMERIC 
  ,tecnica                                                  NUMERIC 
  ,validacao                                                TEXT 
  ,epoca                                                    NUMERIC
  ,FLOR_DAS                                                 NUMERIC
  ,FLOR_DAE                                                 NUMERIC
  ,CICLO_DAS                                                NUMERIC
  ,CICLO_DAE                                                NUMERIC
  ,id_local                                                 BIGINT  NOT NULL
  ,id_genotipo                                              BIGINT  NOT NULL
  ,id_cultura                                               BIGINT  NOT NULL
  ,CONSTRAINT "FK_ENSAIOS_LOCAL" FOREIGN KEY (id_local)
        REFERENCES public.locais (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
  ,CONSTRAINT "FK_ENSAIOS_GENOTIPO" FOREIGN KEY (id_genotipo)
        REFERENCES public.genotipos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
  ,CONSTRAINT "FK_ENSAIOS_CULTURA" FOREIGN KEY (id_cultura)
        REFERENCES public.cultura (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
		
);
