//
//  BottomTabBar.swift
//  sample_chatting_app
//
//  Created by Mani on 02/03/24.
//

import SwiftUI

struct BottomTabBar: View {
    var body: some View {
        TabView {
            ChatListView()
                .tabItem {
                    Label("Chat", image: "messageIcon")
                }
            
            Text("Contacts")
                .tabItem {
                    Label("Contacts", image: "contactsIcon")
                }
            
            Text("Settings")
                .tabItem {
                    Label("Settings", image: "settingsIcon")
                }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    BottomTabBar()
}
