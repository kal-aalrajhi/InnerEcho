//
//  FavoritesView.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/24/23.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationView {
            Text("Favorites")
                .navigationTitle("Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
