//
//  DetailVC.swift
//  ProjetoFinalRickAndMorty
//
//  Created by Mabel Kruger de Souza on 26/10/21.
//
import UIKit
import Kingfisher

class DetailVC: UIViewController{
    
    var personagemTocado: Personagem  = Personagem()
    let reuseIdentifier =  "Celula"
    
    lazy var detailPersonagem: UITableView = {
        var detail              = UITableView()
        detail.frame            = self.view.bounds
        detail.dataSource       = self
        detail.separatorStyle   = .none

        return detail
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.title = personagemTocado.name
        self.view.addSubview(detailPersonagem)
        
        
    }
}

extension DetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        cell.selectionStyle = .none
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
            guard let name = personagemTocado.name else { return UITableViewCell() }
            cell.textLabel?.text       = "Nome:"
            cell.detailTextLabel?.text = name
            
        case 2:
            guard let species = personagemTocado.species else { return UITableViewCell() }
            cell.textLabel?.text       = "Espécie:"
            cell.detailTextLabel?.text = species
        case 3:
            guard let status = personagemTocado.status else { return UITableViewCell() }
            cell.textLabel?.text       = "Status:"
            cell.detailTextLabel?.text = status
        case 4:
            guard let genrer = personagemTocado.gender else { return UITableViewCell() }
            cell.textLabel?.text            = "Genero:"
            cell.detailTextLabel?.text      = genrer
        case 5:
            cell.textLabel?.text            = "Adicionar aos favoritos"
            cell.accessoryType              = .disclosureIndicator

        default:
            return UITableViewCell()
        }

        return cell
    }
}
