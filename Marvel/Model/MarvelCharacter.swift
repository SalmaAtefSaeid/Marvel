//
//  MarvelCharacter.swift
//  Marvel
//
//  Created by Salma Atef on 11/11/2024.
//

import Foundation

struct MarvelCharacter: Codable, Hashable, Identifiable {
    
    let id: Int
    let name: String
    let description: String
    let modified: String
    let resourceURI: String
    let urls: [WebSiteUrl]
    let thumbnail: ThumbnailImage
    
    static func == (lhs: MarvelCharacter, rhs: MarvelCharacter) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
