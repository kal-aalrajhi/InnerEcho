//
//  ImageExtensions.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/28/23.
//
import SwiftUI

extension Image {
    func promptImage() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 350)
            .cornerRadius(6)
    }
}

