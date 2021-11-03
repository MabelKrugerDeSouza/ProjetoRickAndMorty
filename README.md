# Aplicativo Rick And Morty

Aplicativo desenvolvido para o desafio do projeto Maria Vai Com As Dev - Serasa 2021, que tem como objetivo criar um aplicativo IOS e utilizar os conhecimentos adquiridos durante o curso de Swift.


<h2><b>✅ REQUISITOS</b></h2>

1. - Fazer uma lista com scroll
2. - Persistencia de dados com lista de favoritos
3. - Chamada de API externa
4. - Mostrar pelo menos imagem externa
5. - Ter pelo menos um teste unitário 

<h2><b>💻 API Utilizada</b></h2>

https://rickandmortyapi.com/api/character

<h2><b>📱 Telas</b></h2>

O projeto é composto de três telas principais: Listagem de personagens, detalhes do personagem selecionado e lista de personagens favoritos.

<h4>Lista de Personagens</h4>
 - Busca as informacoes da API e mostra ao usuario com nome, foto e outros detalhes. Essa tela possui um recurso de paginação que faz novas consultas a API toda vez que o usuario rola a lista ate o final.

<img width="167" alt="Captura de Tela 2021-11-02 às 16 29 30" src="https://user-images.githubusercontent.com/60518814/139940160-f5f76248-da3b-432c-b180-2e400c782aeb.png">

<h4>Detalhes do Personagem</h4>
- Tela que vai mostrar as informações do personagem selecionado. Reaproveitei a mesma tela de detalhes tanto para consultas feitas pela lista principal quanto pela lista de favoritos.
Nessa tela o usuário tem a opção de marcar um personagem como favorito. Essa opção so aparece caso o personagem ainda não esteja gravado como favorito no APP.

<img width="172" alt="Captura de Tela 2021-11-02 às 15 33 39" src="https://user-images.githubusercontent.com/60518814/139924454-4d785bc1-aa43-49be-9f09-f73a16cf544d.png">

<h4>Lista de Personagens Favoritos</h4>
- Essa tela foi criada reaproveitando a celula da listagem principal, porém mostra apenas os personagens que o usuário salvou como favorito

<img width="171" alt="Captura de Tela 2021-11-02 às 16 32 55" src="https://user-images.githubusercontent.com/60518814/139940226-295c5d97-9872-41f7-a058-aa5373e800f4.png">

<h2><b>📝 PROJETO</b></h2>

1. Arquitetura MVC
2. Persistencia em CoreData
3. Teste Unitário
4. SnapKit 5.0.1
5. KingFisher 7.1.1
6. Versão disponivel IOs 15.0
7. API externa
8. UITableView












