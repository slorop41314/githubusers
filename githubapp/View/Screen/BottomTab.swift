//
//  BottomTab.swift
//  githubapp
//
//  Created by AlbertStanley on 17/10/20.
//

import SwiftUI

struct BottomTab: View {
    var body: some View {
        TabView {
            HomeScreen().tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            
//            FavoriteScreen().tabItem {
//                Image(systemName: "star.fill")
//                Text("Favorite")
//            }
        }
    }
}

struct BottomTab_Previews: PreviewProvider {
    static var previews: some View {
        BottomTab()
    }
}
