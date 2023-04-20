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
					.padding(.bottom, 40)
				
				HStack {
					Image(systemName: "magnifyingglass")
						.foregroundColor(.white)
					TextField(text: $searchText, label: {
						Text("Search a video")
							.font(.caption)
							.foregroundColor(.white)
					})
					.font(.caption)
					.foregroundColor(.white)
				}
				
			}
			.padding(.horizontal, 18)
			
			
//			HStack {
//				Button(action: {}, label: {
//					Image(systemName: "magnigyingglass"
//
//					)
//				})
//			}
			
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
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

