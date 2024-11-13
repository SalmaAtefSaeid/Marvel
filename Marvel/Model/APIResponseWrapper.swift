//
//  APIResponseWrapper.swift
//  Marvel
//
//  Created by Salma Atef on 11/11/2024.
//

import Foundation

import Foundation

// Wrapper object for API responses
struct APIResponseWrapper<T: Codable>: Codable {
    let code: Int                     // The HTTP status code of the returned result
    let status: String                // A string description of the call status
    let data: APIResponseContainer<T> // The results returned by the call
    let etag: String                  // A digest value of the content
    let copyright: String             // The copyright notice for the returned result
    let attributionText: String       // The attribution notice for this result
    let attributionHTML: String       // An HTML representation of the attribution notice for this result
}

