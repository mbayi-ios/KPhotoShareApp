//
//  OnboardingView.swift
//  KPhotoShareApp
//
//  Created by Amby on 02/09/2022.
//

import SwiftUI

struct OnboardingView: View {
    @State var onboardingState: Int = 0

    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing),
                                                removal: .move(edge: .leading))

    @State var name: String = ""

    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    @AppStorage("name") var currentUserName: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    var body: some View {
        ZStack {
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)

                case 1:
                    addNameSection
                        .transition(transition)

                case 2:
                    finishSection
                        .transition(transition)

                default:
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.green)
                }
            }

            VStack {
                Spacer()
                bottomButton
            }
            .padding()
        }
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle))
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


extension OnboardingView {
    private var bottomButton: some View {
        Text(onboardingState == 0 ? "Start" : onboardingState == 2 ? "Finish" : "Next")
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(RadialGradient(gradient: Gradient(colors: [Color(.red), (.purple)]),
                                        center: .topLeading,
                                        startRadius: 5,
                                        endRadius: UIScreen.main.bounds.height))
            .cornerRadius(40)
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    private var welcomeSection: some View {
        ZStack {
            Image("photo-1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay( LinearGradient(gradient:
                                            Gradient(stops: [
                                                .init(color: Color.black.opacity(0.9), location: 0),
                                                .init(color: Color.black.opacity(0.2), location: 1.0)
                                            ]),
                                         startPoint: .bottom,
                                         endPoint: .top
                                        ))
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading) {
                Spacer()
                Text("KPhotoShare")
                    .font(.largeTitle)
                    .fontWeight(.light)
                Divider().background(Color.white).padding(.trailing, 128)
                Text("Finally, it's here: Travelling to space, Travelling to new places. Collect Memories,\n\nkeep all special thoughts in pictures for life to come.")
                    .fontWeight(.light)
                Divider().background(Color.white).padding(.trailing, 128)

            }
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal, 24)
            .padding(.bottom, 64)
        }
    }

    private var addNameSection: some View {
        ZStack {
            Image("photo-2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay( LinearGradient(gradient:
                                            Gradient(stops: [
                                                .init(color: Color.black.opacity(0.9), location: 0),
                                                .init(color: Color.black.opacity(0.2), location: 1.0)
                                            ]),
                                         startPoint: .bottom,
                                         endPoint: .top
                                        ))
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 40) {
                Spacer()
                Text("What's your name?")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                TextField("Your name Here...", text: $name)
                    .font(.headline)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(10)
                Spacer()
                Spacer()
            }
            .padding(30)

            VStack(alignment: .leading) {
                Spacer()
                Text("KPhotoShare")
                    .font(.largeTitle)
                    .fontWeight(.light)
                Divider().background(Color.white).padding(.trailing, 128)
                Text("Enter your name to start using KPhoto")
                    .fontWeight(.light)
                Divider().background(Color.white).padding(.trailing, 128)

            }
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal, 24)
            .padding(.bottom, 64)
        }
    }

    private var finishSection: some View {
        ZStack {
            Image("photo-3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay( LinearGradient(gradient:
                                            Gradient(stops: [
                                                .init(color: Color.black.opacity(0.9), location: 0),
                                                .init(color: Color.black.opacity(0.2), location: 1.0)
                                            ]),
                                         startPoint: .bottom,
                                         endPoint: .top
                                        ))
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading) {
                Spacer()
                Text("KPhotoShare")
                    .font(.largeTitle)
                    .fontWeight(.light)
                Divider().background(Color.white).padding(.trailing, 128)
                Text("Start Exploring our product. You will love it!")
                    .fontWeight(.light)
                Divider().background(Color.white).padding(.trailing, 128)

            }
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal, 24)
            .padding(.bottom, 64)
        }
    }
}


extension OnboardingView {
    func handleNextButtonPressed() {
        switch onboardingState {
        case 1:
            guard name.count >= 3 else {
                showAlert(title: "Your name must be at least 3 characters long!")
                return
            }

        default:
            break
        }

        if onboardingState == 2 {
            withAnimation(.spring()) {
                signIn()
            }
        } else {
            withAnimation(.spring()){
                onboardingState += 1
            }
        }
    }

    func signIn() {
        currentUserName = name
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
    }

    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}
