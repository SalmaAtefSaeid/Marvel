//
//  ImagesListScrollView.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImagesListScrollView: View {
    
    let images: [ThumbnailImage]
    let name: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(images) { image in
                    VStack {
                        WebImage(url: URL(string: image.fullURL))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.7)
                            .clipped()
                        Text(name)
                            .font(.caption)
                            .lineLimit(2) // Adjust for long text with ellipsis
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 5)
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.8)
    }
}
