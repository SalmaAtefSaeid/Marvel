//
//  APIResponseContainer.swift
//  Marvel
//
//  Created by Salma Atef on 11/11/2024.
//

import Foundation

// Container object with pagination information and results array
struct APIResponseContainer<T: Codable>: Codable {
    let offset: Int                // The requested offset (skipped results) of the call
    let limit: Int                 // The requested result limit
    let total: Int                 // The total number of results available
    let count: Int                 // The total number of results returned by this call
    let results: [T]               // The list of entities returned by the call
}
