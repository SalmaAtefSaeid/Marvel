//
//  ComicsView.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import SwiftUI

struct ComicsView: View {
    
    let comics: [Comic]
    @Binding var showPopUpImageView: Bool
    @Binding var selectedImages: [ThumbnailImage]?
    @Binding var selectedName: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("COMICS")
                .foregroundColor(.red)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 15) {
                    ForEach(comics) { comic in
                        VStack {
                            RemoteWebImage(urlString: comic.thumbnail.fullURL)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 150)
                                .clipped()
                            
                            Text(comic.name)
                                .font(.caption)
                                .lineLimit(3)
                                .frame(width: 100) // To limit text width to the image width
                        }
                        .onTapGesture {
                            selectedImages = comic.images
                            selectedName = comic.name
                            showPopUpImageView = true
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding()
    }
}
