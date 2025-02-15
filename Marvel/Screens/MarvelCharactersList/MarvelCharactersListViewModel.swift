//
//  MarvelCharactersListViewModel.swift
//  Marvel
//
//  Created by Salma Atef on 11/11/2024.
//

import Foundation
import Combine

@MainActor final class MarvelCharactersListViewModel: ObservableObject {
    
    @Published var characters = [MarvelCharacter]()
    @Published var isLoading = false
    @Published var errorMessage = ""
    @Published var showError = false
    
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
        Task {
            do {
                let apiResponse: APIResponseWrapper<MarvelCharacter> = try await NetworkManager.shared.sendHTTPRequest(urlString: NetworkConstants.requestToGetCharactersList, httpMethod: .get, parameters: parameters)
                self.characters = apiResponse.data.results
                self.currentPage += 1
                self.isLoading = false
            } catch {
                print("Error fetching comics: \(error)")
                self.showError = true
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
    
    private func fetchCharacters() {
        guard !isLoading else { return }
        isLoading = true
        let offset = currentPage * pageSize
        let parameters: [String : Any] = NetworkConstants().authenticationParameters(parameters: ["offset": offset, "limit": pageSize])
        
        Task {
            do {
                let apiResponse: APIResponseWrapper<MarvelCharacter> = try await NetworkManager.shared.sendHTTPRequest(urlString: NetworkConstants.requestToGetCharactersList, httpMethod: .get, parameters: parameters)
                self.characters.append(contentsOf: apiResponse.data.results)
                self.currentPage += 1
                self.isLoading = false
            } catch {
                print("Error fetching comics: \(error)")
                self.showError = true
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
}

