//
//  GameView.swift
//  GameStream
//
//  Created by David Perez on 4/27/23.
//

import SwiftUI

struct GameView: View {
	
	var game: GameViewObject?
	
	var body: some View {
		Text("View for a single game")
	}
}

struct GameView_Previews: PreviewProvider {
	static var previews: some View {
		GamesView()
	}
}
