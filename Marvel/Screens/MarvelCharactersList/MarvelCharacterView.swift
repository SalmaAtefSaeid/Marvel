//
//  MarvelCharacterView.swift
//  Marvel
//
//  Created by Salma Atef on 11/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI

import SwiftUI

struct MarvelCharacterView: View {
    let character: MarvelCharacter
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Background Image
            WebImage(url: URL(string: character.thumbnail.fullURL))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 170)
                .clipped()  // Ensures the image doesn't overflow
            
            // Overlay Text and Parallelogram Background
            ZStack {
                ParallelogramView(width: 150, height: 35, skew: 5)
                    .fill(Color.white)
                
                Text(character.name)
                    .font(.system(size: 15, weight: .heavy))
                    .foregroundColor(.black)
                    .frame(width: 130)
            }
            .frame(width: 150, height: 35)
            .padding(.leading, 20)
            .padding(.bottom, 20)
        }
        .frame(width: UIScreen.main.bounds.width, height: 170)
    }
}


//#Preview {
//    MarvelCharacterView(character: <#MarvelCharacter#>)
//}
