//
//  CelulaTableViewCell.swift
//  ProjetoFinalRickAndMorty
//
//  Created by Mabel Kruger de Souza on 26/10/21.
//

import UIKit

class CelulaTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNome :    UILabel!
    @IBOutlet weak var img :        UIImageView!
    @IBOutlet weak var lblStatus:   UILabel!
    @IBOutlet weak var lblSpecies:  UILabel!
    @IBOutlet weak var btnFavorito: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
