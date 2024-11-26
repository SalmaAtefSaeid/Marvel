//
//  MarvelCharactersListView.swift
//  Marvel
//
//  Created by Salma Atef on 11/11/2024.
//

import SwiftUI

struct MarvelCharactersListView: View {
    
    @StateObject private var viewModel = MarvelCharactersListViewModel()
    @State var searchText = ""
    @State var startSearching = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading && viewModel.characters.isEmpty {
                    LoadingView()
                } else if viewModel.characters.isEmpty {
                    NoCharactersView()
                } else {
                    List(viewModel.characters) { character in
                        NavigationLink(value: character) {
                            MarvelCharacterView(character: character)
                                .onAppear {
                                    viewModel.loadMoreCharactersIfNeeded(currentCharacter: character)
                                }
                        }
                        .listRowInsets(EdgeInsets())
                    }
                    .listStyle(.plain)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: MarvelCharacter.self) { character in
                MarvelCharacterDetailsView(viewModel: MarvelCharacterDetailsViewModel(character: character))
            }
            .alert(isPresented: $viewModel.showError, content: {
                Alert(title: Text(""), message: Text(viewModel.errorMessage), dismissButton: .destructive(Text("OK")))
            })
            .toolbar {
                ToolbarItem(placement: .principal) {
                    SearchBarView(searchText: $searchText, viewModel: viewModel, showCancelButton: $startSearching)
                }
            }
        }
    }
}

#Preview {
    MarvelCharactersListView()
}
