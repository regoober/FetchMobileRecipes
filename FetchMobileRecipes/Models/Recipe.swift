//
//  Recipe.swift
//  FetchMobileRecipes
//
//  Created by Brian Goo on 10/4/24.
//

import Foundation

struct Recipe: Decodable, Identifiable {
    var id: UUID { uuid }
    let cuisine: String
    let name: String
    let photoUrlLarge: URL
    let photoUrlSmall: URL
    let sourceUrl: URL?
    let uuid: UUID
    let youtubeUrl: URL?
}

struct RecipesResponse: Decodable {
    let recipes: [Recipe]
}
