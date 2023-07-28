//
//  PromptText.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/28/23.
//

import SwiftUI

struct PromptText: View {
    let title: String
    let question: String
    
    var body: some View {
        HStack{
            Text(title) + Text(" \(question)").foregroundColor(.red)
        }
        .font(.largeTitle)
        .bold()
    }
}

struct PromptText_Previews: PreviewProvider {
    static var previews: some View {
        PromptText(title: MockPrompt.samplePrompt.title,
                   question: MockPrompt.samplePrompt.question)
    }
}
