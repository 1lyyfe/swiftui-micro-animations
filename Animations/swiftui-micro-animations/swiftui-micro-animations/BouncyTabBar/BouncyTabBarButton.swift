//
//  BouncyTabBarButton.swift
//  swiftui-micro-animations
//
//  Created by Haider Ashfaq on 19/04/2025.
//

import SwiftUI

/// A SwiftUI tab bar icon with bounce animation and active state styling.
///
/// - Parameters:
///   - icon: The system image name (SF Symbol).
///   - label: Text label below the icon.
///   - isSelected: Boolean binding for tab selection state.
///   - action: Callback when tapped.
///
/// Example usage:
/// ```swift
/// BouncyTabBarButton(
///     icon: "house.fill",
///     label: "Home",
///     isSelected: $selectedTab == 0
/// ) {
///     selectedTab = 0
/// }
/// ```
struct BouncyTabBarButton: View {
    let icon: String
    let label: String
    let isSelected: Bool
    let action: () -> Void
    
    @State private var bounce = false
    
    var body: some View {
        Button(action: {
            action()
            withAnimation(.interpolatingSpring(stiffness: 200, damping: 15)) {
                bounce.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                bounce = false
            }
        }) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .bold))
                    .scaleEffect(bounce ? 1.3 : 1.0)
                    .foregroundColor(isSelected ? Color.accentColor : .gray)
                    .animation(.easeOut(duration: 0.2), value: bounce)
                
                Text(label)
                    .font(.caption)
                    .foregroundColor(isSelected ? Color.accentColor : .gray)
            }
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    //tap icon to reveal bounce animation
    BouncyTabBarButton(
        icon: "house.fill",
        label: "Home",
        isSelected: true
    ) {
        print("Home Tapped")
    }
}
