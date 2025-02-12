//
//  ShimmerModifier.swift
//  LinearRectangleExample
//
//  Created by Christian Grinling on 12/02/2025.
//

import SwiftUI

struct ShimmerModifier: ViewModifier {
    private var isActive: Bool
    private var speed: CGFloat
    private var colors: [Color] = []
    private var cornerRadius: CGFloat
    
    init(
        isActive: Bool,
        speed: CGFloat,
        colors: [Color],
        cornerRadius: CGFloat
    ) {
        self.isActive = isActive
        self.speed = speed
        self.cornerRadius = cornerRadius
        if !colors.isEmpty {
            self.colors = colors
        }
    }
    
    func body(content: Content) -> some View {
        if isActive {
            content
                .overlay {
                    ShimmerView(
                        speed: speed,
                        colors: colors
                    )
                    .cornerRadius(cornerRadius)
                }
        }
    }
}
