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
    // Used in conjunction with publishers to control when a subscription should be cancelled
    // Creating an empty set of Cancellables - by default publishers return cancellable instances and immediatly cancel subs
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPrompts()
    }
    
    func getPrompts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums") else {
            print("Invalid URL.")
            return
        }
        
        
        
    }
    
    
}
