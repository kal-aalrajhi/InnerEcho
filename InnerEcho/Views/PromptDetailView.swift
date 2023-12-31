//
//  PromptDetailView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/27/23.
//

import SwiftUI

struct PromptDetailView: View {
    let selectedPrompt: Prompt
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Id: \(selectedPrompt.id)")
                    .font(.largeTitle)
                    .bold()
                
                Image(selectedPrompt.url)
                    .promptImage()
                
                VStack(alignment: .leading) {
                    PromptText(title: selectedPrompt.title,
                               question: selectedPrompt.question)
                    
                    Text(selectedPrompt.userResponse)
                        .font(.body)
                        .padding([.leading, .bottom, .trailing])
                }
            }
        }
    }
}

struct PromptDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PromptDetailView(selectedPrompt: MockPrompt.sampleSavedPrompts[0])
    }
}
