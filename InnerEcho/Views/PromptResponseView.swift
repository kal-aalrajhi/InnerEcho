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
                Text(promptData.currentPrompt.title)
                    .font(.largeTitle)
                    .bold()
                
                TextEditor(text: $responseText)
                    .font(.body)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .padding(10)
                
                Button {
                    promptData.currentPrompt.userResponse = responseText
                    promptData.savedPrompts.append(promptData.currentPrompt)

                    dismiss()
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(20)
                        .frame(width: 250)
                        .background(.blue)
                        .cornerRadius(10)
                }
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
        PromptResponseView()
    }
}
