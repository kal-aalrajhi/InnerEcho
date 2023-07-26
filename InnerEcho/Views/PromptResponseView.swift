//
//  PromptResponse.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/24/23.
//

import SwiftUI

struct PromptResponseView: View {
    @ObservedObject var promptData: PromptData
    @Environment(\.dismiss) var dismiss
    
    @State private var text = "respond here."
    @State private var savedText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text(MockPrompt.samplePrompt.title)
                    .font(.largeTitle)
                    .bold()
                
                TextEditor(text: $text)
                    .font(.body)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                    .padding(10)
                
                Button {
                    savedText = text
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
        PromptResponseView(promptData: PromptData())
    }
}
