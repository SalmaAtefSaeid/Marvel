//
//  ExitButton.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import SwiftUI

struct ExitButton: View {
    var body: some View {
        HStack {
            Image(systemName: "multiply")
                .frame(width: 44, height: 44)
                .foregroundColor(.white)
                .font(.title2)
        }
    }
}

#Preview {
    ExitButton()
}
