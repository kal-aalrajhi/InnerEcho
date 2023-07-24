//
//  ContentView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/21/23.
//
import SwiftUI

struct DashboardView: View {
    
    @StateObject var vm = DownloadData() // make generic, just works with hardcoded Prompt url and object
    
    var body: some View {
        List {
            ForEach(vm.prompts) { prompt in
                LazyVStack(alignment: .leading, spacing: 10) {
                    Text(prompt.title)
                        .font(.headline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
