//
//  ContentView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/21/23.
//
import SwiftUI

struct DashboardView: View {
    // Storing the source of truth (this is our VM) | An array of all prompt questions, with blank responses
    // When a user hits 'save' it should be stored long-term into this object
    // The current prompt should be the prompt displayed that the user is meant to answer for the day
    
    // We gotta figure out how to extract a random prompt then display it as the current prompt, i'll need @AppStorage
    // Get it to work without persistence first
    
    var body: some View {
        TabView {
            PromptView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            PromptHistoryView()
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
