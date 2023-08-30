//
//  MainSettingView.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import SwiftUI
import Combine

struct MainSettingView: View {
    let didSelectPrivacySetting = PassthroughSubject<Bool, Never>()
    let didSelectCustomSetting = PassthroughSubject<Bool, Never>()

    var body: some View {
        List {
            Button {
                didSelectPrivacySetting.send(true)
            } label: {
                Text("Privacy Settings")
            }
            Button {
                didSelectCustomSetting.send(true)
            } label: {
                Text("Custom Settings")
            }
        }
        .navigationTitle("Settings")
    }
}

struct MainSettingView_Previews: PreviewProvider {
    static var previews: some View {
        MainSettingView()
    }
}
