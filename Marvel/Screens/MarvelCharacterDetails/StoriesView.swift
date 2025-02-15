//
//  StoriesView.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import SwiftUI

struct StoriesView: View {
    
    let stories: [Story]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("STORIES")
                .foregroundColor(.red)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
                    ForEach(stories) { story in
                        VStack(alignment: .center) {
                            RemoteWebImage(urlString: story.thumbnail.fullURL)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 150)
                                .clipped()
                            
                            Text(story.name)
                                .font(.caption)
                                .lineLimit(3)
                                .frame(width: 100) // To limit text width to the image width
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}
