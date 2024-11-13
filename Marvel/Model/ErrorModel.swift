//
//  ErrorModel.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import Foundation

struct ErrorModel: Codable, Error {
    var code: Int
    var message: String?
    
    var localizedDescription: String {
        return "Error \(code): \(message ?? "")"
    }
}
