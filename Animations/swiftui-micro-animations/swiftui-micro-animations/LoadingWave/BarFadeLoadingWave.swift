//
//  BarFadeLoadingWave.swift
//  swiftui-micro-animations
//
//  Created by Haider Ashfaq on 19/04/2025.
//
//  A fading vertical bar loading animation, minimal and modern.
//

import SwiftUI

/// A SwiftUI loading animation using vertical bars that fade in and out in sequence.
///
/// - Parameters:
///   - barCount: Number of fading bars (default: 5)
///   - size: Size base used to determine bar width/height (default: 12)
///   - color: Bar color (default: .accentColor)
///   - speed: Animation speed (default: 0.4 seconds)
///
/// Example usage:
/// ```swift
/// BarFadeLoadingWave()
/// BarFadeLoadingWave(barCount: 4, color: .purple, speed: 0.3)
/// ```
struct BarFadeLoadingWave: View {
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
                    .opacity(animate ? 1 : 0.2)
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
    BarFadeLoadingWave(barCount: 4, size: 10, color: .purple, speed: 0.3)
}
