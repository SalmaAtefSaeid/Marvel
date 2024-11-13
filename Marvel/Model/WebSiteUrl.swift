//
//  WebSiteUrl.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import Foundation

struct  WebSiteUrl: Codable, Identifiable {
    var id = UUID()
    let type: String
    let url: String
    
    enum CodingKeys: CodingKey {
        case type
        case url
    }
}
