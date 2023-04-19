//
//  LoginView.swift
//  GameStream
//
//  Created by David Perez on 4/18/23.
//

import SwiftUI

struct LoginView : View {
	var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				EmailField()
				PasswordField()
				ForgotPassword()
				NavigationLink(destination: {HomeView()}, label: {
					SubmitButton(title: "LOGIN", action: {print("Logging in!")})
				})
				SocialNetworks()
			}.padding(.horizontal, 36)
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
