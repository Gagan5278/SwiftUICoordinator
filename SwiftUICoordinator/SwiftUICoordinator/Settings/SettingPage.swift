//
//  SettingPage.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import Foundation

enum SettingPage: String, Identifiable {
    case main
    case privacy
    case custom
    
    var id: String {
        self.rawValue
    }
}
