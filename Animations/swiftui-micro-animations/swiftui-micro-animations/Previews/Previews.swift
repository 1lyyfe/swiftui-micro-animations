//
//  Previews.swift
//  swiftui-micro-animations
//
//  Created by Haider Ashfaq on 19/04/2025.
//

import Foundation
import SwiftUI

struct PulseButtonScreen: View {
    var body: some View {
        VStack {
            PulseButton {
                print("Button tapped!")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .navigationTitle("Pulse Button")
    }
}

struct CardFlipScreen: View {
    var body: some View {
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
        .navigationTitle("Card Flip")
    }
}

struct HeartBeatScreen: View {
    var body: some View {
        VStack {
            heartbeatView {
                Image(systemName: "heart.fill")
                    .font(.system(size: 64))
                    .foregroundColor(.pink)
            }
        }
        .padding()
        .navigationTitle("Heart Beat")
    }
}

struct DotBounceLoadingWaveScreen: View {
    var body: some View {
        DotBounceLoadingWave()
    }
}

struct BarSlideLoadingWaveScreen: View {
    var body: some View {
        BarSlideLoadingWave(barCount: 6, color: .orange)
    }
}

struct BarFadeLoadingWaveScreen: View {
    var body: some View {
        BarFadeLoadingWave(barCount: 4, size: 10, color: .purple, speed: 0.3)
    }
}

