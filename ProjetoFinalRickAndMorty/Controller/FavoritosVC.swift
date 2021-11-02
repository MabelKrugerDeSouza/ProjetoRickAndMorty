//
//  Favoritos.swift
//  ProjetoFinalRickAndMorty
//
//  Created by Mabel Kruger de Souza on 28/10/21.
//

import UIKit
import Kingfisher
import CoreData

class FavoritosVC: UIViewController{
    var personagensFavoritos: [Personagens] = []
    var reuseIdentifier = "Celular"
    
    lazy var favoritosPersonagens: UITableView = {
        var favoritosPersonagens              = UITableView()
        favoritosPersonagens.frame            = self.view.bounds
        favoritosPersonagens.dataSource       = self
        favoritosPersonagens.delegate         = self
        favoritosPersonagens.separatorStyle   = .none

        let nib = UINib(nibName: "CelulaTableViewCell", bundle: nil)
        favoritosPersonagens.register(nib, forCellReuseIdentifier: reuseIdentifier)
        
      
        return favoritosPersonagens
    }()
    override func viewDidLoad() {
            super.viewDidLoad()
        
        favoritosPersonagens.frame = self.view.bounds
        
        self.title = "Favoritos"
        self.view.addSubview(favoritosPersonagens)
        print(personagensFavoritos)
        if personagensFavoritos.count <= 0 {
            self.navigationController?.navigationBar.tintColor = .clear
            self.mostraAlertaFavoritos(mensagem: "Lista de favoritos está vazia")
        }
        self.favoritosPersonagens.backgroundColor = UIColor(red: 216/255.0, green: 233/255.0, blue: 168.0/255.0, alpha: 1.0)
    }
    
    func mostraAlertaFavoritos(mensagem: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Atenção", message: mensagem, preferredStyle: .alert)
    
            let botaoLevaParaTelaIncial = UIAlertAction(title: "Ir para tela inicial", style: .default) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(botaoLevaParaTelaIncial)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension FavoritosVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personagensFavoritos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CelulaTableViewCell
        
        cell.lblNome.text    = self.personagensFavoritos[indexPath.row].name
        cell.lblStatus.text  = self.personagensFavoritos[indexPath.row].status
        cell.lblSpecies.text = self.personagensFavoritos[indexPath.row].species
        
        if let image = self.personagensFavoritos[indexPath.row].image{
            let url  = URL(string: image)
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
            
            cell.img.layer.cornerRadius  = 40.0
        }
        return cell
    }
}
extension FavoritosVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let detail = DetailVC()
        
        var personagem          = Personagem()
        personagem.image        = personagensFavoritos[indexPath.row].image
        personagem.name         = personagensFavoritos[indexPath.row].name
        personagem.species      = personagensFavoritos[indexPath.row].species
        personagem.gender       = personagensFavoritos[indexPath.row].gender
        personagem.status       = personagensFavoritos[indexPath.row].status
        
        detail.personagemTocado = personagem
        self.show(detail, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let personagemExcluido = self.personagensFavoritos[indexPath.row]
        let context = DataBaseController.persistentContainer.viewContext
        context.delete(personagemExcluido)
        
        try! context.save()
        
        self.personagensFavoritos.remove(at: indexPath.row)
        favoritosPersonagens.reloadData() // aqui está fazendo aquele botão de delete
    }
}
