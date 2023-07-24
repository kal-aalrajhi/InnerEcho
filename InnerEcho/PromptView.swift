//
//  PromptView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/24/23.
//

import SwiftUI

struct PromptView: View {
    @StateObject var vm = DownloadData()
    
    var body: some View {
        List {
            ForEach(vm.prompts) { prompt in
                LazyVStack(alignment: .leading, spacing: 10) {
                    Text(prompt.title)
                        .font(.headline)
                }
            }
        }
    }
}

struct PromptView_Previews: PreviewProvider {
    static var previews: some View {
        PromptView()
    }
}
