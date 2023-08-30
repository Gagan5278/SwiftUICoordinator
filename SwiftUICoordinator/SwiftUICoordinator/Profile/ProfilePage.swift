//
//  ProfilePage.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import Foundation

enum ProfilePage: String, Identifiable {
    case mainProfile
    case educationalProfile
    case personalProfile
    
    var id: String {
        self.rawValue
    }
}
