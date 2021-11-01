//
//  Mensagens.swift
//  ProjetoFinalRickAndMorty
//
//  Created by Mabel Kruger de Souza on 01/11/21.
//

import UIKit

struct Mensagens{
    
   var api: API?
    
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
    
    func mostraAlertaComun(mensagem: String)-> UIAlertController{
        let alert = UIAlertController(title: "Atenção", message: mensagem, preferredStyle: .alert)
        
        let botaoOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(botaoOK)
        
        //self.present(alert, animated: true, completion: nil)
        
        return alert
    }
}
