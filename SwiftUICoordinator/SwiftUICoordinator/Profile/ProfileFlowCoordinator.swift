//
//  ProfileFlowCoordinator.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import SwiftUI
import Combine

final class ProfileFlowCoordinator: ObservableObject {
    @Published var profilePage: ProfilePage
    
    private let id: UUID
    private var cancellable = Set<AnyCancellable>()
    
    let pushCoordinator = PassthroughSubject<ProfileFlowCoordinator, Never>()
    
    // MARK: - init
    init(profilePage: ProfilePage) {
        id = UUID()
        self.profilePage = profilePage
    }
    
    @ViewBuilder
    func build() -> some View {
        switch profilePage {
        case .mainProfile:
            mainProfileView()
        case .educationalProfile:
            educationalProfileView()
        case .personalProfile:
            personalProfileView()
        }
    }
}

// MARK: - Private section
extension ProfileFlowCoordinator {
    private func mainProfileView() -> some View {
       let mainProfile = MainProfileView()
        bind(view: mainProfile)
        return mainProfile
    }
    
    private func personalProfileView() -> some View {
        PersonalProfileView()
    }
    
    private func educationalProfileView() -> some View {
        EducationalProfileView()
    }
    
    private func bind(view: MainProfileView) {
        view
            .didSelectPerosnalProfile
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.navigateToPersonalProfile()
            }
            .store(in: &cancellable)
        
        view
            .didSelectEducationalProfile
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.navigateToEducationalProfile()
            }
            .store(in: &cancellable)
    }
}

// MARK: - Hashable
extension ProfileFlowCoordinator: Hashable {
    static func == (lhs: ProfileFlowCoordinator, rhs: ProfileFlowCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Navigation
extension ProfileFlowCoordinator {
    private func navigateToPersonalProfile() {
        pushCoordinator.send(ProfileFlowCoordinator(profilePage: .personalProfile))
    }
    
    private func navigateToEducationalProfile() {
        pushCoordinator.send(ProfileFlowCoordinator(profilePage: .educationalProfile))
    }
}
