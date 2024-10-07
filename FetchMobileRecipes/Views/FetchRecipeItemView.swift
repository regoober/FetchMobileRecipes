//
//  FetchRecipeItemView.swift
//  FetchMobileRecipes
//
//  Created by Brian Goo on 10/6/24.
//

import SwiftUI

struct FetchRecipeItemView: View {
    let recipe: Recipe
    var body: some View {
        HStack {
            FetchAsyncImage(url: recipe.photoUrlSmall)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.title2)
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    let config = Configuration(apiClient: MockApiClient(), imageCacheService: ImageCacheService())
    let recipe = Recipe(cuisine: "British", name: "Bakewell Tart", photoUrlLarge: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dd936646-8100-4a1c-b5ce-5f97adf30a42/large.jpg")!, photoUrlSmall: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dd936646-8100-4a1c-b5ce-5f97adf30a42/small.jpg")!, sourceUrl: nil, uuid: UUID(uuidString: "eed6005f-f8c8-451f-98d0-4088e2b40eb6".uppercased())!, youtubeUrl: URL(string: "https://www.youtube.com/watch?v=1ahpSTf_Pvk")!)
    FetchRecipeItemView(recipe: recipe).environmentObject(config)
}
