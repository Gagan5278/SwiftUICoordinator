//
//  UserDetailView.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import SwiftUI

class UserProfileDetailViewModel: ObservableObject {
    @Published var profile: UserProfileDetail!
    
    let userID: Int
    // MARK: - init
    init(userID: Int) {
        self.userID = userID
    }
    
    func fetchUserProfileDetail() {
        profile = UserProfileDetail(id: userID, name: "Bianca", age: 34, occupation: "IT Engineer")
    }
}
