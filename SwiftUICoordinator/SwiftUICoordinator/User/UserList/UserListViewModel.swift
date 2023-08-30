//
//  UserListViewModel.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import SwiftUI

class UserListViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    // MARK: - init
    init() {}
    
    func fetchUsers() {
        // Add 1 second delay for dummy server request
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.users = User.dummyUser
        }
    }
}
