//
//  DetailVC.swift
//  ProjetoFinalRickAndMorty
//
//  Created by Mabel Kruger de Souza on 26/10/21.
//
import UIKit
import Kingfisher
import CoreData

class DetailVC: UIViewController{
    
    var personagemTocado: Personagem  = Personagem()
    let reuseIdentifier =  "Celula"
    
    lazy var detailPersonagem: UITableView = {
        var detail              = UITableView()
        detail.frame            = self.view.bounds
        detail.dataSource       = self
        detail.delegate         = self
        detail.separatorStyle   = .none

        return detail
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailPersonagem)
        self.title = personagemTocado.name
        
        //self.detailPersonagem.backgroundColor = UIColor(red: 132.5/255.0, green: 200.5/255.0, blue: 40.0/255.0, alpha: 1.0)
    }
  
    //MARK: funcoes
    func verificaPersonagemNoBanco( nomePersonagem: String) -> Bool{
        var retorno: Bool = true
        let context = DataBaseController.persistentContainer.viewContext
                    do {
                        //esta fazendo um request na entidade para ver se aquele personagem ja existe, buscando pelo nome
                        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Personagens")
                        fetchRequest.predicate =  NSPredicate(format: "name =%@", nomePersonagem)
                        let fetchedPersonagens = try context.fetch(fetchRequest)
                        print(fetchedPersonagens.count)

                        if fetchedPersonagens.count == 0 {
                            retorno = false
                        }
                    } catch let error {
                        print(error)
                    }
        return retorno
    }
}

//MARK: extension DataSource
extension DetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !verificaPersonagemNoBanco(nomePersonagem: personagemTocado.name!){
           return 6
        }
        else {
            return 5
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        cell.backgroundColor = UIColor(red: 132.5/255.0, green: 200.5/255.0, blue: 40.0/255.0, alpha: 1.0)
        cell.detailTextLabel?.font = UIFont.boldSystemFont(ofSize: 15.0)
        
        switch indexPath.row {
        case 0:
            let cellImage = ImageViewCell()
            guard let urlString = personagemTocado.image else { return UITableViewCell() }
            guard let url = URL(string: urlString) else { return UITableViewCell() }
            cellImage.setImageView(url: url, rounded: true)
            cellImage.backgroundColor = .clear
            return cellImage
            
        case 1:
            if let name = personagemTocado.name{
                cell.detailTextLabel?.text = name
                cell.detailTextLabel?.font =
                UIFont.boldSystemFont(ofSize: 30.0)
            }
            
        case 2:
            if let species = personagemTocado.species{
                cell.textLabel?.text       = "Espécie:"
                cell.detailTextLabel?.text = species
            }
            
        case 3:
            if let status = personagemTocado.status {
                cell.textLabel?.text       = "Status:"
                cell.detailTextLabel?.text = status
            }
           
        case 4:
            if let genrer = personagemTocado.gender {
                cell.textLabel?.text        = "Genero:"
                cell.detailTextLabel?.text  = genrer
            }
            
        case 5:
            if !verificaPersonagemNoBanco(nomePersonagem: personagemTocado.name!){
                cell.textLabel?.text = "Adicionar aos favoritos"
                cell.accessoryType   = .disclosureIndicator
            }
            
        default:
            return UITableViewCell()
        }

        return cell
    }
}

//MARK: Extension delegate
extension DetailVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 5 {
            let context = DataBaseController.persistentContainer.viewContext
            
                        do {
                            guard let name = personagemTocado.name else {return}

                            //esta fazendo um request na entidade para ver se aquele personagem ja existe, buscando pelo nome
                            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Personagens")
                            fetchRequest.predicate =  NSPredicate(format: "name =%@", name)
                            let fetchedPersonagens = try context.fetch(fetchRequest)
                            print(fetchedPersonagens.count)

                            if fetchedPersonagens.count == 0 {

                                self.savePersonagem(with: self.personagemTocado, context: context)

                            }
                        } catch let error {
                            print(error)
                        }
        }
       
    }
    
    private func savePersonagem(with newPersonagem: Personagem, context: NSManagedObjectContext) {

        // aqui ele esta verificando os parametros
            let personagem = Personagens(context: context)
            personagem.image = newPersonagem.image
            personagem.name = newPersonagem.name
            personagem.status = newPersonagem.status
            personagem.gender = newPersonagem.gender
            personagem.species = newPersonagem.species
           
        // e aqui salvando eles no banco
            DataBaseController.saveContext { [weak self] result in
                guard self != nil else { return }
                switch result {
                case .success:
                    self?.displayAlert(
                        with: "Favoritos",
                        message: "O personagem foi adicionado aos favoritos com sucesso.")
                case .failure(let error):
                    print(error)
                    self?.displayAlert(
                        with: "ERRO",
                        message: "O personagem não foi adicionado aos favoritos. Tente novamente.")
                }
            }
        }
}
