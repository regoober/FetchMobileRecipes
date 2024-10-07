//
//  FetchRecipesViewModel.swift
//  FetchMobileRecipes
//
//  Created by Brian Goo on 10/4/24.
//

import Foundation


class FetchRecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe]
    @Published var errorText: String = ""
    @Published var selectedEndpointIdx: Int = Endpoint.valid.numIdx
    let fetchAPIClient: FetchAPIClient
    
    init(recipeList: [Recipe] = [], fetchAPIClient: FetchAPIClient) {
        self.recipes = recipeList
        self.fetchAPIClient = fetchAPIClient
    }
    
    @MainActor
    func refreshRecipes(_ endpoint: Endpoint? = nil, delay: ContinuousClock.Instant.Duration = .milliseconds(0)) async {
        do {
            if delay != .milliseconds(0) {
                try await Task.sleep(for: delay)
            }
            try await fetchRecipes(endpoint: endpoint ?? Endpoint.at(selectedEndpointIdx))
        } catch {
            errorText = error.localizedDescription
        }
    }
    
    @MainActor
    func fetchRecipes(endpoint: Endpoint) async throws {
        do {
            let response: RecipesResponse = try await fetchAPIClient.fetch(endpoint)
            guard !response.recipes.isEmpty else {
                throw FetchRecipeError.emptyResponse
            }
            recipes = response.recipes
        } catch FetchRecipeError.emptyResponse {
            throw FetchRecipeError.emptyResponse
        } catch {
            throw FetchRecipeError.invalidResponse
        }
    }
    
    @MainActor
    func clearState() {
        errorText = ""
        recipes = []
    }
}
