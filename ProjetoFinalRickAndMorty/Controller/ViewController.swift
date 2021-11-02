//
//  ViewController.swift
//  ProjetoFinalRickAndMorty
//
//  Created by Mabel Kruger de Souza on 26/10/21.
//

import UIKit
import Kingfisher
import CoreData

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var arrayPersonagens: [Personagem] = []
    var api: API?
    let reuseIdentifier  = "Celula"
    var currentPage      = 0
    let searchController = UISearchController(searchResultsController: nil)
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    lazy var tabelaPersonagem: UITableView = {
        var tabela = UITableView()
        
        tabela.frame        = self.view.bounds
        tabela.dataSource   = self
        tabela.delegate     = self
        
        let nib = UINib(nibName: "CelulaTableViewCell", bundle: nil)
        tabela.register(nib, forCellReuseIdentifier: reuseIdentifier)
    
        return tabela
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Rick And Morty"
        self.view.addSubview(tabelaPersonagem)
        self.carregaPersonagens()
        self.createRightBarButton()
    }
    
    //MARK: Funcoes
    func createRightBarButton() {
        let heartImage = UIImage(systemName: "heart.fill")
        
        let rightButton = UIBarButtonItem(image: heartImage, style: UIBarButtonItem.Style.plain, target: self, action: #selector(getFavoritos))
        rightButton.tintColor = .red
        
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    func getFavoritesFromDatabase() -> [Personagens]{
        var retorno: [Personagens] = []
            do {
                retorno = try DataBaseController.persistentContainer.viewContext.fetch(Personagens.fetchRequest())
            } catch {
                print("Nao consegui trazer as informaçoes do banco de dados")
            }
          return retorno
        }

    
    @objc func getFavoritos(){
        let vc = FavoritosVC()
        vc.personagensFavoritos = self.getFavoritesFromDatabase()
        self.show(vc, sender: nil)
        
        if vc.personagensFavoritos.count <= 0 {
            self.displayAlert(
                with: "Lista Favoritos",
                message: "Lista de favoritos está vazia.")
        }
    }
    
    convenience init(api: API){
        self.init()
        self.api = api
    }

    func createSpinnerFooter()-> UIView{
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        
        return footerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let position = scrollView.contentOffset.y
        
        guard let mApi = self.api else { return }
        if position > (tabelaPersonagem.contentSize.height-100-scrollView.frame.size.height){
            guard !mApi.isPaginating else {
                return
            }
            self.tabelaPersonagem.tableFooterView = createSpinnerFooter()
            
            self.carregaPersonagens()
           
        }
    }
    
    func carregaPersonagens(){
        self.currentPage += 1
        guard let mApi = self.api else { return }
        mApi.getPersonagens(urlString: mApi.setCharacter(), page: currentPage, pagination: true, method: .GET) { personagens in
            self.arrayPersonagens.append(contentsOf: personagens)
            DispatchQueue.main.async {
                self.tabelaPersonagem.tableFooterView = nil
                self.tabelaPersonagem.reloadData()
            }
        } errorR: { errorR in
            switch errorR{
            case .emptyArray:
                self.mostraAlertaDeErroQuandoAlgoNaAPIDaErrado(mensagem: "Deu error.")
            case .notFound:
                self.mostraAlertaDeErroQuandoAlgoNaAPIDaErrado(mensagem: "Não encontrado.")
            case .emptyResponse:
                self.mostraAlertaDeErroQuandoAlgoNaAPIDaErrado(mensagem: "Sem internet.")
            default:
                break;
            }
        }
    }
    
    func mostraAlertaDeErroQuandoAlgoNaAPIDaErrado(mensagem: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Atenção", message: mensagem, preferredStyle: .actionSheet)
            
            guard let mApi = self.api else {return}
            let botaoRefazChamada = UIAlertAction(title: "Tentar novamente.", style: .default) { _ in
                mApi
            }
            let botaoLevaParaFavoritos = UIAlertAction(title: "Ir para Favoritos.", style: .default) { _ in
                self.getFavoritos()
            }
            let botaoEntendi = UIAlertAction(title: "Cancelar.", style: .cancel, handler: nil)
            
            alert.addAction(botaoRefazChamada)
            alert.addAction(botaoLevaParaFavoritos)
            alert.addAction(botaoEntendi)
            
            self.present(alert, animated: true, completion: nil)
        }

    }
    
}

//MARK: Extensions 
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CelulaTableViewCell
        cell.accessoryType     = .disclosureIndicator
        cell.lblNome.text      = self.arrayPersonagens[indexPath.row].name
        cell.lblStatus.text    = self.arrayPersonagens[indexPath.row].status
        cell.lblSpecies.text   = self.arrayPersonagens[indexPath.row].species


        if let image = self.arrayPersonagens[indexPath.row].image{
            let url = URL(string: image)
            cell.img.kf.setImage(with: url,
                                  options: [
                                    .transition(ImageTransition.fade(2.0))
                                   ],
                                   progressBlock: nil,
                                   completionHandler: {resultado in
                                     switch resultado{
                                        case .success(let image) :
                                        print(image.cacheType)
                                        case.failure(let error):
                                        print(error.localizedDescription)
                                        }
                                })
        }
       return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayPersonagens.count
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let detail = DetailVC()
        detail.personagemTocado = self.arrayPersonagens[indexPath.row]
        self.show(detail, sender: nil)
    }
}
