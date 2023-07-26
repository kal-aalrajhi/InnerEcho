//
//  PromptView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/24/23.
//

import SwiftUI

struct PromptView: View {
    
    @State private var showingPromptResponse = false
    
    var body: some View {
        VStack {
            Image(MockPrompt.samplePrompt.url)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 350)
                .cornerRadius(6)
            
            Text(MockPrompt.samplePrompt.title)
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
    }
}
