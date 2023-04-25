//
//  Games.swift
//  GameStream
//
//  Created by David Perez on 4/25/23.
//

import Foundation

struct Games: Codable {
	let games:[Game]
}

struct Game: Codable {
	let title, studio, contentRaiting, publicationYear: String
	let description: String
	let platforms, tags: [String]
	let videosUrls: VideosUrls
	let galleryImages: [String]
}


struct VideosUrls: Codable {
	let mobile, tablet: String
}
