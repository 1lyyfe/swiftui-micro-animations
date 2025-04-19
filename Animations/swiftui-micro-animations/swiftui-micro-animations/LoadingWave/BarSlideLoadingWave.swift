//
//  BarSlideLoadingWave.swift
//  swiftui-micro-animations
//
//  Created by Haider Ashfaq on 19/04/2025.
//
//  A sliding bar loading animation, like audio visualizers or sync indicators.
//

import SwiftUI

/// A SwiftUI loading animation with vertical bars that slide up and down in a wave.
///
/// - Parameters:
///   - barCount: Number of animated bars (default: 5)
///   - size: Base size used for width/height scaling (default: 12)
///   - color: Color of the bars (default: .accentColor)
///   - speed: Animation speed (default: 0.4 seconds)
///
/// Example usage:
/// ```swift
/// BarSlideLoadingWave()
/// BarSlideLoadingWave(barCount: 6, color: .orange)
/// ```
struct BarSlideLoadingWave: View {
    var barCount: Int = 5
    var size: CGFloat = 12
    var color: Color = .accentColor
    var speed: Double = 0.4

    @State private var animate = false

    var body: some View {
        HStack(spacing: size / 1.5) {
            ForEach(0..<barCount, id: \.self) { index in
                Capsule()
                    .fill(color)
                    .frame(width: size * 0.4, height: size * 2)
                    .offset(y: animate ? -size / 2 : size / 2)
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
    BarSlideLoadingWave(barCount: 6, color: .orange)
}
