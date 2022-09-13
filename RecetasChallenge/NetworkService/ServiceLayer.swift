//
//  ServiceLayer.swift
//  RecetasChallenge
//
//  Created by Ivan Valero on 13/09/2022.
//

import Foundation

@MainActor
class ServiceLayer {
    static func callService(_ requestModel: RequestModel) async throws -> RecipesModel{
        
        //Get query parameters
        var serviceUrl = URLComponents(string: requestModel.getURL())
        print("service", serviceUrl)
//        serviceUrl?.queryItems = buildQueryItems(params: requestModel.queryItems ?? [:])
//        serviceUrl?.queryItems?.append(URLQueryItem(name: "apikey", value: Constants.apiKey))
        
        
        //Unwrap URL
        guard let componentURL = serviceUrl?.url else {
            throw NetworkError.invalidURL
        }
        var request = URLRequest(url: componentURL)
        request.httpMethod = requestModel.httpMethod.rawValue
        
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.httpResponseError
            }
            
            if (httpResponse.statusCode > 299) {
                throw NetworkError.statusCodeError
            }
            
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(RecipesModel.self, from: data)
                return decodeData
            }catch {
                print(error)
                throw NetworkError.couldNotDecodeData
            }
            
        }catch{
            print(error)
            throw NetworkError.generic
        }
        
    }
    
//    static func buildQueryItems(params: [String:String]) -> [URLQueryItem] {
//        let items = params.map({URLQueryItem(name: $0, value: $1)})
//        return items
//    }
    
    
}
