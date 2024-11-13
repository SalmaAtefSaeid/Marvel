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
        ZStack {
            VStack {
                Spacer()
                ImagesListScrollView(images: images, name: name)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    showPopUpView = false
                }) {
                    ExitButton()
                }
            }
        }
    }
}

