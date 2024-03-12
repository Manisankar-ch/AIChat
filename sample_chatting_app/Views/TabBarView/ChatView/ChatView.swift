//
//  ChatView.swift
//  sample_chatting_app
//
//  Created by Mani on 02/03/24.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.splashScreenGradient
            HStack() {
                Image(.searchBarIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                Spacer()
                Text("Home")
                    .font(.title)
                    .padding(.top, 10)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top, 10)
                    .frame(width: 40, height: 40)

            
               
               
            }
            .frame(width: .infinity, height: 50, alignment: .top)
            
        }
        
    }
}

#Preview {
    ChatView()
}
