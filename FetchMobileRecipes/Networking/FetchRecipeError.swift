//
//  FetchRecipeError.swift
//  FetchMobileRecipes
//
//  Created by Brian Goo on 10/6/24.
//

import Foundation

enum FetchRecipeError: Error {
    case invalidUrl
    case invalidResponse
    case emptyResponse
}

extension FetchRecipeError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidUrl:
            NSLocalizedString("There was an invalid URL provided. Contact developer.", comment: "Invalid URL")
        case .invalidResponse:
            NSLocalizedString("There was an invalid response. Contact developer.", comment: "Invalid response")
        case .emptyResponse:
            NSLocalizedString("No recipes were found.", comment: "Empty response")
        }
    }
}
