//
//  RelatedLinkView.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import SwiftUI

struct RelatedLinkView: View {
    
    let urls: [WebSiteUrl]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("RELATED LINKS")
                .foregroundColor(.red)
            
            ForEach(urls) { url in
                Link(destination: (URL(string: url.url) ?? URL(string: "https://developer.marvel.com")!)) {
                    HStack {
                        Text(url.type.capitalized)
                            .foregroundColor(Color(.label))
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color(.label))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}
