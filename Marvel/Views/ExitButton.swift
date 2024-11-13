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
                .foregroundColor(Color(.label))
                .font(.title)
        }
    }
}

#Preview {
    ExitButton()
}
