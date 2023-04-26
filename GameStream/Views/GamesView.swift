//
//  GamesView.swift
//  GameStream
//
//  Created by David Perez on 4/25/23.
//

import SwiftUI

struct GamesView: View {
	
	@ObservedObject var allGames = GameViewModel()
	
	@State var gameViewIsActive: Bool = false
	
	var body: some View {
			Text("HELLO FROM GAMES VIEW")
				.navigationBarBackButtonHidden(true)
				.onAppear(
					perform : {
						print("ALL THE GAMES: \(allGames.gamesInfo[0])")
					}
				)
	}
}
struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
