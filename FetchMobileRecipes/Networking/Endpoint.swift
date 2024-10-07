//
//  FetchRecipesEndpoint.swift
//  FetchMobileRecipes
//
//  Created by Brian Goo on 10/6/24.
//

import Foundation

enum Endpoint: String {
    static let baseUrl = "https://d3jbb8n5wk0qxi.cloudfront.net"
    
    case empty = "recipes-empty.json"
    case valid = "recipes.json"
    case invalid = "recipes-malformed.json"
    
    var urlString: String {
        "\(Endpoint.baseUrl)/\(self.rawValue)"
    }
}
