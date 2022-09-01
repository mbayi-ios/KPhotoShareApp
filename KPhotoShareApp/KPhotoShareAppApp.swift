//
//  KPhotoShareAppApp.swift
//  KPhotoShareApp
//
//  Created by Amby on 01/09/2022.
//

import SwiftUI

@main
struct KPhotoShareAppApp: App {
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environmentObject(vm)

        }
    }
}
