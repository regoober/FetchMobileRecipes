//
//  FetchMobileRecipesView.swift
//  FetchMobileRecipes
//
//  Created by Brian Goo on 10/4/24.
//

import SwiftUI
import Nuke
import NukeUI

struct FetchMobileRecipesView: View {
    @EnvironmentObject var config: Configuration
    @StateObject var recipeListVM: FetchRecipesViewModel
    
    init(vm: @autoclosure @escaping () -> FetchRecipesViewModel) {
        _recipeListVM = StateObject(wrappedValue: vm())
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // Debug picker as header (if enabled)
                if config.debugMode {
                    APIDebugPicker(selectedEndpointIdx: $recipeListVM.selectedEndpointIdx)
                }
                if !recipeListVM.recipes.isEmpty { // List View of populated recipes
                    List(recipeListVM.recipes) { FetchRecipeItemView(recipe: $0)
                    }
                    .listStyle(.plain)
                    .listRowSeparator(.hidden)
                    .listRowSpacing(0)
                    .navigationTitle("Recipes")
                    .navigationBarTitleDisplayMode(.inline)
                    .refreshable {
                        recipeListVM.clearState()
                    }
                } else { // Handles empty response, invalid response, and loading UI
                    FetchErrorOrLoadingView(recipeListVM: recipeListVM)
                }
            }
        }
    }
}

#Preview {
    let config = Configuration(apiClient: FetchAPIClientService(), imageCacheService: ImageCacheService(), debugMode: true)
    FetchMobileRecipesView(vm: FetchRecipesViewModel(fetchAPIClient: config.apiClient)).environmentObject(config)
}
