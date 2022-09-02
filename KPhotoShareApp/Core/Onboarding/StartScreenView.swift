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
            RadialGradient(gradient: Gradient(colors: [Color(.red), (.purple)]),
                           center: .topLeading,
                           startRadius: 5,
                           endRadius: UIScreen.main.bounds.height)
                .ignoresSafeArea()

            if currentUserSignedIn {
                BottomTabView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            } else {
                OnboardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
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
