//
//  PromptHistoryView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/24/23.
//

import SwiftUI

struct PromptHistoryView: View {
    
    @StateObject var vm = DownloadPromptData()
    
    var body: some View {
        NavigationView {
            List {
                // Only display IF there is a non blank response to it
                ForEach(vm.prompts) { prompt in
                    LazyVStack(alignment: .leading, spacing: 10) {
                        Text(prompt.title)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("History")
        }
    }
}

struct PromptHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        PromptHistoryView()
    }
}
