//
//  NetworkConstants.swift
//  Marvel
//
//  Created by Salma Atef on 11/11/2024.
//

import Foundation
import CryptoKit

struct NetworkConstants {
    
    private static let baseURL =  "https://gateway.marvel.com/v1/public"
    static let requestToGetCharactersList = baseURL + "/characters"
    static let comicsListURI = "/comics"
    static let storiesListURI = "/stories"
    static let eventsListURI = "/events"
    static let publicKey = "0c90cef7657883a5663647faaa602762"
    static let privateKey = "660b0ad32585625d03ea392007b4a3b850b0049e"
    
    func authenticationParameters(parameters: [String: Any]) -> [String: Any] {
        let timestamp = String(Date().timeIntervalSince1970)
        let hash = (timestamp + NetworkConstants.privateKey + NetworkConstants.publicKey).md5()
        var newParameters = [String: Any]()
        parameters.forEach {
            newParameters.updateValue($1, forKey: $0)
        }
        newParameters["ts"] = timestamp
        newParameters["apikey"] = NetworkConstants.publicKey
        newParameters["hash"] = hash
        return newParameters
    }
    
}
