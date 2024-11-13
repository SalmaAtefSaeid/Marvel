//
//  SplashView.swift
//  Marvel
//
//  Created by Salma Atef on 13/11/2024.
//

import SwiftUI

struct SplashView: View {
    
    @State private var scale: CGFloat = 1.0
    @State var isActive:Bool = false
    
    var body: some View {
        HStack {
            if self.isActive {
                MarvelCharactersListView()
            } else {
                Image("Marvel_Logo")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width*0.7, height: 100)
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(scale)
            }
        }
        .onAppear {
            let baseAnimation = Animation.easeInOut(duration: 1.0)
            let repeated = baseAnimation.repeatForever(autoreverses: true)
            withAnimation(repeated) {
                scale = 1.5
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.isActive = true
            }
        }
    }
}

#Preview {
    SplashView()
}
