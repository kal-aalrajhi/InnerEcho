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
                    NavigationLink(destination: PromptDetailView(selectedPrompt: prompt)) {
                        LazyVStack(alignment: .leading, spacing: 10) {
                            Text(prompt.title)
                                .font(.headline)
                            Text("Id: \(prompt.id)")
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    delete(indexSet: indexSet)
                })
            }
            .navigationTitle("History")
        }
    }
    
    private func delete(indexSet: IndexSet) {
        promptData.savedPrompts.remove(atOffsets: indexSet)
        print(promptData.savedPrompts)
    }
}

struct PromptHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        PromptHistoryView().environmentObject(PromptData())
    }
}
