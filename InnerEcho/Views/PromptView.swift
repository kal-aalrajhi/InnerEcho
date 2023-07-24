//
//  PromptView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/24/23.
//

import SwiftUI

struct PromptView: View {
    @State private var text = "respond here."
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
            
            TextEditor(text: $text)
                .onReceive(text.publisher.collect()) {
                    let filtered = String($0.prefix(200))
                    
                    if filtered != text {
                        text = filtered
                    }
                }
                .font(.system(size: 14))
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding(10)
//                .colorMultiply(.gray)
            
            Button {
                
            } label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(10)
                    .frame(width: 250)
                    .background(.blue)
                    .cornerRadius(10)
            }
            
        }
    }
}

struct PromptView_Previews: PreviewProvider {
    static var previews: some View {
        PromptView()
    }
}
