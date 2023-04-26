//
//  GameViewModel.swift
//  GameStream
//
//  Created by David Perez on 4/25/23.
//

import Foundation

class GameViewModel : ObservableObject {
	
	@Published var gamesInfo = [Game]()
	

//	func fetchGames() async {
//		do {
//			let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games")!
//
//			let (data, _) = try await URLSession.shared.data(from: url)
//
//			let decoded = try JSONDecoder().decode([Game].self, from: data)
//
//			self.gamesInfo.append(contentsOf: decoded)
//		} catch {
//			print("SOME ERROR OCURRED")
//		}
//	}

	
	init() {
		let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games")!
		var request = URLRequest(url: url)
		request.httpMethod = "GET"

		// 2.
		URLSession.shared.dataTask(with: request) {(data, response, error) in
			do {
				if let jsonData = data {
					// 3.
					print("tamañoJSON: \(jsonData)")
					let decodedData = try JSONDecoder().decode([Game].self, from: jsonData)
					print("JSONDecodificado: \(decodedData)")
					DispatchQueue.main.async() {
						self.gamesInfo.append(contentsOf: decodedData)
						print(self.gamesInfo)
					}
				} else {
						print("No existen datos en el json recuperado")
				}
			} catch {
				print("Error: \(error)")
			}
		}.resume()
	}
}
