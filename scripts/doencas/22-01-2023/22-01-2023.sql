/* removendo coluna id_cultura */
ALTER TABLE ensaios
DROP COLUMN categoria_id;

/* Apagando tabela categoria */
DROP TABLE categoria;