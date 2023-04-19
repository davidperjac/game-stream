//
//  ContentView.swift
//  GameStream
//
//  Created by David Perez on 4/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationStack {
			ZStack {
				Spacer()
				Color(red: 19/255, green: 30/255, blue: 53/255)
					.ignoresSafeArea()
				VStack {
					Image("AppLogo")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 250)
						.padding(.bottom, 40)
					SessionView()
				}
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
