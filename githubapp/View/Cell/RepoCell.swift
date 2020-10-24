//
//  RepoCell.swift
//  githubapp
//
//  Created by AlbertStanley on 24/10/20.
//

import SwiftUI

struct RepoCell: View {
    let repo: Repository
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(repo.name ?? "").foregroundColor(.blue).fontWeight(.semibold)
            HStack {
                Image(systemName: "highlighter")
                Text(repo.language ?? "")
                Image(systemName: "timer")
                Text(repo.updatedAtString)
            }
            Divider()
        }.padding(.horizontal, 12)
    }
    
}

//struct RepoCell_Previews: PreviewProvider {
//    static var previews: some View {
//        RepoCell()
//    }
//}
