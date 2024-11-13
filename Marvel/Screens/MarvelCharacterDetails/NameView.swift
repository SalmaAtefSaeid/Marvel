//
//  NameView.swift
//  Marvel
//
//  Created by Salma Atef on 12/11/2024.
//

import SwiftUI

struct NameView: View {
    
    let name: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("NAME")
                .foregroundColor(.red)
            Text(name)
        }
        .frame(width: UIScreen.main.bounds.width - 20, alignment: .leading)
        .padding()
    }
}

#Preview {
    NameView(name: "name")
}
