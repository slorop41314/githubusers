//
//  TopTabBar.swift
//  githubapp
//
//  Created by AlbertStanley on 18/10/20.
//

import SwiftUI

struct TopTabBar: View {
    @Binding var index: Int
    var body: some View {
        VStack {
            Divider()
            HStack {
                Image(systemName: "filemenu.and.selection").foregroundColor(index == 0 ? Color("black") : Color("grey"))
                    .padding(6)
                    .frame(maxWidth: .infinity)
                    .onTapGesture(count: 1, perform: {
                        withAnimation {
                            self.index = 0
                        }
                    })
                Image(systemName: "person.crop.circle.fill.badge.checkmark").foregroundColor(index == 1 ? Color("black") : Color("grey"))
                    .padding(6)
                    .frame(maxWidth: .infinity)
                    .onTapGesture(count: 1, perform: {
                        withAnimation {
                            self.index = 1
                        }
                    })
            }
            Divider()
        }.background(Color("white"))
    }}

//struct TopTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TopTabBar(index :)
//    }
//}
