//
//  DownloadData.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/21/23.
//
// View Model

import Foundation
import Combine

class DownloadData: ObservableObject {
    @Published var prompts: [Prompt] = []
    var cancellables = Set<AnyCancellable>()
    
    
}
