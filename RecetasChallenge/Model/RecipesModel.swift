//
//  RecetaModel.swift
//  RecetasChallenge
//
//  Created by Ivan Valero on 13/09/2022.
//

import Foundation

struct RecipesModel: Codable {
    var recipesJson: [RecipesJson]
    
    enum CodingKeys: String, CodingKey {
        case recipesJson
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
  
        self.recipesJson = try container.decode([RecipesJson].self, forKey: .recipesJson)
//        if let recipesJson = try? container.decode([RecipesJson].self, forKey: .recipesJson){
//            self.recipesJson = recipesJson
//        }else {
//            self.recipesJson = nil
//        }
    }
    
    struct RecipesJson: Codable {
        var calories: String?
        var carbos: String?
        var description: String
        var difficulty: Int?
        var fats: String?
        var headline: String?
        var id: String?
        var image: String
        var name: String
        var proteins: String?
        var thumb: String?
        var time: String?
        var country: String?
        
        enum CodingKeys : String, CodingKey {
            case calories
            case carbos
            case description
            case difficulty
            case fats
            case headline
            case id
            case image
            case name
            case proteins
            case thumb
            case time
            case country
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            if let calories = try? container.decode(String.self, forKey: .calories){
                self.calories = calories
            }else {
                self.calories = nil
            }
            
            if let carbos = try? container.decode(String.self, forKey: .carbos){
                self.carbos = carbos
            }else {
                self.carbos = nil
            }
            
            if let difficulty = try? container.decode(Int.self, forKey: .difficulty){
                self.difficulty = difficulty
            }else {
                self.difficulty = nil
            }
            
            if let fats = try? container.decode(String.self, forKey: .fats){
                self.fats = fats
            }else {
                self.fats = nil
            }
            
            if let headline = try? container.decode(String.self, forKey: .headline){
                self.headline = headline
            }else {
                self.headline = nil
            }
            
            if let id = try? container.decode(String.self, forKey: .id){
                self.id = id
            }else {
                self.id = nil
            }
            
            if let proteins = try? container.decode(String.self, forKey: .proteins){
                self.proteins = proteins
            }else {
                self.proteins = nil
            }
            
            if let thumb = try? container.decode(String.self, forKey: .thumb){
                self.thumb = thumb
            }else {
                self.thumb = nil
            }
            
            if let time = try? container.decode(String.self, forKey: .time){
                self.time = time
            }else {
                self.time = nil
            }

//            if let name = try? container.decode(String.self, forKey: .name){
//                self.name = name
//            }else {
//                self.name = nil
//            }
            
            if let country = try? container.decode(String.self, forKey: .country){
                self.country = country
            }else {
                self.country = nil
            }

            
            self.name = try container.decode(String.self, forKey: .name)
            
            self.description = try container.decode(String.self, forKey: .description)
            
            self.image = try container.decode(String.self, forKey: .image)
            
//            if let description = try? container.decode(String.self, forKey: .description){
//                self.description = description
//            }else {
//                self.description = nil
//            }
//
//            if let image = try? container.decode(String.self, forKey: .image){
//                self.image = image
//            }else {
//                self.image = nil
//            }

        }
    }
    
}


