//
//  ButtonLabel.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 8/2/23.
//

import SwiftUI

struct ButtonLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .padding(20)
            .frame(width: 250)
            .background(.blue)
            .cornerRadius(10)
    }
}

extension View {
    func ButtonLabelStyle() -> some View {
        modifier(ButtonLabel())
    }
}
