//
//  FollowerCell.swift
//  githubapp
//
//  Created by AlbertStanley on 24/10/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct FollowerCell: View {
    let user: User
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: UserDetailScreen(userDetailVM: UserDetailViewModel(user: user)) ){
                HStack {
                    WebImage(url: URL(string:user.avatar_url))
                        .resizable()
                        .indicator(.activity)
                        .frame(width:60,height: 60, alignment: .center)
                        .cornerRadius(20)
                    VStack {
                        Text(user.login
                        )
                    }
                }
            }
            Divider()
        }
    }
}

//struct FollowerCell_Previews: PreviewProvider {
//    static var previews: some View {
//        FollowerCell()
//    }
//}
