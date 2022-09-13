//
//  JsonUtils.swift
//  RecetasChallenge
//
//  Created by Ivan Valero on 13/09/2022.
//

import Foundation


class JsonUtils {
    static func parseJson(jsonName : String) -> RecipesModel?{
        guard let url = Bundle.main.url(forResource: jsonName, withExtension: "json") else {
            return nil
        }
        do{
            let data = try Data(contentsOf: url)
            
            let jsonDecoder = JSONDecoder()
            do{
                let responseModel = try jsonDecoder.decode(RecipesModel.self, from: data)
                return responseModel
            }catch{
                print("json mock error: \(error)")
                return nil
            }
        }catch{
            return nil
        }
    }
}
