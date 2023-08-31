//
//  UserDetailView.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import SwiftUI

struct UserDetailView: View {
    @StateObject var userProfileDetailViewModel: UserProfileDetailViewModel
    var body: some View {
        VStack {
            if let profile = userProfileDetailViewModel.profile {
                Text(profile.name)
                Divider()
                Text("\(profile.age)")
                Divider()
                Text(profile.occupation)
                Divider()
            } else {
                ProgressView()
            }
        }
        .padding(.horizontal)
        .navigationTitle("Profile")
        .onAppear {
            userProfileDetailViewModel.fetchUserProfileDetail()
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userProfileDetailViewModel: UserProfileDetailViewModel(userID: 1))
    }
}
