//
//  PopUpImagesListView.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct PopUpImagesListView: View {
    
    let images: [ThumbnailImage]
    let name: String
    @Binding var showPopUpView: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.black
                .opacity(0.8)
            
            VStack(alignment: .trailing) {
                Spacer()
                Button(action: {
                    showPopUpView = false
                }) {
                    ExitButton()
                        .frame(width: 30, height: 30)
                }
                .padding(.top, 20)
                .padding(.trailing, 20)
                
                ImagesListScrollView(images: images, name: name)
                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        }
        .edgesIgnoringSafeArea(.all)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

