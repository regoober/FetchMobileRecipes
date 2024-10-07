//
//  FetchMobileRecipesApp.swift
//  FetchMobileRecipes
//
//  Created by Brian Goo on 10/4/24.
//

import SwiftUI

@main
struct FetchMobileRecipesApp: App {
    let configuration: Configuration
    
    init() {
        let apiClient = FetchAPIClientService()
        let imageCacheService = ImageCacheService()
        configuration = .init(apiClient: apiClient,
                              imageCacheService: imageCacheService
                               // Uncomment line 21 if you want to enable the debug UI
                               // (as seen in the SwiftUI preview for `FetchMobileRecipesView`)
                               //, debugMode: true
                              )
    }
    var body: some Scene {
        WindowGroup {
            FetchMobileRecipesView(vm: FetchRecipesViewModel(fetchAPIClient: configuration.apiClient))
                .environmentObject(configuration)
        }
    }
}
