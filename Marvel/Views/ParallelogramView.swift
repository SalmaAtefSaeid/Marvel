//
//  ParallelogramView.swift
//  Marvel
//
//  Created by Salma Atef on 11/11/2024.
//

import SwiftUI

import SwiftUI

struct ParallelogramView: Shape {
    var width: CGFloat
    var height: CGFloat
    var skew: CGFloat  // Skew is used to create the slanted effect

    // Define the path of the parallelogram
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Define points based on the width, height, and skew
        let topLeft = CGPoint(x: rect.minX + skew, y: rect.minY)
        let topRight = CGPoint(x: rect.minX + width + skew, y: rect.minY)
        let bottomLeft = CGPoint(x: rect.minX , y: rect.minY + height)
        let bottomRight = CGPoint(x: rect.minX + width, y: rect.minY + height)

        // Start the path from the top-left corner
        path.move(to: topLeft)
        path.addLine(to: topRight)
        path.addLine(to: bottomRight)
        path.addLine(to: bottomLeft)
        path.closeSubpath()

        return path
    }
}


#Preview {
    ParallelogramView(width: 200, height: 50, skew: 20)
}
