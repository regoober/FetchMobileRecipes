//
//  Configuration.swift
//  FetchMobileRecipes
//
//  Created by Brian Goo on 10/6/24.
//

import Foundation
import Nuke

class Configuration: ObservableObject {
    /// The API client implementation
    let apiClient: FetchAPIClient
    /// The image cache service (can be used to swap
    let imageCacheService: ImageCacheService
    /// Toggle to enable any debug-mode UI in the app
    let debugMode: Bool
    // And any other app-wide configuration details: Build Env, etc.
    
    init(apiClient: FetchAPIClient, imageCacheService: ImageCacheService, debugMode: Bool = false) {
        self.apiClient = apiClient
        self.imageCacheService = imageCacheService
        self.debugMode = debugMode
    }
}
