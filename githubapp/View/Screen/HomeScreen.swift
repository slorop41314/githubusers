//
//  HomeScreen.swift
//  githubapp
//
//  Created by AlbertStanley on 17/10/20.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var homeViewModel = HomeViewModel()
    let columns = [GridItem(.flexible(), spacing: 10),GridItem(.flexible(), spacing: 10)]
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns:columns, spacing:20) {
                    ForEach(homeViewModel.getUserList(), id: \.id) {
                        user in
                        UserCell(user: user)
                    }
                }.padding()
                Spacer()
            }
            .navigationBarTitle("Home")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
