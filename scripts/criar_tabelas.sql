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
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
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
    data date,
    Tmax numeric,
    Tmin numeric,
    Tmed numeric,
    Urmed numeric,
    Vento numeric,
    Vtmax numeric,
    Rad numeric,
    Precip numeric,
    Tsolo numeric,
    id_cidade bigint,
    PRIMARY KEY (id),
    CONSTRAINT "FK_clima_cidades" FOREIGN KEY (id_cidade)
        REFERENCES public.cidades (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);