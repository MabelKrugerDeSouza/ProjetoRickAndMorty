//
//  API.swift
//  ProjetoFinalRickAndMorty
//
//  Created by Mabel Kruger de Souza on 26/10/21.
//
import Foundation

class API{
    let base = "https://rickandmortyapi.com/api"
    
    func setCharacter() -> String{
        return "\(self.base)/\(EndPoints.character)/?page="
    }
    
    var isPaginating = false
    func getPersonagens(urlString: String,page: Int, pagination: Bool = false, method: HTTPMethods, response: @escaping([Personagem]) -> Void, errorR: @escaping (ErrorAPI) -> Void){
        if pagination{
            self.isPaginating = true
        }
        let configURL: URLSessionConfiguration = .default
        let sessionURL: URLSession = URLSession(configuration: configURL)
            
        guard let url: URL = URL(string: urlString + String(page)) else{return}
        
        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "\(method)"
        
        let task = sessionURL.dataTask(with: urlRequest, completionHandler: { (result, urlResponse, error) in
            var statusCode: Int = 0
            
            if let response = urlResponse as? HTTPURLResponse{
                statusCode = response.statusCode
                print(statusCode)
            }
            guard let data = result else{return}
            
            do {
                let decoder: JSONDecoder = JSONDecoder()
                let deconderData: Resulta = try decoder.decode(Resulta.self, from: data)
                if pagination{
                    self.isPaginating = false
                }
                
                switch statusCode {
                case 200:
                    response(deconderData.results)
                    //errorR(ErrorAPI.notFound)
                case 404:
                    errorR(ErrorAPI.notFound)
                    return
                case 500:
                    errorR(ErrorAPI.serverError)
                    return
                default:
                    break
                }
            } catch {
                errorR(ErrorAPI.invalidResponse)
            }

            })
        
        task.resume()
    }
}
