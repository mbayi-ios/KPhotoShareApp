//
//  StartScreenView.swift
//  KPhotoShareApp
//
//  Created by Amby on 02/09/2022.
//

import SwiftUI

struct StartScreenView: View {
    @StateObject private var vm = HomeViewModel()
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    var body: some View {
        ZStack {
            if currentUserSignedIn {
                BottomTabView()
            } else {
                OnboardingView()
            }
        }
    }
}

struct StartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        StartScreenView()
            .environmentObject(dev.homeVM)
    }
}
