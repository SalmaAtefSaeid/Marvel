//
//  SearchBarView.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @ObservedObject var viewModel: MarvelCharactersListViewModel
    @Binding var showCancelButton: Bool
    
    var body: some View {
        HStack {
            if showCancelButton {
                TextField(
                    "Search",
                    text: $searchText,
                    onEditingChanged: { _ in
                        viewModel.searchForCharacters(searchQuery: searchText)
                    },
                    onCommit: {
                        viewModel.searchForCharacters(searchQuery: searchText)
                    }
                )
                .foregroundColor(.primary)
                
                if !searchText.isEmpty {
                    Button(action: {
                        clearSearch()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                    }
                }
                
                Button("Cancel") {
                    cancelSearch()
                }
                .foregroundColor(.red)
            } else {
                Spacer()
                Image("Marvel_Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 40)
                    .clipped()
                    .transition(.opacity)
                    .padding(.leading, 30)
                
                Spacer()
                
                Button(action: {
                    showCancelButton.toggle()
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.red)
                }
                .frame(width: 30)
            }
        }
        .frame(width: UIScreen.main.bounds.width*0.9)
    }
    
    private func clearSearch() {
        searchText = ""
        viewModel.loadMoreCharactersIfNeeded(currentCharacter: nil)
    }
    
    private func cancelSearch() {
        UIApplication.shared.endEditing(true)
        searchText = ""
        viewModel.loadMoreCharactersIfNeeded(currentCharacter: nil)
        showCancelButton = false
    }
}


#Preview {
    SearchBarView(searchText: .constant(""), viewModel: MarvelCharactersListViewModel(), showCancelButton: .constant(false))
}
