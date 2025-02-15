//
//  PopUpImagesListView.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import SwiftUI

struct PopUpImagesListView: View {
    
    let images: [ThumbnailImage]
    let name: String
    @Binding var showPopUpView: Bool
    
    var body: some View {
        ZStack() {
            Color.black
                .opacity(0.8)
            VStack(alignment: .center) {
                ImagesListScrollView(images: images, name: name)
                .overlay(Button {
                    showPopUpView = false
                } label: {
                    ExitButton()
                }, alignment: .topTrailing)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

