//
//  DescriptionView.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import SwiftUI

struct DescriptionView: View {
    
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("DESCRIPTION")
                .foregroundColor(.red)
            Text(description)
        }
        .frame(width: UIScreen.main.bounds.width - 20, alignment: .leading)
        .padding()
    }
}

#Preview {
    DescriptionView(description: "description")
}
