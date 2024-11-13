//
//  ThumbnailImage.swift
//  Marvel
//
//  Created by Salma Atef on 11/11/2024.
//

import Foundation

struct ThumbnailImage: Codable, Identifiable {
    
    var id = UUID()
    let path: String
    let ext: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
    
    // Computed property to get full URL for image
    var fullURL: String {
        return "\(path).\(ext)"
    }
}
