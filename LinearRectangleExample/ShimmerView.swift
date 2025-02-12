//
//  ShimmerView.swift
//  LinearRectangleExample
//
//  Created by Christian Grinling on 12/02/2025.
//

import SwiftUI

struct ShimmerView: View {
    @State private var offset: CGFloat = -1.0
    var speed: CGFloat
    var colors: [Color]
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            HStack {
                LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(width: width * 1)
                .mask(
                    PointyRectangle()
                        .frame(width: width, height: proxy.size.height)
                )
            }
            .offset(x: offset * width)
            .onAppear(perform: startAnimation)
        }
    }
    
    private func startAnimation() {
        withAnimation(
            .timingCurve(0, 0, 0.58, 1, duration: speed)
            .repeatForever(autoreverses: false)
        ) {
            offset = 1.5
        }
    }
}

struct PointyRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width - 20, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height / 2))
        path.addLine(to: CGPoint(x: rect.width - 20, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        return path
    }
}
