//
//  DownloadData.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/21/23.
//
// View Model

import Foundation
import Combine

final class PromptData: ObservableObject, Identifiable {
    @Published var prompts: [Prompt] = []
    //    @Published var currentPrompt: Prompt = MockPrompt.samplePrompt
    @Published var currentPrompt: Prompt = MockPrompt.samplePrompt {
        // ENCODE
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(currentPrompt) {
                UserDefaults.standard.set(encoded, forKey: "currentPrompt")
            }
        }
    }
    //    @Published var savedPrompts: [Prompt] = MockPrompt.sampleSavedPrompts
    @Published var savedPrompts: [Prompt] = [] { // using user defaults instead of @AppStorage for more complex types
        // ENCODE
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(savedPrompts) {
                UserDefaults.standard.set(encoded, forKey: "savedPrompts")
            }
        }
    }
    var cancellables = Set<AnyCancellable>()
    
    init() {
        // DECODE current prompt
        if let data = UserDefaults.standard.data(forKey: "currentPrompt") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(Prompt.self, from: data) {
                self.currentPrompt = decoded
            }
            
            // DECODE saved prompts
            if let data = UserDefaults.standard.data(forKey: "savedPrompts") {
                let decoder = JSONDecoder()
                if let decoded = try? decoder.decode([Prompt].self, from: data) {
                    self.savedPrompts = decoded
                }
                
                loadPrompts(from: "https://kal-aalrajhi.github.io/prompts_api/prompts.json")
            }
        }
        
        func loadPrompts(from url: String) {
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
    
    func isDuplicate(prompt: Prompt) -> Bool {
        return savedPrompts.contains(where: { $0.id == prompt.id })
    }
    
    func updateSavedPromptResponse(prompt: Prompt) {
        if let promptToUpdate = findSavedPromptIdx(prompt: prompt) {
            savedPrompts[promptToUpdate].userResponse = prompt.userResponse
        } else {
            print("Unable to update prompt user response.")
        }
    }
    
    private func findSavedPromptIdx(prompt: Prompt) -> Int? {
        guard let promptFound = savedPrompts.firstIndex(where: { $0.id == prompt.id }) else {
            print ("Prompt not found.")
            return nil
        }
        return promptFound
    }
    
    func saveResponse(prompt: Prompt, userResponse: String) {
        var promptCopy = prompt
        promptCopy.userResponse = userResponse
        currentPrompt = promptCopy
        
        // Check for duplicate saved response
        if (isDuplicate(prompt: promptCopy)) {
            updateSavedPromptResponse(prompt: promptCopy)
        } else {
            // Add new prompt to saved prompts
            savedPrompts.append(promptCopy)
        }
    }
    
    func randomPrompt() {
        if let randomPrompt = prompts.randomElement() {
            print("Here is the random prompt: \(randomPrompt)")
            currentPrompt = randomPrompt
        } else {
            print("No more prompts available.")
        }
    }
}
