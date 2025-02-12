//
//  UIView+Ext.swift
//  LinearRectangleExample
//
//  Created by Christian Grinling on 12/02/2025.
//

import SwiftUI

public extension View {
    func shimmerEffect(
        isActive: Bool,
        speed: CGFloat = 1,
        colors: [Color] = [],
        cornerRadius: CGFloat = 5
    ) -> some View {
        modifier(
            ShimmerModifier(
                isActive: isActive,
                speed: speed,
                colors: colors,
                cornerRadius: cornerRadius
            )
        )
    }
}
