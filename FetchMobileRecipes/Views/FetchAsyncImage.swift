//
//  FetchAsyncImage.swift
//  FetchMobileRecipes
//
//  Created by Brian Goo on 10/6/24.
//

import SwiftUI
import NukeUI

struct FetchAsyncImage: View {
    @EnvironmentObject var config: Configuration
    let url: URL
    
    var body: some View {
        LazyImage(url: url) { state in
            if let image = state.image {
                image.resizable().aspectRatio(1.0, contentMode: .fill)
            } else if state.error != nil { // Indicates an error
                Image(systemName: "photo.badge.exclamationmark.fill")
                    .resizable().aspectRatio(1.1, contentMode: .fit)
                    .symbolRenderingMode(.multicolor)
            } else { // Acts as a placeholder
                ProgressView()
                    .controlSize(.small)
            }
        }
        .pipeline(config.imageCacheService.imagePipeline)
    }
}

#Preview {
    let config = Configuration(apiClient: MockApiClient(), imageCacheService: ImageCacheService())
    let mockImageUrl = URL(string: "https://picsum.photos/50/50")!
    return FetchAsyncImage(url: mockImageUrl).environmentObject(config)
}
