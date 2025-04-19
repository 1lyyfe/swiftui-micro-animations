//
//  CardFlip.swift
//  swiftui-micro-animations
//
//  Created by Haider Ashfaq on 19/04/2025.
//
//  A reusable 3D-style card that flips between front and back views.
//  Great for flashcards, profiles, product UIs, or interactive previews.
//

import SwiftUI

/// A SwiftUI card that flips horizontally on tap to reveal back content.
///
/// - Parameters:
///   - front: The front view of the card (shown initially).
///   - back: The back view of the card (revealed on tap).
///
/// Example usage:
/// ```swift
/// CardFlip {
///     VStack {
///         Text("Front")
///             .font(.title)
///             .foregroundColor(.white)
///     }
///     .frame(maxWidth: .infinity, maxHeight: .infinity)
///     .background(Color.blue)
///
/// } back: {
///     VStack {
///         Text("Back")
///             .font(.title)
///             .foregroundColor(.white)
///     }
///     .frame(maxWidth: .infinity, maxHeight: .infinity)
///     .background(Color.green)
/// }
/// ```
struct CardFlip<Front: View, Back: View>: View {
    var front: () -> Front
    var back: () -> Back
    
    @State private var flipped = false
    @State private var rotation = 0.0
    
    var body: some View {
        ZStack {
            if flipped {
                back()
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            } else {
                front()
            }
        }
        .frame(width: 200, height: 300)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(radius: 10)
        .rotation3DEffect(.degrees(rotation), axis: (x: 0, y: 1, z: 0))
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.5)) {
                rotation += 180
                flipped.toggle()
            }
        }
    }
}
#Preview {
    VStack {
        CardFlip {
            VStack {
                Text("Front")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue)
            
        } back: {
            VStack {
                Text("Back")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.green)
        }
    }
}
