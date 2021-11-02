//
//  Imagem.swift
//  ProjetoFinalRickAndMorty
//
//  Created by Mabel Kruger de Souza on 28/10/21.
//
import UIKit
import SnapKit
import Kingfisher

class ImageViewCell: UITableViewCell {
    
    private var uiiv_Image = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(self.uiiv_Image)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageView(url: URL, rounded: Bool = false) {
        
        if rounded {
            
            self.uiiv_Image.layer.cornerRadius  = 125.0
            self.uiiv_Image.layer.borderWidth   = 1.0
            self.uiiv_Image.layer.borderColor   = UIColor.black.cgColor
            self.uiiv_Image.layer.masksToBounds = true        }
        
        self.uiiv_Image.contentMode = .scaleAspectFit
        self.uiiv_Image.kf.setImage(with: url,
                                    options: [
                                        .cacheOriginalImage
                                    ],
                                    completionHandler: { result in
                                    
                                    })
        
        self.uiiv_Image.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(250)
            make.height.equalTo(250)
        }
    }
}
