//
//  PromptDataModel.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/21/23.
//
// Model

import Foundation

struct Prompt: Identifiable, Codable {
    let id: Int
    let title: String
    let question: String
    let url: String
    var userResponse: String
}

struct MockPrompt {
    static var samplePrompt = Prompt(id: 19,
                                     title: "Some random prompt with filler text. Is this what you were looking for?",
                                     question: "Is this what you were looking for?",
                                     url: "mock-image",
                                     userResponse: "")
    
    static var sampleSavedPrompts = [Prompt(id: 22,
                                            title: "Some KIND random prompt with filler text.",
                                            question: "Is this real life?",
                                            url: "mock-image",
                                            userResponse: "Here is a sample!"),
                                     Prompt(id: 122,
                                            title: "Some RAD random prompt with filler text.",
                                            question: "Do you like to party?",
                                            url: "mock-image",
                                            userResponse: "Oh boy another sample!"),
                                     Prompt(id: 6,
                                            title: "Some COOL random prompt with filler text.",
                                            question: "What is going on?",
                                            url: "mock-image",
                                            userResponse: "More samples pweeze.")
    ]
}
