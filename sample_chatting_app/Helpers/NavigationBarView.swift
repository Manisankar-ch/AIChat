//
//  NavigationBarView.swift
//  sample_chatting_app
//
//  Created by Ratnakar on 12/03/24.
//

import Foundation
import SwiftUI

struct NavigationBarView: View {
    var leftImage: String
    var title: String
    var rightImage: String
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 24)
            ZStack {
                GlassView(corners: 20, height: 40, width: 40)
                Image(leftImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            Spacer()
            Text("Home")
                .font(.custom("poppins", size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Spacer()
            Image(rightImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Spacer()
                .frame(width: 24)
        }
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
    }
}
