//
//  PromptDetailView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/27/23.
//

import SwiftUI

struct PromptDetailView: View {
    @EnvironmentObject var promptData: PromptData
    // No longer current prompt, we need the prompt we clicked into
    var body: some View {
        VStack {
            Text("Prompt ID: ")
            
            Image(promptData.currentPrompt.url)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 350)
                .cornerRadius(6)
            
            Text(promptData.currentPrompt.title)
                .font(.largeTitle)
                .bold()
            
            Text(promptData.currentPrompt.userResponse)
                .font(.largeTitle)
                .bold()
        }
    }
}

struct PromptDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PromptDetailView()
            .environmentObject(PromptData())
    }
}
