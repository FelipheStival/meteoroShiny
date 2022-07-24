/* Corrigindo nome local Fazenda Pinhalzinho */
update 
	locais
set
	nome = 'Fazenda Pinhalzinho' 
where 
	REPLACE(NOME, ' ', '') like '%FazendaPinhalzinho%';
	
/* Corrigindo ID tabela ensaios */
update
	ENSAIOS
set 
	ID_LOCAL = 12
where
	ID_LOCAL in (10,12);
	
/* Deletando local repetido */
delete from locais where id = 10;

	

