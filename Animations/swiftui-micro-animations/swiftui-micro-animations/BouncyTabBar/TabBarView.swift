//
//  TabBarView.swift
//  swiftui-micro-animations
//
//  Created by Haider Ashfaq on 19/04/2025.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            if selectedTab == 0 {
                Text("Home View")
            } else {
                Text("Profile View")
            }
            
            Spacer()
            
            HStack {
                BouncyTabBarButton(
                    icon: "house.fill",
                    label: "Home",
                    isSelected: selectedTab == 0
                ) {
                    selectedTab = 0
                }
                
                BouncyTabBarButton(
                    icon: "person.fill",
                    label: "Profile",
                    isSelected: selectedTab == 1
                ) {
                    selectedTab = 1
                }
            }
            .padding(.horizontal)
            .background(Color(.systemGray6))
            .cornerRadius(16)
            .padding()
        }
    }
}
#Preview {
    TabBarView()
}
