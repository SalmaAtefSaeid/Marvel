//
//  NoCharactersView.swift
//  Marvel
//
//  Created by Salma Atef on 13/11/2024.
//

import SwiftUI

struct NoCharactersView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "binoculars")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .center)
            Text("No Characters found")
                .foregroundColor(Color(.label))
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    NoCharactersView()
}
