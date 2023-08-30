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
            .sink { item in
                switch item {
                case .users:
                    break
                case .profile:
                    break
                case .settings:
                    break
                }
            }
            .store(in: &cancellable)
    }
}
