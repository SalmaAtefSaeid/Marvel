//
//  MarvelCharacterDetailsViewModel.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import Foundation
import Combine

@MainActor final class MarvelCharacterDetailsViewModel: ObservableObject {
    
    @Published var comics = [Comic]()
    @Published var stories = [Story]()
    @Published var events = [Event]()
    @Published var character: MarvelCharacter
    @Published var errorMessage = ""
    @Published var showError = false
    
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
        
        let parameters: [String: Any] = NetworkConstants().authenticationParameters(parameters: [:])
        let url = NetworkConstants.requestToGetCharactersList + "/\(characterId)" + NetworkConstants.comicsListURI
        
        Task {
            do {
                let apiResponse: APIResponseWrapper<Comic> = try await NetworkManager.shared.sendHTTPRequest(urlString: url, httpMethod: .get, parameters: parameters)
                
                self.comics = apiResponse.data.results
                self.isLoading = false
            } catch {
                print("Error fetching comics: \(error)")
                self.showError = true
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }

    
    private func fetchStories(characterId: Int) {
        guard !isLoading else { return }
        isLoading = true
        let parameters: [String : Any] = NetworkConstants().authenticationParameters(parameters: [:])
        let url = NetworkConstants.requestToGetCharactersList + "/\(characterId)" + NetworkConstants.storiesListURI
        
        Task {
            do {
                let apiResponse: APIResponseWrapper<Story> = try await NetworkManager.shared.sendHTTPRequest(urlString: url, httpMethod: .get, parameters: parameters)
                self.stories = apiResponse.data.results
                self.isLoading = false
            } catch {
                print("Error fetching comics: \(error)")
                self.showError = true
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
    
    private func fetchEvents(characterId: Int) {
        guard !isLoading else { return }
        isLoading = true
        let parameters: [String : Any] = NetworkConstants().authenticationParameters(parameters: [:])
        let url = NetworkConstants.requestToGetCharactersList + "/\(characterId)" + NetworkConstants.eventsListURI
        
        Task {
            do {
                let apiResponse: APIResponseWrapper<Event> = try await NetworkManager.shared.sendHTTPRequest(urlString: url, httpMethod: .get, parameters: parameters)
                self.events = apiResponse.data.results
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
