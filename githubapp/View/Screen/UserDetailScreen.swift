//
//  UserDetailScreen.swift
//  githubapp
//
//  Created by AlbertStanley on 17/10/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserDetailScreen: View {
    @ObservedObject var userDetailVM: UserDetailViewModel
    var body: some View {
        VStack {
            HStack {
                WebImage(url: URL(string:userDetailVM.getUserData().avatar_url))
                    .resizable()
                    .indicator(.activity)
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(20)
                VStack(alignment: .leading) {
                    Text(userDetailVM.getUserData().name ?? "dummy placholder")
                        .redacted(reason: userDetailVM.isLoading ?.placeholder : .init())
                    HStack(spacing: 10){
                        VStack {
                            Text("\(userDetailVM.getUserData().following ?? 1200)") .redacted(reason: userDetailVM.isLoading ?.placeholder : .init())
                            Text("Following")
                        }
                        Spacer()
                        VStack {
                            Text("\(userDetailVM.getUserData().followers ?? 1200)") .redacted(reason: userDetailVM.isLoading ?.placeholder : .init())
                            Text("Followers")
                        }
                        Spacer()
                    }.padding(.top, 8)
                }.padding()
            }
            TopTabBar(index: $userDetailVM.tabIndex)
            TabView(selection: $userDetailVM.tabIndex) {
                ScrollView {
                    ForEach(userDetailVM.repoList, id: \.id){
                        repo in RepoCell(repo: repo)
                    }
                    Spacer()
                }.tag(0).onAppear {
                    userDetailVM.requestRepoListData()
                }
                VStack {
                    ScrollView {
                        ForEach(userDetailVM.followersList, id: \.id){
                            follower in FollowerCell(user: follower)
                        }
                        Spacer()
                    }.tag(0).onAppear {
                        userDetailVM.requestFollowersData()
                    }
                }.tag(1)
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }.navigationBarTitle(userDetailVM.getUserData().login
                             , displayMode: .inline)
    }
}

//struct UserDetailScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailScreen()
//    }
//}
