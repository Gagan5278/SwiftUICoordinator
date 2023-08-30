//
//  UserFlowCoordinator.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import SwiftUI
import Combine

final class UserFlowCoordinator {
    @Published var page: UserPage
    let pushCoordinator = PassthroughSubject<UserFlowCoordinator, Never>()
    
    private var id: UUID
    private var userID: Int?
    private var cancellable = Set<AnyCancellable>()
    
    init(page: UserPage, userID: Int? = nil) {
        self.page = page
        id = UUID()
        self.userID = userID
    }
}

extension UserFlowCoordinator {
    @ViewBuilder
    func build() -> some View {
        switch page {
        case .profile:
             userListView()
        case .users:
            userProfileDetailView()
        }
    }
    
    private func userListView() -> some View {
        let viewModel = UserListViewModel()
        let userListView = UserListView(userListViewModel: viewModel)
        bind(view: userListView)
        return userListView
    }
    
    private func userProfileDetailView() -> some View {
        guard let userID = userID else {
            fatalError("User ID does not exist")
        }
        let viewModel = UserProfileDetailViewModel(userID: userID)
        let userProfileView = UserDetailView(userProfileDetailViewModel: viewModel)
        return userProfileView
    }
    
    
    private func bind(view: UserListView) {
        view
            .didSelectUser
            .receive(on: DispatchQueue.main)
            .sink {[weak self] user in
                self?.showUserProfileFor(user: user)
            }
            .store(in: &cancellable)
    }
}

// MARK: - Navigation
extension UserFlowCoordinator {
    private func showUserProfileFor(user: User) {
        pushCoordinator.send(UserFlowCoordinator(page: .profile, userID: userID))
    }
}

// MARK: - Hashable
extension UserFlowCoordinator: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: UserFlowCoordinator, rhs: UserFlowCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
}

