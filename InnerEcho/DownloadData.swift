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
    @Published var currentURL: URL
    
    // Used in conjunction with publishers to control when a subscription should be cancelled
    // Creating an empty set of Cancellables - by default publishers return cancellable instances and immediatly cancel subs
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPrompts()
    }
    
    func getPrompts() {
//        getURL()
        
//        URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .background)) // sub to publisher on BG thread
//            .receive(on: DispatchQueue.main) // recieve on the main thread
//            .tryMap { (data, response) -> Data in
//                guard let response = response as? HTTPURLResponse,
//                response.statusCode >= 200 && response.statusCode < 300 else {
//                    print("Response is not the correct type, please make sure it's a valid HTTPURLResponse type")
//                    throw URLError(.badServerResponse)
//                }
//                return data
//            }
            .decode(type: [Prompt].self, decoder: JSONDecoder())
            .sink { completion in
                print("COMPLETION: \(completion)") // returns finished or failure
                
                switch completion {
                case .finished:
                    print("Finished!")
                case .failure(let recievedError):
                    print("Completion error: \(recievedError)")
                }
            } receiveValue: { [weak self] returnedPosts in
                self?.prompts = returnedPosts
            }
            .store(in: &cancellables)
    }
    
    func setURL(from url: URL) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums") else {
            print("Invalid URL.")
            
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background)) // sub to publisher on BG thread
            .receive(on: DispatchQueue.main) // recieve on the main thread
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                    print("Response is not the correct type, please make sure it's a valid HTTPURLResponse type")
                    throw URLError(.badServerResponse)
                }
                return data
            }
        }
    }
}
