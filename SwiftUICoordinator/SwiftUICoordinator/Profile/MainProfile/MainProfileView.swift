//
//  MainProfileView.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import SwiftUI
import Combine

struct MainProfileView: View {
    
    let didSelectPerosnalProfile = PassthroughSubject<Bool, Never>()
    let didSelectEducationalProfile = PassthroughSubject<Bool, Never>()
    
    var body: some View {
        List {
            Button {
                didSelectPerosnalProfile.send(true)
            } label: {
                Text("Main Profile View")
            }
            Button {
                didSelectEducationalProfile.send(true)
            } label: {
                Text("Educational Profile View")
            }
        }
        .navigationTitle("Profile")
    }

}

struct MainProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MainProfileView()
    }
}
