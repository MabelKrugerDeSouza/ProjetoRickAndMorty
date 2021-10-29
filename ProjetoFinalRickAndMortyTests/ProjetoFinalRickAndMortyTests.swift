//
//  ProjetoFinalRickAndMortyTests.swift
//  ProjetoFinalRickAndMortyTests
//
//  Created by Mabel Kruger de Souza on 29/10/21.
//

import XCTest
@testable import ProjetoFinalRickAndMorty

class ProjetoFinalRickAndMortyTests: XCTestCase {
    func testParaChamarAApiUmaVez(){
        let apiDouble = ApiDouble()// aqui ta pegando a duble da api
        let sut = ViewController(api: apiDouble)
        
        sut.loadViewIfNeeded()

        XCTAssertEqual(apiDouble.chamadasApi,1, "Api deve ser chama  uma vez meu amigo")
    }
}
