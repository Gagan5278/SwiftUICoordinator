//
//  UserPage.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import Foundation

enum UserPage: String, Identifiable {
    case users
    case profile
    
    var id: String {
        self.rawValue
    }
}
