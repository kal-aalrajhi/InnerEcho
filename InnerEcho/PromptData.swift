//
//  DownloadData.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/21/23.
//
// View Model

import Foundation
import Combine

final class PromptData: ObservableObject {
    @Published var prompts: [Prompt] = []
    @Published var savedPrompts: [Prompt] = []
    @Published var currentPrompt: Prompt = MockPrompt.samplePrompt
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPrompts(from: "https://jsonplaceholder.typicode.com/photos")
    }
    
    func getPrompts(from url: String) {
            checkURL(url)
            .decode(type: [PromptWrapper].self, decoder: JSONDecoder())
            .sink { completion in
                print("COMPLETION TYPE: \(completion)")
                
                switch completion {
                case .finished:
                    print("Finished!")
                case .failure(let recievedError):
                    print("Completion error: \(recievedError)")
                }
            } receiveValue: { [weak self] returnedPromptWrappers in
                self?.prompts = returnedPromptWrappers.map { $0.toPrompt }
            }
            .store(in: &cancellables)
    }
    
    // Helper function
    private func checkURL(_ urlStr: String) -> AnyPublisher<Data, Error> {
        guard let url = URL(string: urlStr) else {
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
