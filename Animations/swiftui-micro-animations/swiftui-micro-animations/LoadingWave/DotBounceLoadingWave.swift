//
//  DotBounceLoadingWave.swift
//  swiftui-micro-animations
//
//  Created by Haider Ashfaq on 19/04/2025.
//

//  A smooth, looping loading animation using bouncing dots.
//  Ideal for chat apps, loading indicators, and onboarding steps.

import SwiftUI

/// A SwiftUI loading animation that displays bouncing circles in a wave pattern.
///
/// - Parameters:
///   - dotCount: The number of bouncing dots (default: 5)
///   - size: Diameter of each dot (default: 12)
///   - color: The color of the dots (default: .accentColor)
///   - speed: Speed of the bounce animation (default: 0.4 seconds)
///
/// Example usage:
/// ```swift
/// DotBounceLoadingWave()
/// DotBounceLoadingWave(dotCount: 6, color: .blue)
/// ```
struct DotBounceLoadingWave: View {
    var dotCount: Int = 5
    var size: CGFloat = 12
    var color: Color = .accentColor
    var speed: Double = 0.4

    @State private var animate = false

    var body: some View {
        HStack(spacing: size / 1.5) {
            ForEach(0..<dotCount, id: \.self) { index in
                Circle()
                    .fill(color)
                    .frame(width: size, height: size)
                    .scaleEffect(animate ? 1 : 0.5)
                    .animation(
                        .easeInOut(duration: speed)
                            .repeatForever()
                            .delay(Double(index) * speed / 2),
                        value: animate
                    )
            }
        }
        .task {
            animate = true
        }
    }
}

#Preview {
    DotBounceLoadingWave()
}
