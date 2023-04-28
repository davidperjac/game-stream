//
//  GameViewModel.swift
//  GameStream
//
//  Created by David Perez on 4/25/23.
//

import Foundation

class GameViewModel : ObservableObject {
	
	@Published var gamesInfo = [Game]()
	
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
