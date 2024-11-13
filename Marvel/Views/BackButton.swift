//
//  BackButton.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .foregroundColor(Color(.label))
        }
    }
}

#Preview {
    BackButton()
}
