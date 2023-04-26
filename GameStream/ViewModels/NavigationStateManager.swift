//
//  NavigationStateManager.swift
//  GameStream
//
//  Created by David Perez on 4/26/23.
//

import Foundation

class NavigationStateManager : ObservableObject {
	@Published var selectionPath = [Route]()
}
