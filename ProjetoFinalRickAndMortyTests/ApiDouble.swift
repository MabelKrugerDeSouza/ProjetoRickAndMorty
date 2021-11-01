//
//  ApiDouble.swift
//  ProjetoFinalRickAndMortyTests
//
//  Created by Mabel Kruger de Souza on 29/10/21.
//

import XCTest
@testable import ProjetoFinalRickAndMorty // importanto o projeto para conseguir ter acesso as classes e conseguir fazer os testes

class ApiDouble: API {
    var chamadasApi = 0
    
    override func setCharacter() -> String {
        return " "
    }
    override func getPersonagens(urlString: String,page: Int, pagination: Bool = false, method: HTTPMethods, response: @escaping([Personagem]) -> Void, errorR: @escaping (ErrorAPI) -> Void){
        chamadasApi += 1
        
        let personagensRetorno: [Personagem] = []
        response(personagensRetorno)
    }
}
