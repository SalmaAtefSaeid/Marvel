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
            HStack(spacing: 0) {
                ForEach(Array(images.enumerated()), id: \.offset) { index, image in
                    VStack(alignment: .center, spacing: 0) {
                        WebImage(url: URL(string: image.fullURL))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.7)
                            .clipped()
                            .padding(.bottom)
                        
                        Text(name)
                            .font(.caption)
                            .padding(.bottom)
                            .lineLimit(3)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                        
                        Text("\(index+1) / \(images.count)")
                            .font(.caption)
                            .foregroundColor(.white)
                            .opacity(0.5)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.9)
                }
            }
        }
    }
}
