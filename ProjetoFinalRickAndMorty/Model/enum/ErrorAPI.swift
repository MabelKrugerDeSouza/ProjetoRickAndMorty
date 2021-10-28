//
//  Error.swift
//  ProjetoFinalRickAndMorty
//
//  Created by Mabel Kruger de Souza on 28/10/21.
//

import Foundation

enum ErrorAPI: Error{
    case emptyResponse
    case notFound
    case serverError
    case invalidResponse
}
