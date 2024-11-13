//
//  Story.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import Foundation

struct Story: Codable, Identifiable {
    var id = UUID()
    let name: String
    let thumbnail: ThumbnailImage
    let images: [ThumbnailImage]
    
    enum CodingKeys: String, CodingKey {
        case name = "title"
        case thumbnail
        case images
    }
}
