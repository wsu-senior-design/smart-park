//
//  pinview.swift
//  smart-park
//
//  Created by Tuan Nguyen on 3/2/22.
//

import SwiftUI

struct pinview: View {
    var title: String
    @State var clicked = false
    @State private var action: Int? = 0
    
    var body: some View {
        if !clicked {
            return AnyView(
                Button(action: {
                    clicked = true
                }) {
                    Image(systemName: "paperplane")
                        .font(.system(size: 20.0))
                        .foregroundColor(.red)
                }
            )
        } else {
            return AnyView (
                VStack {
                    NavigationLink(destination: test(), tag: 1, selection: $action) {
                        EmptyView()
                    }
                    Text(title)
                        .frame(width: 140, height: 40)
                        .padding()
                        .font(.system(size: 20.0))
                        .background(Color.white)
                        .border(Color.red, width: 2)
                        .onTapGesture {
                            self.action = 1
                        }
                }
            )
        }
    }
}
