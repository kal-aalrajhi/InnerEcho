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
        NavigationView {
            VStack {
                
                AsyncImage(url: URL(string: promptData.currentPrompt.url)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .promptImage()
                
                
                PromptText(title: promptData.currentPrompt.title,
                           question: promptData.currentPrompt.question)
                
                Button {
                    showingPromptResponse.toggle()
                } label: {
                    Text("respond".uppercased())
                        .ButtonLabelStyle()
                }
                .fullScreenCover(isPresented: $showingPromptResponse) {
                    PromptResponseView()
                }
            }
            .toolbar {
                Button {
                    // To next prompt
                    promptData.randomPrompt()
                } label: {
                    Image(systemName: "arrow.forward.circle")
                }
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
