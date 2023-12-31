//
//  PromptResponse.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/24/23.
//

import SwiftUI

struct PromptResponseView: View {
    @EnvironmentObject var promptData: PromptData
    @Environment(\.dismiss) var dismiss
    
    @State private var responseText = "respond here."
    
    var body: some View {
        NavigationView {
            VStack {
                PromptText(title: promptData.currentPrompt.title,
                           question: promptData.currentPrompt.question)
                
                TextEditor(text: $responseText)
                    .font(.body)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .padding(10)
                Button {
                    promptData.saveResponse(prompt: promptData.currentPrompt, userResponse: responseText)
                    dismiss()
                } label: {
                    Text("save".uppercased())
                        .ButtonLabelStyle()
                }
            }
            .onAppear {
                responseText = promptData.currentPrompt.userResponse
            }
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "x.circle")
                }
            }
        }
    }
}

struct PromptResponse_Previews: PreviewProvider {
    static var previews: some View {
        PromptResponseView().environmentObject(PromptData())
    }
}
