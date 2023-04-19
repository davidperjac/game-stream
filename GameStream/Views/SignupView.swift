//
//  SignupView.swift
//  GameStream
//
//  Created by David Perez on 4/18/23.
//

import SwiftUI

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
						
						Image(systemName: "camara")
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

func takePhoto() {
	print("Taking photo!!")
}
