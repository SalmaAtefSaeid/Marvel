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
                if viewModel.isLoading {
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
                    }
                    .listStyle(.plain)
                }
            }
            .navigationDestination(for: MarvelCharacter.self) { character in
                MarvelCharacterDetailsView(viewModel: MarvelCharacterDetailsViewModel(character: character))
            }
            .alert(isPresented: $viewModel.showError, content: {
                Alert(title: Text(""), message: Text(viewModel.errorMessage), dismissButton: .destructive(Text("OK")))
            })
            .toolbar {
                ToolbarItem(placement: .principal, content: {
                    ZStack {
                        if startSearching == false {
                            Image("Marvel_Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 40, alignment: .center)
                                .clipped()
                        }
                        
                        HStack {
                            if viewModel.isLoading == false {
                                SearchBarView(searchText: $searchText, viewModel: viewModel, showCancelButton: $startSearching)
                            }
                        }
                    }
                })
            }
        }
    }
}

#Preview {
    MarvelCharactersListView()
}
