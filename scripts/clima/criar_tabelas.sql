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
    nome character(2) NOT NULL,
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
    CONSTRAINT "FK_cidades_estados" FOREIGN KEY (id_estado)
        REFERENCES public.estados (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

/*------------------------------------
 Tabela clima
*/------------------------------------
CREATE TABLE public.clima
(
    id bigserial NOT NULL,
    data date NOT NULL,
    "Tmax" numeric NOT NULL,
    "Tmin" numeric NOT NULL,
    "Tmed" numeric NOT NULL,
    "Urmed" numeric NOT NULL,
    "Vento" numeric NOT NULL,
    "Vtmax" numeric NOT NULL,
    "Rad" numeric NOT NULL,
    "Precip" numeric NOT NULL,
    "Tsolo" numeric NOT NULL,
    id_cidade bigint NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT "FK_clima_cidades" FOREIGN KEY (id_cidade)
        REFERENCES public.cidades (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);