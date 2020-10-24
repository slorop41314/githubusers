//
//  UserCell.swift
//  githubapp
//
//  Created by AlbertStanley on 17/10/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserCell: View {
    let user: User
    var body: some View {
        NavigationLink(destination: UserDetailScreen(userDetailVM: UserDetailViewModel(user: user))) {
            VStack {
                WebImage(url: URL(string:user.avatar_url))
                    .resizable()
                    .indicator(.activity)
                    .frame(height: 170, alignment: .center)
                    .cornerRadius(20)
                Text(user.login)
            }
        }
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell(user: User()
//    }
//}
