//
//  HeartBeat.swift
//  swiftui-micro-animations
//
//  Created by Haider Ashfaq on 19/04/2025.
//
//  A rhythmic, pulsing animation that mimics a heartbeat.
//  Great for health apps, love-themed UIs, or status indicators.
//

import SwiftUI

/// A SwiftUI view that simulates a realistic heartbeat animation.
///
/// - Parameters:
///   - isBeating: Controls whether the animation is active
///   - scale: The size of the "thump" expansion (default: 1.3)
///   - speed: Multiplier for heartbeat speed (1.0 = normal)
///
/// Example usage:
/// ```swift
/// HeartBeat(isBeating: true) {
///     Image(systemName: "heart.fill")
///         .font(.system(size: 48))
///         .foregroundColor(.red)
/// }
/// ```
struct HeartBeat<Content: View>: View {
    var isBeating: Bool = true
    var scale: CGFloat = 1.3
    var speed: Double = 1.0
    var content: () -> Content
    
    @State private var scaleFactor: CGFloat = 1.0
    
    var body: some View {
        content()
            .scaleEffect(scaleFactor)
            .task {
                if isBeating {
                    startBeating()
                }
            }
            .onChange(of: isBeating) { active in
                if active {
                    startBeating()
                } else {
                    stopBeating()
                }
            }
    }
    
    private func startBeating() {
        Task {
            while isBeating {
                withAnimation(.easeInOut(duration: 0.1 * speed)) {
                    scaleFactor = scale
                }
                
                try? await Task.sleep(nanoseconds: UInt64(0.12 * speed * 1_000_000_000))
                
                withAnimation(.easeInOut(duration: 0.1 * speed)) {
                    scaleFactor = 1.0
                }
                
                try? await Task.sleep(nanoseconds: UInt64(0.12 * speed * 1_000_000_000))
                
                withAnimation(.easeInOut(duration: 0.08 * speed)) {
                    scaleFactor = scale
                }
                
                try? await Task.sleep(nanoseconds: UInt64(0.08 * speed * 1_000_000_000))
                
                withAnimation(.easeInOut(duration: 0.08 * speed)) {
                    scaleFactor = 1.0
                }
                
                try? await Task.sleep(nanoseconds: UInt64(0.6 * speed * 1_000_000_000))
            }
        }
    }
    
    private func stopBeating() {
        withAnimation(.easeOut(duration: 0.2)) {
            scaleFactor = 1.0
        }
    }
}


/// Returns a constantly beating view without managing `isBeating` state.
func heartbeatView<Content: View>(
    scale: CGFloat = 1.3,
    speed: Double = 1.0,
    @ViewBuilder content: @escaping () -> Content
) -> some View {
    HeartBeat(isBeating: true, scale: scale, speed: speed, content: content)
}


#Preview {
    heartbeatView {
        Image(systemName: "heart.fill")
            .font(.system(size: 64))
            .foregroundColor(.pink)
    }
    
}
