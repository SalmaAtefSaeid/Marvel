//
//  EventsView.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventsView: View {
    
    let events: [Event]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("EVENTS")
                .foregroundColor(.red)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 15) {
                    ForEach(events) { event in
                        VStack(alignment: .center) {
                            WebImage(url: URL(string: event.thumbnail.fullURL))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 150)
                                .clipped()
                            
                            Text(event.name)
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


