# ProjetoRickAndMorty

Aplicativo desenvolvido para o desafio do projeto Maria Vai Com As Dev - Serasa 2021, que tem como objetivo criar um aplicativo IOS e utilizar os conhecimentos adquiridos durante o curso de Swift.


#REQUISITOS

1 - Fazer uma lista com scroll
2 - Persistencia de dados com lista de favoritos
3 - Chamada de API externa
4 - Mostrar pelo menos imagem externa
5 - Ter pelo menos um teste unitário 

API Utilizada
https://rickandmortyapi.com/api/character

TELAS

O projeto é composto de três telas principais: Listagem de personagens, detalhes do personagem selecionado e lista de personagens favoritos.

Lista de Personagens
Busca as informacoes da API e mostra ao usuario com nome, foto e outros detalhes. Essa tela possui um recurso de paginacao que faz novas consultas a API toda vez que o usuario rola a lista ate o final.
Tambem e possivel fazer uma pesquisa nos personagens ja carregados em tela, usando o campo de pesquisa.

 mostrar imagem da pesquisa

Detalhes do Personagem
Tela que vai mostrar as informacoes do personagem selecionado. Reaproveitei a mesma tela de detalhes tanto para consultas feitas pela lista principal quanto pela lista de favoritos.
Nessa tela o usuario tem a opcao de marcar um personagem como favorito. Essa opcao so aparece caso o personagem ainda nao esteja gravado como favorito no APP.

mostrar imagem da tela de detalhe

Lista de Persoonagens Favoritos
Essa tela foi criada reaproveitando a celula da listagem principal, porem mostra apenas os personagens que o usuario salvou como favorito

# PROJETO

O projeto foi desenvolvido com a arquitetura MVC e o codigo foi com code view (telas criadas na mao), os pagotes de independencia utilizados foram
KingFisher e SnapKit, já para ter a persistencia de dados foi utilizado o coredata




