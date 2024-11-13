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
            if showCancelButton  {
                TextField("search", text: $searchText, onEditingChanged: { isEditing in
                    viewModel.searchForCharacters(searchQuery: searchText)
                }, onCommit: {
                    viewModel.searchForCharacters(searchQuery: searchText)
                }).foregroundColor(.primary)
                
                Button(action: {
                    self.searchText = ""
                    viewModel.loadMoreCharactersIfNeeded(currentCharacter: nil)
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .opacity(searchText == "" ? 0 : 1)
                        .foregroundColor(.red)
                }
                Button("Cancel") {
                    UIApplication.shared.endEditing(true)
                    self.searchText = ""
                    viewModel.loadMoreCharactersIfNeeded(currentCharacter: nil)
                    self.showCancelButton = false
                }
                .foregroundColor(Color(.red))
            } else {
                HStack {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.red)
                }
                .onTapGesture {
                    showCancelButton.toggle()
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            }
            
            
        }
        .padding(.horizontal)
        .navigationBarHidden(showCancelButton)}
}
