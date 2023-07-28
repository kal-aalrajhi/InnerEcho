//
//  PromptDetailView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/27/23.
//

import SwiftUI

struct PromptDetailView: View {
    let selectedPrompt: Prompt
    // No longer current prompt, we need the prompt we clicked into
    var body: some View {
        VStack {
            Text("Prompt ID: ")
            
//            Image(selectedPrompt.url)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(height: 350)
//                .cornerRadius(6)
            
            Text(selectedPrompt.title)
                .font(.largeTitle)
                .bold()
            
            Text("Id: \(selectedPrompt.id)")
                .font(.largeTitle)
                .bold()
        }
        
    }
}

struct PromptDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PromptDetailView(selectedPrompt: MockPrompt.samplePrompt)
    }
}
