//
//  UserList.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import Foundation

/*
 Here Codable protocol open a way to implement server request logic.
 */
struct User: Identifiable, Codable {
    let id: Int
    let name: String
    
    static let dummyUser: [User] = [
        User(id: 1, name: "David"),
        User(id: 1, name: "Bianca"),
        User(id: 1, name: "Mark"),
    ]
}
