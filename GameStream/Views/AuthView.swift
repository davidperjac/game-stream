//
//  AuthView.swift
//  GameStream
//
//  Created by David Perez on 4/19/23.
//

import SwiftUI

enum SESSION {
	case LOGIN
	case SIGNUP
}

struct AuthView: View {
	
	@Binding var isHomeActive : Bool
	
    var body: some View {
		ZStack {
			Spacer()
			Color("marin")
				.ignoresSafeArea()
			VStack {
				Image("AppLogo")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 250)
					.padding(.bottom, 40)
				SessionView(isHomeActive: $isHomeActive)
			}
		}
    }
}

struct SessionView : View {
	@State var session : SESSION = .LOGIN
	
	@Binding var isHomeActive : Bool
	
	var body: some View {
		VStack {
			SessionButtons(session: $session)
			Spacer(minLength: 30)
			switch session {
				case .LOGIN:
					LoginView(isHomeActive: $isHomeActive)
				case .SIGNUP:
					SignupView()
			}
		}
	}
}

struct LoginView : View {
	
	@Binding var isHomeActive : Bool
	
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				EmailField()
				PasswordField()
				ForgotPassword()
				SubmitButton(title: "LOGIN", action: {isHomeActive = true})
					.navigationDestination(isPresented: $isHomeActive, destination: {HomeView()})
				SocialNetworks()
			}.padding(.horizontal, 36)
		}
	}
}

struct SignupView : View {
	var body: some View {
		
		ScrollView {
			VStack(alignment: .center) {
				
				Text("Pick a profile picture")
					.fontWeight(.bold)
					.foregroundColor(.white)
				
				Text("You can change or pick it later")
					.font(.footnote)
					.foregroundColor(.gray)
					.fontWeight(.light)
					.padding(.top, 1)
				
				Button(action: takePhoto, label: {
					ZStack {
						Image("profilePic")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 100, height: 100)
							.padding(.bottom, 10)
						
						Image(systemName: "camera")
							.foregroundColor(.white)
							
					}
				})
				
				EmailField()
				PasswordField()
				ConfirmPasswordField()
				SubmitButton(title: "SIGNUP", action: {print("SIGNUP!!")})
				SocialNetworks()
				
				
			}
		}.padding(.horizontal, 36)
		
	}
}

struct SessionButtons : View {
	
	@Binding var session: SESSION
	
	var body : some View {
		HStack {
			Button("LOGIN", action: {session = .LOGIN})
				.foregroundColor(session == .LOGIN ? .white : .gray)
				.fontWeight(.bold)
				.padding(.trailing, 100)
			Button("SIGNUP", action: {session = .SIGNUP})
				.foregroundColor(session == .SIGNUP ? .white : .gray)
				.fontWeight(.bold)
		}
	}
}

struct SocialNetworks : View {
	var body: some View {
		VStack {
			Text("Try with social networks")
				.foregroundColor(.white)
				.frame(maxWidth: .infinity, alignment: .center)
				.padding(.top, 30)
			
			HStack {
				Button("Facebook", action: {print("Login with Facebook")})
					.frame(width: 80, height: 10)
					.padding()
					.background(Color("blueGray"))
					.cornerRadius(8.0)
					.foregroundColor(.white)
					.fontWeight(.bold)
					.padding(.trailing, 10)

				Button("Twitter", action: {print("Login with Twitter")})
					.frame(width: 80, height: 10)
					.padding()
					.background(Color("blueGray"))
					.cornerRadius(8.0)
					.foregroundColor(.white)
					.fontWeight(.bold)
			}
			.frame(maxWidth: .infinity, alignment: .center)
			.padding(.horizontal)
		}
	}
}

struct ForgotPassword : View {
	var body: some View {
		Text("Forgot your password?")
			.foregroundColor(Color("darkCyan"))
			.font(.footnote)
			.frame(width: 320, alignment: .trailing)
			.padding(.bottom)
	}
}

struct SubmitButton : View {
	
	var title: String
	var action : () -> Void
	
	var body: some View {
		Button(action: action, label: {
			Text(title)
				.fontWeight(.bold)
				.foregroundColor(.white)
				.frame(maxWidth: .infinity, alignment: .center)
				.padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
				.overlay(
					RoundedRectangle(cornerRadius: 6.0)
						.stroke(Color("darkCyan"), lineWidth: 1.5)
						.shadow(color: .white, radius: 6)
				)
		})
		.padding(.top)
	}
}

func login() {
	print("Logging in!!")
}

func takePhoto() {
	print("Taking photo!!")
}

