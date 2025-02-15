//
//  EventsView.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import SwiftUI

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
                            RemoteWebImage(urlString: event.thumbnail.fullURL)
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


