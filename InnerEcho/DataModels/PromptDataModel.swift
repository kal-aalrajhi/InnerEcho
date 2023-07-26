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
    let url: String // full image URL
    let userResponse: String
}

struct MockPrompt {
    static let samplePrompt = Prompt(id: 19,
                                     title: "Some random prompt with filler text. Is this what you were looking for?",
                                     url: "mock-image",
                                     userResponse: "")
}
