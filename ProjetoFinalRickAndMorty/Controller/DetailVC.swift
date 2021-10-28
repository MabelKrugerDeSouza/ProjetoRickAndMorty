//
//  DetailVC.swift
//  ProjetoFinalRickAndMorty
//
//  Created by Mabel Kruger de Souza on 26/10/21.
//

import Foundation
import UIKit
import Kingfisher

class DetailVC: UIViewController{
    
    var personagemTocado: Personagem  = Personagem()
    let reuseIdentifier =  "CelulaDetail"
    
    lazy var detailPersonagem: UITableView = {
        var detail = UITableView()
        detail.frame = self.view.bounds

        return detail
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.view.addSubview(self.uitv_tabela)
        self.title = personagemTocado.name
        self.view.addSubview(detailPersonagem)
        
        print("Deu Certo :)")
    }
}
