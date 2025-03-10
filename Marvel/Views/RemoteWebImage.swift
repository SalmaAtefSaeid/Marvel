//
//  RemoteWebImage.swift
//  Marvel
//
//  Created by Salma Atef on 15/02/2025.
//

import SwiftUI

@MainActor final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURLImage urlImage: String) {
        Task {
            guard let uiImage = try? await NetworkManager.shared.downloadImage(fromURLString: urlImage) else {
                return
            }
            self.image = Image(uiImage: uiImage)
        }
    }
    
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("NoImageAvailable").resizable()
    }
}


struct RemoteWebImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .task {
                imageLoader.load(fromURLImage: urlString)
            }
    }
}
