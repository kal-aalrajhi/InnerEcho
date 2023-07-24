//
//  ContentView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/21/23.
//
import SwiftUI

struct DashboardView: View {
    
    var body: some View {
        TabView {
            PromptView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
