//
//  AppCoordinator.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import SwiftUI
import Combine

final class AppCoordinator: ObservableObject {

    @Published var path: NavigationPath
    
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - init
    init(path: NavigationPath) {
        self.path = path
    }
    
    @ViewBuilder
    func build() -> some View {
        homeView()
    }
        
}

// MARK: - Private Section
extension AppCoordinator {
    
    private func homeView() -> HomeView {
        let homeView = HomeView()
        bind(view: homeView)
        return homeView
    }
    
    private func push<T: Hashable>(_ coordinator: T) {
        path.append(coordinator)
    }
    
    private func bind(view: HomeView) {
        view.didSelectMenuItem
            .receive(on: DispatchQueue.main)
            .sink { [weak self] item in
                switch item {
                case .users:
                    self?.userFlow()
                case .profile:
                    self?.profileFlow()
                case .settings:
                    self?.settingFlow()
                }
            }
            .store(in: &cancellable)
    }
    
    private func userFlow() {
      let userFlowCoordinator = UserFlowCoordinator(page: .users)
      bind(userCoordinator: userFlowCoordinator)
      push(userFlowCoordinator)
    }
    
    private func profileFlow() {
      let profileCoordinator = ProfileFlowCoordinator(profilePage: .mainProfile)
      bind(profileCoordinator: profileCoordinator)
      push(profileCoordinator)
    }
        
    private func settingFlow() {
      let settingCoordinator = SettingsFlowCoordinator(page: .main)
      bind(settingCoordinator: settingCoordinator)
      push(settingCoordinator)
    }
    
}

// MARK: - Flow Coordinator Bindings
extension AppCoordinator {
    
    private func bind(userCoordinator: UserFlowCoordinator) {
        userCoordinator
            .pushCoordinator
            .receive(on: DispatchQueue.main)
            .sink { [weak self] coordinator in
                self?.push(coordinator)
            }
            .store(in: &cancellable)
    }
    
    private func bind(profileCoordinator: ProfileFlowCoordinator) {
        profileCoordinator
            .pushCoordinator
            .receive(on: DispatchQueue.main)
            .sink { [weak self] coordinator in
                self?.push(coordinator)
            }
            .store(in: &cancellable)
    }
    
    private func bind(settingCoordinator: SettingsFlowCoordinator) {
        settingCoordinator
            .pushCoordinator
            .receive(on: DispatchQueue.main)
            .sink { [weak self] coordinator in
                self?.push(coordinator)
            }
            .store(in: &cancellable)
    }
}
