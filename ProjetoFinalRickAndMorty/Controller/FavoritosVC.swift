//
//  Favoritos.swift
//  ProjetoFinalRickAndMorty
//
//  Created by Mabel Kruger de Souza on 28/10/21.
//

import UIKit
import Kingfisher

class FavoritosVC: UIViewController{
    var personagensFavoritos: [Personagens] = []
    var mainTable : UITableView = UITableView()
    var reuseIdentifier = "Celular"
    override func viewDidLoad() {
            super.viewDidLoad()
        let nib = UINib(nibName: "CelulaTableViewCell", bundle: nil)
        self.mainTable.register(nib, forCellReuseIdentifier: reuseIdentifier)
        mainTable.frame = self.view.bounds
        mainTable.dataSource = self
        mainTable.delegate = self
        self.view.addSubview(mainTable)
        
        print(personagensFavoritos)
    }
}

extension FavoritosVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personagensFavoritos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CelulaTableViewCell
        
        cell.lblNome.text = self.personagensFavoritos[indexPath.row].name
        cell.lblStatus.text = self.personagensFavoritos[indexPath.row].status
        cell.lblSpecies.text = self.personagensFavoritos[indexPath.row].species
        
        if let image = self.personagensFavoritos[indexPath.row].image{
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
}
extension FavoritosVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let detail = DetailVC()
        
        
        
        
        
        var personagem = Personagem()
        personagem.name = personagensFavoritos[indexPath.row].name
        detail.personagemTocado = personagem
        //detail.tableView(DetailVC, cellForRowAt: 6)
        self.show(detail, sender: nil)
    }
}
