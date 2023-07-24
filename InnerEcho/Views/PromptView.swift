//
//  PromptView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/24/23.
//

import SwiftUI

struct PromptView: View {
    var body: some View {
        VStack {
            Image(MockPrompt.samplePrompt.url)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: .infinity, height: 350)
                .cornerRadius(6)
            Text(MockPrompt.samplePrompt.title)
        }
    }
}

struct PromptView_Previews: PreviewProvider {
    static var previews: some View {
        PromptView()
    }
}
