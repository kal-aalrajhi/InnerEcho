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
//        getPrompts()
    }
    
    func getPrompts(from url: URL) {
            checkURL(url).decode(type: [Prompt].self, decoder: JSONDecoder())
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
    
    // Helper function
    private func checkURL(_ url: URL) -> AnyPublisher<Data, Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums") else {
            print("Invalid URL.")
            fatalError("Invalid URL.") // There's no way to recover from this error, so we'll just cause the program to crash.
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background)) // subscribe to publisher on background thread
            .receive(on: DispatchQueue.main) // receive on the main thread
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    print("Response is not the correct type, please make sure it's a valid HTTPURLResponse type")
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .eraseToAnyPublisher()
    }
}
