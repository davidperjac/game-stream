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
	
	@State var url: String = ""
	@State var title: String = ""
	@State var studio: String = ""
	@State var contentRaiting: String = ""
	@State var publicationYear: String = ""
	@State var description: String = ""
	@State var tags: [String] = [""]
	@State var galleryImages: [String] = [""]
	
	let formGrid = [
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	
	var body: some View {
		
		ZStack {
			Color("marin")
				.ignoresSafeArea()
			
			VStack {
				
				Text("GAMES")
					.font(.title2)
					.fontWeight(.bold)
					.foregroundColor(.white)
					.padding(EdgeInsets(top: 16, leading: 0, bottom: 40, trailing: 0))
				
				ScrollView {
					
					LazyVGrid(columns: formGrid, spacing: 8){
						ForEach(allGames.gamesInfo, id: \.self) {game in
							Button(
								action: {
									url = game.videosUrls.mobile
									title = game.title
									studio = game.studio
									contentRaiting = game.contentRaiting
									publicationYear = game.publicationYear
									description = game.description
									tags = game.tags
									galleryImages = game.galleryImages
								},
								label: {
									VStack {
										AsyncImage(
											url: URL(string: game.galleryImages[0]),
											content: { image in
												image.resizable()
													.aspectRatio(contentMode: .fit)
													.frame(maxWidth: 300, maxHeight: 100)
													.clipShape(RoundedRectangle.init(cornerRadius: 4))
												},
											placeholder: {
												Text("\(game.title)")
											}
										)
										Text("\(game.title)")
									}
								}
							)
						}
					}
					
				}
				
			}
			.padding(.horizontal, 6)
		}
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
        HomeView()
    }
}
