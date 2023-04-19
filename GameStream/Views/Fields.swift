//
//  Fields.swift
//  GameStream
//
//  Created by David Perez on 4/18/23.
//

import SwiftUI

struct EmailField : View {
	@State var correo: String = ""
	
	var body : some View {
		InputForm(textBinding: $correo, label: "Email*", placeholder: "example@gmail.com")
	}
}

struct PasswordField : View {
	@State var password: String = ""
	
	var body : some View {
		InputForm(textBinding: $password, label: "Password*", placeholder: "******")
	}
}

struct ConfirmPasswordField : View {
	@State var confirmPassword: String = ""
	
	var body : some View {
		InputForm(textBinding: $confirmPassword, label: "Confirm Password*", placeholder: "******")
	}
}

struct DividerField : View {
	var body: some View {
		Divider()
			.frame(height: 1)
			.background(Color("darkCyan"))
			.padding(.bottom)
	}
}

struct InputForm: View {
	@Binding var textBinding: String
	
	var label: String
	var placeholder: String
	var isSecureTextField: Bool = false
	var bottomSpace: CGFloat?
	
	var body: some View {
		VStack(alignment: .leading) {
			Text(label)
				.foregroundColor(Color("darkCyan"))
				.fontWeight(.bold)
			
			ZStack(alignment: .leading) {
				if textBinding.isEmpty {
					Text(placeholder)
						.foregroundColor(.gray)
						.padding(.bottom, 1)
				}
				
				if isSecureTextField {
					SecureField("", text: $textBinding)
						.font(.body)
						.foregroundColor(.white)
				
				} else {
					TextField("", text: $textBinding)
						.font(.body)
						.foregroundColor(.white)
				}
			}
			DividerField()
		}
	}
}
