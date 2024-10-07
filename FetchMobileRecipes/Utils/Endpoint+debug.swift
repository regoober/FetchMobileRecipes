//
//  Endpoint+debug.swift
//  FetchMobileRecipes
//
//  Created by Brian Goo on 10/6/24.
//

import Foundation

/// This extension of `Endpoint` is to separate out logic pertaining to the debug UI (conversion between numeric index and 
extension Endpoint: CaseIterable {
    static var allCases: [Endpoint] = [.empty, .valid, .invalid] // needs explicit definition in extension file
    
    /// The current numerical index within `Endpoint.allCases`.
    var numIdx: Int {
        Endpoint.allCases.firstIndex(of: self) ?? -1
    }
    
    /// Fetches a random `Endpoint`.
    static var random: Endpoint {
        let randomIdx = Int.random(in: 0..<Endpoint.allCases.count)
        return Endpoint.allCases[randomIdx]
    }
    
    /// Retrieve appropriate `Endpoint` based on provided `idx` (if out-of-bounds, then it's assumed to choose `.random`).
    static func at(_ idx: Int) -> Endpoint {
        if idx < 0 || idx >= Endpoint.allCases.count {
            return Endpoint.random
        }
        return Endpoint.allCases[idx]
    }
}
