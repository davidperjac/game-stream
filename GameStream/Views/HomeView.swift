//
//  HomeView.swift
//  GameStream
//
//  Created by David Perez on 4/19/23.
//

import SwiftUI
import AVKit

var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"

let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]

struct HomeView: View {

	@State var selectedTab: Int = 2
	@Binding var path: NavigationPath
	
	init (path: Binding<NavigationPath>) {
		_path = path
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
			
			HomeTab(path: $path)
				.toolbarBackground(Color("blueGray"),for: .tabBar)
			
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

	@Binding var path : NavigationPath
	
	var body: some View {
		ZStack {
			Color("marin")
			VStack {
				
				Image("AppLogo")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: 250)
					.padding(.horizontal, 11)
				
				SearchBar()
				
				ScrollView (.vertical, showsIndicators: false) {
					PlayerHome(path: $path)
				}
			}
			.padding(.top, 65)
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
}

struct PlayerHome : View {
	
	@Binding var path: NavigationPath
	
	var body : some View {
		VStack {
			PopularSection(path: $path)
			SuggestedSection(path: $path)
			RecommendedYouSection(path: $path)
			MayLikeSection(path: $path)
		}
		.padding(.bottom, 200)
	}
}

struct PopularSection : View {
	
	@Binding var path: NavigationPath
	
	var body: some View {
		CategoryTitle(title: "MOST POPULAR")
		
		ZStack {
			Button(
				action: {
					path.append(Route.video(urlVideos[0]))
				}, label: {
					VStack(spacing: 0) {
						Image("thewitcher")
							.resizable()
							.scaledToFill()
						Text("The Witcher 3")
							.font(.body)
							.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
							.background(Color("blueGray"))
							.foregroundColor(.white)
					}
				}
			)

			Image(systemName: "play.circle.fill")
				.resizable()
				.foregroundColor(.white)
				.frame(width: 42, height: 42)
		}
		.frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
		.padding(.vertical)
	}
}

struct SuggestedSection : View {
	
	@Binding var path: NavigationPath
	
	var body: some View {
		
		Text("SUGGESTED CATEGORIES")
			.font(.title3)
			.foregroundColor(.white)
			.bold()
			.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
			.padding(.top)
		
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
				Button(action: {}, label: {
					ZStack {
						RoundedRectangle(cornerRadius: 8)
							.fill(Color("blueGray"))
							.frame(width: 160, height: 90)
						Image("FPS")
							.resizable()
							.scaledToFit()
							.frame(width: 42, height: 42)
					}
				})
				
				Button(action: {}, label: {
					ZStack {
						RoundedRectangle(cornerRadius: 8)
							.fill(Color("blueGray"))
							.frame(width: 160, height: 90)
						Image("RPG")
							.resizable()
							.scaledToFit()
							.frame(width: 42, height: 42)
					}
				})
				
				Button(action: {}, label: {
					ZStack {
						RoundedRectangle(cornerRadius: 8)
							.fill(Color("blueGray"))
							.frame(width: 160, height: 90)
						Image("OpenWorld")
							.resizable()
							.scaledToFit()
							.frame(width: 42, height: 42)
					}
				})
			}
		}
	}
}

struct RecommendedYouSection : View {
	
	@Binding var path: NavigationPath
	
	var body : some View {
		Text("RECOMMENDED FOR YOU")
			.font(.title3)
			.foregroundColor(.white)
			.bold()
			.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
			.padding(.top)
		
		
		ScrollView(.horizontal, showsIndicators: false ) {
			
			HStack {
				
				Button(
					action: {
						path.append(Route.video(urlVideos[1]))
					}, label: {
						
						Image("spiderman")
							.resizable()
							.scaledToFit()
							.frame(width: 240, height: 135)
						
					}
				)
				
				Button(
					action: {
						path.append(Route.video(urlVideos[2]))
					}, label: {
						
						Image("lastofus")
							.resizable()
							.scaledToFit()
							.frame(width: 240, height: 135)
						
					}
				)
			}
		}
	}
}

struct MayLikeSection : View {
	
	@Binding var path: NavigationPath
	
	var body : some View {
		Text("YOU MAY LIKE")
			.font(.title3)
			.foregroundColor(.white)
			.bold()
			.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
			.padding(.top)
		
		ScrollView(.horizontal, showsIndicators: false ) {
			
			HStack {
				
				Button(
					action: {
						path.append(Route.video(urlVideos[3]))
					}, label: {
						
						Image("uncharted4")
							.resizable()
							.scaledToFit()
							.frame(width: 240, height: 135)
						
					}
				)
				
				Button(
					action: {
						path.append(Route.video(urlVideos[4]))
					}, label: {
						
						Image("dest")
							.resizable()
							.scaledToFit()
							.frame(width: 140, height: 135)
						
					}
				)
			}
		}
	}
}

struct SearchBar : View {
	
	@State var searchText: String = ""
	
	var body : some View {
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
						.font(.footnote)
						.foregroundColor(.white)
				}
			)
			.font(.footnote)
			.foregroundColor(.white)
		}
		.padding([.top, .leading, .bottom], 11)
		.background(Color("blueGray"))
		.clipShape(Capsule())
	}
	
	func search() {
		print("The user is searching \(searchText)")
	}
}

struct CategoryTitle: View {
	
	var title: String
	
	var body: some View {
		Text(title)
			.font(.title3)
			.foregroundColor(.white)
			.bold()
			.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
			.padding(.top)
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		AuthView()
	}
}

