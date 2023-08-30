//
//  SettingsFlowCoordinator.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import SwiftUI
import Combine

final class SettingsFlowCoordinator {
    @Published var page: SettingPage
    
    private var id: UUID
    private var cancellable = Set<AnyCancellable>()
    
    let pushCoordinator = PassthroughSubject<SettingsFlowCoordinator, Never>()
    // MARK: - init
    init(page: SettingPage) {
        self.page = page
        self.id = UUID()
    }
    
    @ViewBuilder
    func build() -> some View {
        switch page {
        case .main:
            mainSettingView()
        case .privacy:
            privacySettingView()
        case .custom:
            customSettingView()
        }
    }
}

// MARK: - Private section
extension SettingsFlowCoordinator {
    
    private func mainSettingView() -> some View {
        let mainSettingView = MainSettingView()
        bind(view: mainSettingView)
        return mainSettingView
    }
    
    private func privacySettingView() -> some View {
        PrivacySettingView()
    }
    
    private func customSettingView() -> some View {
        CustomSettingView()
    }
    
    private func bind(view: MainSettingView) {
        // Navigate to privacy setting
        view
         .didSelectPrivacySetting
         .receive(on: DispatchQueue.main)
         .sink { [weak self] isNavigate in
             self?.showPrivacySettings()
         }
         .store(in: &cancellable)
        
        // Navigate to custom setting
        view
         .didSelectCustomSetting
         .receive(on: DispatchQueue.main)
         .sink { [weak self] isNavigate in
             self?.showCustomSettingsView()
         }
         .store(in: &cancellable)
    }
}

// MARK: - Navigation
extension SettingsFlowCoordinator {
    private func showPrivacySettings() {
        pushCoordinator.send(SettingsFlowCoordinator(page: .privacy))
    }
    
    private func showCustomSettingsView() {
        pushCoordinator.send(SettingsFlowCoordinator(page: .custom))
    }
}

// MARK: - Hashable
extension SettingsFlowCoordinator: Hashable {
    static func == (lhs: SettingsFlowCoordinator, rhs: SettingsFlowCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
