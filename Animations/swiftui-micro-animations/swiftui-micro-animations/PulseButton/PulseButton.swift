//
//  PulseButton.swift
//  swiftui-micro-animations
//
//  Created by Haider Ashfaq on 19/04/2025.
//
//  A SwiftUI button with an optional pulsing ring animation.
//  Tap to toggle the pulse animation on/off.
//  Accepts a callback action on tap.
//
//  ✅ Use this for:
//     - Attention-grabbing CTA buttons
//     - Habit or health trackers
//     - Gamified UI elements
//

import SwiftUI

/// A reusable SwiftUI button that toggles a pulse animation on tap.
/// Shows a glowing pulse ring when active.
///
/// Example:
/// ```swift
/// PulseButton {
///     print("Tapped!")
/// }
/// ```
struct PulseButton: View {
    @State private var isPulsing = false
    var action: () -> Void
    var startLabel: String = "Start"
    var stopLabel: String = "Stop"
    
    var body: some View {
        Button(action: {
            isPulsing.toggle()
            action()
        }) {
            Text(isPulsing ? stopLabel : startLabel)
                .font(.subheadline)
                .padding(20)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill(Color.accentColor)
                        .scaleEffect(isPulsing ? 1.5 : 1)
                        .shadow(color: Color.accentColor.opacity(0.4), radius: 10, x: 0, y: 4)
                        .animation(
                            isPulsing
                            ? .easeInOut(duration: 1.0).repeatForever(autoreverses: true)
                            : .default,
                            value: isPulsing
                        )
                )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack {
        PulseButton {
            print("Button tapped!")
        }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color(.systemBackground))
}
