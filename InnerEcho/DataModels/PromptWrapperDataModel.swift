//
//  PromptWrapperDataModel.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/26/23.
//

import Foundation
// Swifts codable protocol will set the value to 'nil' when it cannot find the 'userResponse' key in the JSON data. Therefore we must use a property wrapper to get around having a 'nil' value.
struct PromptWrapper: Decodable {
    let id: Int
    let title: String
    let question: String
    let url: String
    
    var toPrompt: Prompt {
        return Prompt(id: id, title: title, question: "", url: url, userResponse: "")
    }
}
