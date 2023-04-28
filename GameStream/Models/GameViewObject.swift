//
//  GameViewObject.swift
//  GameStream
//
//  Created by David Perez on 4/27/23.
//

import Foundation

struct GameViewObject: Hashable {
	let url: String
	let title: String
	let studio: String
	let contentRaiting: String
	let publicationYear: String
	let description: String
	let tags: [String]
	let galleryImages: [String]
	
	init(game: Game) {
		url = game.videosUrls.mobile
		title = game.title
		studio = game.studio
		contentRaiting = game.contentRaiting
		publicationYear = game.publicationYear
		description = game.description
		tags = game.tags
		galleryImages = game.galleryImages
	}
}
