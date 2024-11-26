//
//  MarvelCharacterDetailsView.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct MarvelCharacterDetailsView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: MarvelCharacterDetailsViewModel
    @State private var showPopUpImageView: Bool = false
    @State private var selectedImages: [ThumbnailImage]?
    @State private var selectedName: String?
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    WebImage(url: URL(string: viewModel.character.thumbnail.fullURL))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2)
                        .clipped()
                    
                    NameView(name: viewModel.character.name)
                    
                    if viewModel.character.description.isEmpty == false {
                        DescriptionView(description: viewModel.character.description)
                    }
                    
                    if viewModel.comics.isEmpty == false {
                        ComicsView(comics: viewModel.comics, showPopUpImageView: $showPopUpImageView, selectedImages: $selectedImages, selectedName: $selectedName)
                    }
                    
                    if viewModel.stories.isEmpty == false {
                        StoriesView(stories: viewModel.stories)
                    }
                    
                    if viewModel.events.isEmpty == false {
                        EventsView(events: viewModel.events)
                    }
                    
                    if viewModel.character.urls.isEmpty == false {
                        RelatedLinkView(urls: viewModel.character.urls)
                    }
                    
                }
            }
            .fullScreenCover(isPresented: $showPopUpImageView) {
                if let selectedImages = selectedImages, let selectedName = selectedName {
                    PopUpImagesListView(images: selectedImages, name: selectedName, showPopUpView: $showPopUpImageView)
                }
            }
            .ignoresSafeArea(edges: .top)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $viewModel.showError, content: {
                Alert(title: Text(""), message: Text(viewModel.errorMessage), dismissButton: .destructive(Text("OK")))
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        BackButton()
                            .opacity(showPopUpImageView ? 0 : 0.8)
                    }
                }
            }
        }
    }
}
