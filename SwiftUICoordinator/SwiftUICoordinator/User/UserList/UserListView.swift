//
//  UserListView.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import SwiftUI
import Combine

struct UserListView: View {
    @StateObject var userListViewModel: UserListViewModel
    let didSelectUser = PassthroughSubject<User, Never>()
    
    var body: some View {
        
        NavigationView {
            List(userListViewModel.users) { user in
                Button {
                    didSelectUser.send(user)
                } label: {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .onAppear {
                userListViewModel.fetchUsers()
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(userListViewModel: UserListViewModel())
    }
}
