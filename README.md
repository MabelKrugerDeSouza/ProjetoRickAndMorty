# Aplicativo Rick And Morty

Aplicativo desenvolvido para o desafio do projeto Maria Vai Com As Dev - Serasa 2021, que tem como objetivo criar um aplicativo IOS e utilizar os conhecimentos adquiridos durante o curso de Swift.


<h2><b>REQUISITOS</b></h2>

1. - Fazer uma lista com scroll
2. - Persistencia de dados com lista de favoritos
3. - Chamada de API externa
4. - Mostrar pelo menos imagem externa
5. - Ter pelo menos um teste unitário 

<h2><b>API Utilizada</b></h2>

https://rickandmortyapi.com/api/character

<h2><b>TELAS</b></h2>

O projeto é composto de três telas principais: Listagem de personagens, detalhes do personagem selecionado e lista de personagens favoritos.

<h4>Lista de Personagens</h4>
 - Busca as informacoes da API e mostra ao usuario com nome, foto e outros detalhes. Essa tela possui um recurso de paginação que faz novas consultas a API toda vez que o usuario rola a lista ate o final.

<img width="174" alt="Captura de Tela 2021-11-02 às 15 31 59" src="https://user-images.githubusercontent.com/60518814/139924271-cdc65484-1ffc-4153-9d83-0545c55b36dc.png">

<h4>Detalhes do Personagem</h4>
- Tela que vai mostrar as informações do personagem selecionado. Reaproveitei a mesma tela de detalhes tanto para consultas feitas pela lista principal quanto pela lista de favoritos.
Nessa tela o usuário tem a opção de marcar um personagem como favorito. Essa opção so aparece caso o personagem ainda não esteja gravado como favorito no APP.

<img width="172" alt="Captura de Tela 2021-11-02 às 15 33 39" src="https://user-images.githubusercontent.com/60518814/139924454-4d785bc1-aa43-49be-9f09-f73a16cf544d.png">

<h4>Lista de Personagens Favoritos</h4>
- Essa tela foi criada reaproveitando a celula da listagem principal, porém mostra apenas os personagens que o usuário salvou como favorito

<img width="169" alt="Captura de Tela 2021-11-02 às 15 34 34" src="https://user-images.githubusercontent.com/60518814/139924556-7c295cf1-dc2c-4eef-8fc2-a74e4e9c031a.png">

<h2><b>PROJETO</b></h2>

O projeto foi desenvolvido com a arquitetura MVC e o codigo foi com code view (telas criadas na mao), os pacotes de independencia utilizados foram
KingFisher e SnapKit, já para ter a persistencia de dados foi utilizado o coredata







