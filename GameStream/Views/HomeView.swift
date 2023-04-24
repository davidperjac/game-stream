//
//  HomeView.swift
//  GameStream
//
//  Created by David Perez on 4/19/23.
//

import SwiftUI

struct HomeView: View {
	
	@State var selectedTab: Int = 2
	
	init () {
		UITabBar.appearance().backgroundColor = UIColor(Color("tabBarColor"))
		UITabBar.appearance().unselectedItemTintColor = UIColor.gray
		UITabBar.appearance().isTranslucent = true
	}
	
    var body: some View {
		TabView(selection: $selectedTab){
			Text("PROFILE VIEW!!")
				.font(.system(size: 30, weight: .bold))
				.tabItem {
					Image(systemName: "person")
					Text("Profile")
				}
				.toolbarBackground(Color.white, for: .tabBar)
				.tag(0)
			
			Text("GAME VIEW!!")
				.font(.system(size: 30, weight: .bold))
				.tabItem {
					Image(systemName: "gamecontroller")
					Text("Games")
				}
				.toolbarBackground(Color.white, for: .tabBar)
				.tag(1)
			
			HomeTab()
			
			Text("FAV VIEW!!")
				.font(.system(size: 30, weight: .bold))
				.tabItem {
					Image(systemName: "heart")
					Text("Favorites")
				}
				.toolbarBackground(Color.white, for: .tabBar)
				.tag(3)
		}
		.tint(.white)
		.navigationBarBackButtonHidden(true)
    }
}

struct HomeTab : View {
	
	@State var searchText: String = ""
	
	var body: some View {
		ZStack {
			Color("marin")
			VStack {
				Image("AppLogo")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 250)
					.padding(.horizontal, 11)
				
				HStack {
					Button(action: search, label: {
						Image(systemName: "magnifyingglass")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 15.0)
							.foregroundColor(searchText.isEmpty ? Color(.yellow) : Color("darkCyan"))
					})
					TextField(
						text: $searchText,
						label: {
							Text("Search a video")
								.font(.caption)
								.foregroundColor(.white)
						}
					)
					.font(.caption)
					.foregroundColor(.white)
				}
				.padding([.top, .leading, .bottom], 11)
				.background(Color("blueGray"))
				.clipShape(Capsule())
				
			}
			.padding(.horizontal, 36)
		}
		.ignoresSafeArea()
		.font(.system(size: 30, weight: .bold))
		.tabItem {
			Image(systemName: "house")
			Text("Home")
		}
		.toolbarBackground(Color.white, for: .tabBar)
		.tag(2)
	}
	
	func search() {
		print("The user is searching \(searchText)")
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}

