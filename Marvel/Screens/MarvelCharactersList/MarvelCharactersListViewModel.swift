//
//  MarvelCharactersListViewModel.swift
//  Marvel
//
//  Created by Salma Atef on 11/11/2024.
//

import Foundation
import Combine

class MarvelCharactersListViewModel: ObservableObject {
    
    @Published var characters = [MarvelCharacter]()
    @Published var isLoading = false
    @Published var errorMessage = ""
    @Published var showError = false
    
    private let networkManager = NetworkManager()
    private let pageSize = 20
    private var currentPage = 0
    
    
    init() {
        loadMoreCharactersIfNeeded(currentCharacter: nil)
    }
    
    func loadMoreCharactersIfNeeded(currentCharacter: MarvelCharacter?) {
        guard let currentCharacter = currentCharacter else {
            // If currentCharacter is nil, load the initial data
            fetchCharacters()
            return
        }
        
        let thresholdIndex = characters.index(characters.endIndex, offsetBy: -5)
        if characters.firstIndex(where: { $0.id == currentCharacter.id }) == thresholdIndex {
            fetchCharacters()
        }
    }

    func searchForCharacters(searchQuery: String) {
        if searchQuery.isEmpty { return }
        guard !isLoading else { return }
        isLoading = true
        let offset = currentPage * pageSize
        let parameters: [String : Any] = NetworkConstants().authenticationParameters(parameters: ["offset": offset, "limit": pageSize, "nameStartsWith": searchQuery])
        networkManager.sendHTTPRequest(urlString:  NetworkConstants.requestToGetCharactersList, httpMethod: HTTPMethodType.get.rawValue, parameters: parameters) { [weak self] (apiResponse: APIResponseWrapper<MarvelCharacter>) in
            DispatchQueue.main.async {
                self?.characters = apiResponse.data.results
                self?.currentPage += 1
                self?.isLoading = false
            }
        } failureHandler: { [weak self] error in
            print("Error fetching characters: \(error)")
            DispatchQueue.main.async { [self] in
                self?.showError = true
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
    
    private func fetchCharacters() {
        guard !isLoading else { return }
        isLoading = true
        let offset = currentPage * pageSize
        let parameters: [String : Any] = NetworkConstants().authenticationParameters(parameters: ["offset": offset, "limit": pageSize])
        networkManager.sendHTTPRequest(urlString:  NetworkConstants.requestToGetCharactersList, httpMethod: HTTPMethodType.get.rawValue, parameters: parameters) { [weak self] (apiResponse: APIResponseWrapper<MarvelCharacter>) in
            DispatchQueue.main.async {
                self?.characters.append(contentsOf: apiResponse.data.results)
                self?.currentPage += 1
                self?.isLoading = false
            }
        } failureHandler: { [weak self] error in
            print("Error fetching characters: \(error)")
            DispatchQueue.main.async { [self] in
                self?.showError = true
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
}

