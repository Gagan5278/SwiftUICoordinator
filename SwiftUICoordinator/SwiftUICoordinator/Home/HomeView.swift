//
//  HomeView.swift
//  SwiftUICoordinator
//
//  Created by Gagan Vishal  on 2023/08/30.
//

import SwiftUI
import Combine

struct HomeView: View {
    let didSelectMenuItem = PassthroughSubject<MenuItem, Never>()
    
    @State var menuItems: [MenuItem] = MenuItem.allCases
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menuItems, id: \.self) { item in
                    Button {
                        didSelectMenuItem.send(item)
                    } label: {
                        Text(item.rawValue)
                    }
                }
            }
            .navigationTitle("Coordinator Pattern")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

enum MenuItem: String, CaseIterable {
    case users = "Users"
    case profile = "Profile"
    case settings = "Settings"
}
