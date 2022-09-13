//
//  RequestModel.swift
//  RecetasChallenge
//
//  Created by Ivan Valero on 13/09/2022.
//

import Foundation

struct RequestModel {
//    var routeValue: RouteValue?
    let endpoint: Endpoints
    var queryItems: [String:String]?
    let httpMethod: HttpMethod = .GET
    var baseUrl: URLBase = .recipe

    
    func getURL() -> String {
        return baseUrl.rawValue + endpoint.rawValue
    }
    
    enum HttpMethod: String {
        case GET
        case POST
    }
    
    enum Endpoints: String   {

        case recipes = "/android-test/recipes.json"
        case empty = ""
    }
    
    enum URLBase: String {
        case recipe = "https://hf-android-app.s3-eu-west-1.amazonaws.com"
    }
    
}
