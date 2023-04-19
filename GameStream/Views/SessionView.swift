//
//  SessionView.swift
//  GameStream
//
//  Created by David Perez on 4/18/23.
//

import SwiftUI

enum SESSION {
	case LOGIN
	case SIGNUP
}

struct SessionView : View {
	@State var session : SESSION = .LOGIN
	
	var body: some View {
		VStack {
			SessionButtons(session: $session)
			Spacer(minLength: 30)
			switch session {
				case .LOGIN:
					LoginView()
				case .SIGNUP:
					SignupView()
			}
		}
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


