//
//  ContentView.swift
//  swiftui-micro-animations
//
//  Created by Haider Ashfaq on 19/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex = 0
    
    let animationTitles = [
        "Pulse Button",
        "Card Flip",
        "Bouncy Tab Bar",
        "Loading Wave",
        "Heart Beat"
    ]
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Pulse Button", destination: PulseButtonScreen())
                NavigationLink("Card Flip", destination: CardFlipScreen())
                NavigationLink("Bouncy Tab Bar", destination: TabBarView())
                NavigationLink("Loading Wave - Dot Bounce", destination: DotBounceLoadingWaveScreen())
                NavigationLink("Loading Wave - Vertical Bars", destination: BarSlideLoadingWaveScreen())
                NavigationLink("Loading Wave - Fade", destination: BarFadeLoadingWaveScreen())
                
                NavigationLink("Heart Beat", destination: HeartBeatScreen())
            }
            .navigationTitle("🎬 Animation Previews")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    ContentView()
}
