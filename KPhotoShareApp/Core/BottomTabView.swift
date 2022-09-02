//
//  TabView.swift
//  KPhotoShareApp
//
//  Created by Amby on 01/09/2022.
//

import SwiftUI

struct BottomTabView: View {
    @StateObject private var vm = HomeViewModel()
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }

            AccountView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
    }
}

struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTabView()
            .environmentObject(dev.homeVM)
    }
}
