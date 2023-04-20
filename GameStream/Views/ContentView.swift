//
//  ContentView.swift
//  GameStream
//
//  Created by David Perez on 4/18/23.
//

import SwiftUI
			
struct ContentView: View {
	
	@State var isHomeActive: Bool = false
	
    var body: some View {
		NavigationStack {
			AuthView(isHomeActive: $isHomeActive)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
