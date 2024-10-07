//
//  FetchAPIClient.swift
//  FetchMobileRecipes
//
//  Created by Brian Goo on 10/6/24.
//

import Foundation

protocol FetchAPIClient {
    func fetch<T: Decodable>(_ endpoint: Endpoint) async throws -> T
    // TODO: other functions for non-fetch operations
}

class FetchAPIClientService: FetchAPIClient {
    private(set) lazy var recipesJSONDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func fetch<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        guard let url = URL(string: endpoint.urlString) else {
            throw FetchRecipeError.invalidUrl
        }
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        do {
            let response = try recipesJSONDecoder.decode(T.self, from: data)
            return response
        } catch {
            throw FetchRecipeError.invalidResponse
        }
    }
}

class MockApiClient: FetchAPIClient {
    func fetch<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        fatalError("MockApiClient.fetch() should not be called, used for SwiftUI previews only")
    }
}
