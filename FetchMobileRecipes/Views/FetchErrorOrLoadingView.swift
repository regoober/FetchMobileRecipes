//
//  FetchErrorOrLoadingView.swift
//  FetchMobileRecipes
//
//  Created by Brian Goo on 10/6/24.
//

import SwiftUI

struct FetchErrorOrLoadingView: View {
    @ObservedObject var recipeListVM: FetchRecipesViewModel
    var body: some View {
        Spacer()
        if !recipeListVM.errorText.isEmpty { // Error/Empty view
            VStack {
                if recipeListVM.errorText.contains("No recipes") {
                    Image(systemName: "circle.slash")
                        .foregroundStyle(.gray)
                        .imageScale(.large)
                } else {
                    Image(systemName: "x.circle.fill")
                        .foregroundStyle(.red)
                        .imageScale(.large)
                }
                Text(recipeListVM.errorText)
                    .multilineTextAlignment(.center)
                Button {
                    recipeListVM.clearState()
                } label: {
                    Label("Refresh", systemImage: "arrow.clockwise")
                }
                .buttonStyle(.borderedProminent)
                
            }
            .padding()
        } else {
            ProgressView()
                .controlSize(.large)
                .task {
                    await recipeListVM.refreshRecipes()
                }
        }
        Spacer()
    }
}

#Preview("Empty Response") {
    let emptyVM = FetchRecipesViewModel(recipeList: [], fetchAPIClient: FetchAPIClientService())
    emptyVM.selectedEndpointIdx = Endpoint.empty.numIdx
    emptyVM.errorText = "No recipes were found."
    return FetchErrorOrLoadingView(recipeListVM: emptyVM)
}

#Preview("Invalid Response") {
    let invalidVM = FetchRecipesViewModel(recipeList: [], fetchAPIClient: FetchAPIClientService())
    invalidVM.selectedEndpointIdx = Endpoint.invalid.numIdx
    invalidVM.errorText = "There was an invalid response. Contact developer."
    return FetchErrorOrLoadingView(recipeListVM: invalidVM)
}
