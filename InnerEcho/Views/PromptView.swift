//
//  PromptView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/24/23.
//

import SwiftUI

struct PromptView: View {
    @EnvironmentObject var promptData: PromptData
    @State private var showingPromptResponse = false
    
    var body: some View {
        VStack {
            Image(promptData.currentPrompt.url)
                .promptImage()
            
            Text(promptData.currentPrompt.title)
                .font(.largeTitle)
                .bold()
            
            Button("Response") {
                showingPromptResponse.toggle()
            }
            .fullScreenCover(isPresented: $showingPromptResponse) {
                PromptResponseView()
            }
        }
    }
}

struct PromptView_Previews: PreviewProvider {
    static var previews: some View {
        PromptView()
            .environmentObject(PromptData())
        
    }
}
