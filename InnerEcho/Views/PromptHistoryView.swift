//
//  PromptHistoryView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/24/23.
//

import SwiftUI

struct PromptHistoryView: View {
    @EnvironmentObject var promptData: PromptData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(promptData.savedPrompts) { prompt in
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
        PromptHistoryView().environmentObject(PromptData())
    }
}
