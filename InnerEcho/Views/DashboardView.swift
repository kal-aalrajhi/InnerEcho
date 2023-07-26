//
//  ContentView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/21/23.
//
import SwiftUI

struct DashboardView: View {
    // Storing the source of truth (this is our VM)
    @StateObject var promptDataVM = PromptData()
    
    var body: some View {
        TabView {
            PromptView(promptData: promptDataVM)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            PromptHistoryView(promptData: promptDataVM)
                .tabItem {
                    Image(systemName: "book")
                    Text("History")
                }
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
