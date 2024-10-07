//
//  ImageCacheService.swift
//  FetchMobileRecipes
//
//  Created by Brian Goo on 10/6/24.
//

import Foundation
import Nuke

class ImageCacheService {
    let imagePipeline: ImagePipeline
    
    // default to data caching, but can be swapped with any other pipeline
    init(imagePipeline: ImagePipeline = ImagePipeline(configuration: .withDataCache(name: "com.github.regoober.FetchMobileRecipes.dataCache"))) {
        self.imagePipeline = imagePipeline
    }
}
