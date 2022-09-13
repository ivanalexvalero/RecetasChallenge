//
//  HomeProvider.swift
//  RecetasChallenge
//
//  Created by Ivan Valero on 13/09/2022.
//

import Foundation

protocol HomeProviderProtocol {
    func getRecetas() async throws -> RecipesModel
}

class HomeProvider: HomeProviderProtocol {
    func getRecetas() async throws -> RecipesModel {
        
        let requesModel = RequestModel(endpoint: .recipes)
        
        do {
            let model = try await ServiceLayer.callService(requesModel)
            return model
        } catch {
            print("Error al llamar a la api: ",error)
            throw error
        }
        
    }
}
