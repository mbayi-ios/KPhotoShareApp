//
//  AccountView.swift
//  KPhotoShareApp
//
//  Created by Amby on 01/09/2022.
//

import SwiftUI

struct AccountView: View {
    @AppStorage("name") var currentUserName: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    var body: some View {
        NavigationView {
            List {
                Section(header:
                            HStack {
                    Text(currentUserName ?? "user name")
                        .font(.title)
                    Image(systemName: "info.circle")
                }){
                    HStack {
                        Image(systemName: "questionmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("FAQs")
                            .padding(.leading, 20)
                    }
                    .padding()
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Information")
                            .padding(.leading, 20)

                    }
                    .padding()
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Logout")
                            .padding(.leading, 20)
                    }
                    .padding()
                    .onTapGesture {
                        signOut()
                    }

                }
            }

        }
    }

    func signOut() {
        currentUserName = nil
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
