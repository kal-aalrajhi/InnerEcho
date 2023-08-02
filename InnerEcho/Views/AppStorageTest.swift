//
//  AppStorageTest.swift
//  InnerEcho
//
//  Created by Dr Cpt Blackbeard on 7/28/23.
//

import SwiftUI

/// @AppStorage approach
struct AppStorageTest: View {
    
    @AppStorage("name") var currentUserName: String?
    
    
    var body: some View {
        VStack(spacing: 20) {
            if let name = currentUserName {
                Text(name)
            }
            
            Button("SAVE") {
                let name = "Bagels"
                currentUserName = name
            }
        }
    }
}

/// UserDefaults approach
//struct AppStorageTest: View {
//
//    @State var currentUserName: String?
//
//    var body: some View {
//        VStack(spacing: 20) {
//            if let name = currentUserName {
//                Text(name)
//            }
//
//            Button("SAVE") {
//                let name = "Joe"
//                currentUserName = name
//                // Saving key-value (value = name, key = "name") to UserDefaults table
//                UserDefaults.standard.setValue(name, forKey: "name")
//            }
//        }
//        .onAppear {
//            // Fetching from UserDefaults table
//            currentUserName = UserDefaults.standard.string(forKey: "name")
//        }
//    }
//}

struct AppStorageTest_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageTest()
    }
}
