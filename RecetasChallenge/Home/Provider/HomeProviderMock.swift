//
//  HomeProviderMock.swift
//  RecetasChallenge
//
//  Created by Ivan Valero on 13/09/2022.
//

import Foundation


class HomeProviderMock: HomeProviderProtocol {
    func getRecetas() async throws -> RecipesModel {
        guard let model = JsonUtils.parseJson(jsonName: "recipes") else {
            throw NetworkError.jsonDecoder
        }
        return model
    }
}
