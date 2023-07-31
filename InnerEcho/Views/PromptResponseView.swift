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
                    saveResponse()
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
    func saveResponse() {
        var promptToSave = promptData.currentPrompt
        
        // Check for duplicate saved response
        if (!promptData.isDuplicateSave(prompt: promptToSave)) {
            // No duplicate found
            promptToSave.userResponse = responseText
            promptData.savedPrompts.append(promptToSave)
        } else {
            // Duplicate found, update response
            if var promptToUpdate = promptData.findSavedPrompt(prompt: promptToSave) {
                promptToUpdate.userResponse = responseText
            } else {
                print("Unable to update prompt user response.")
            }
        }

        dismiss()
    }
}

struct PromptResponse_Previews: PreviewProvider {
    static var previews: some View {
        PromptResponseView().environmentObject(PromptData())
    }
}
