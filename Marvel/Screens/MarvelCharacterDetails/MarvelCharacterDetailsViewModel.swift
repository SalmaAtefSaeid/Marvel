//
//  MarvelCharacterDetailsViewModel.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import Foundation
import Combine

class MarvelCharacterDetailsViewModel: ObservableObject {
    
    @Published var comics = [Comic]()
    @Published var stories = [Story]()
    @Published var events = [Event]()
    @Published var character: MarvelCharacter
    @Published var errorMessage = ""
    @Published var showError = false
    
    private let networkManager = NetworkManager()
    private var isLoading = false
    
    init(character: MarvelCharacter) {
        self.character = character
        fetchComics(characterId: character.id)
        fetchStories(characterId: character.id)
        fetchEvents(characterId: character.id)
    }
    
    private func fetchComics(characterId: Int) {
        guard !isLoading else { return }
        isLoading = true
        let parameters: [String : Any] = NetworkConstants().authenticationParameters(parameters: [:])
        let url = NetworkConstants.requestToGetCharactersList + "/\(characterId)" + NetworkConstants.comicsListURI
        networkManager.sendHTTPRequest(urlString: url, httpMethod: HTTPMethodType.get.rawValue, parameters: parameters) { [weak self] (apiResponse: APIResponseWrapper<Comic>) in
            DispatchQueue.main.async {
                self?.comics = apiResponse.data.results
                self?.isLoading = false
            }
        } failureHandler: { [weak self] error in
            print("Error fetching characters: \(error)")
            DispatchQueue.main.async {
                self?.showError = true
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
    
    private func fetchStories(characterId: Int) {
        guard !isLoading else { return }
        isLoading = true
        let parameters: [String : Any] = NetworkConstants().authenticationParameters(parameters: [:])
        let url = NetworkConstants.requestToGetCharactersList + "/\(characterId)" + NetworkConstants.storiesListURI
        networkManager.sendHTTPRequest(urlString: url, httpMethod: HTTPMethodType.get.rawValue, parameters: parameters) { [weak self] (apiResponse: APIResponseWrapper<Story>) in
            DispatchQueue.main.async {
                self?.stories = apiResponse.data.results
                self?.isLoading = false
            }
        } failureHandler: { [weak self] error in
            print("Error fetching characters: \(error)")
            DispatchQueue.main.async {
                self?.showError = true
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
    
    private func fetchEvents(characterId: Int) {
        guard !isLoading else { return }
        isLoading = true
        let parameters: [String : Any] = NetworkConstants().authenticationParameters(parameters: [:])
        let url = NetworkConstants.requestToGetCharactersList + "/\(characterId)" + NetworkConstants.eventsListURI
        networkManager.sendHTTPRequest(urlString: url, httpMethod: HTTPMethodType.get.rawValue, parameters: parameters) { [weak self] (apiResponse: APIResponseWrapper<Event>) in
            DispatchQueue.main.async {
                self?.events = apiResponse.data.results
                self?.isLoading = false
            }
        } failureHandler: { [weak self] error in
            print("Error fetching characters: \(error)")
            DispatchQueue.main.async {
                self?.showError = true
                self?.errorMessage = error.localizedDescription
                self?.isLoading = false
            }
        }
    }
}
