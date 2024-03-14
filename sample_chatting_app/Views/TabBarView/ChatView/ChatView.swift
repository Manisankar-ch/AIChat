//
//  ChatView.swift
//  sample_chatting_app
//
//  Created by Mani on 02/03/24.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .top) {
                    LinearGradient(colors: [.black, Color("TabBarTopGradient3"), Color("TabBarTopGradient2")], startPoint: .leading, endPoint: .trailing)
                    VStack {
                        NavigationBarView(leftImage: "searchIcon", title: "Home", rightImage: "testUser1")
                        
                        StatusView()
                    }
                }
                .frame(height: 150)
                
                ScrollView(.vertical) {
                    LazyVStack {
                        ForEach(0...20, id: \.self) {_ in
                            HStack {
                                ZStack(alignment: .bottomTrailing) {
                                    Image("testUser1")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 55, height: 55)
                                    Circle()
                                        .fill(.green)
                                        .offset(x: -5, y: -5)
                                        .frame(width: 10, height: 10)
                                }
                                VStack(alignment: .leading) {
                                    Text("Alex Linderson")
                                        .font(.custom("poppins", size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    Text("How are you today?")
                                        .font(.custom("poppins", size: 12))
                                        .foregroundColor(Color("TextColor"))
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Text("3 min ago")
                                        .font(.custom("poppins", size: 12))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color("TextColor"))
                                    ZStack {
                                        Circle()
                                            .fill(Color("NotificationColor"))
                                            .frame(width: 20, height: 20)
                                        
                                        Text("4")
                                            .font(.custom("poppins", size: 12))
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                    
                                }
                                .frame(alignment: .trailing)
                            }
                            .frame(height: 55)
                            
                            Divider()
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                }
                
                Spacer()
            }
        }
    }
}

struct StatusView: View {
    var isUser: Bool = false
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ZStack(alignment: .bottomTrailing) {
                    VStack(alignment: .center) {
                        ZStack {
                            Circle()
                                .fill(.white)
                                .frame(width: 60, height: 60)
                            Circle()
                                .fill(.black)
                                .frame(width: 55, height: 55)
                            
                            Image("testUser1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 45, height: 45)
                        }
                    }
                    ZStack {
                        
                        Circle()
                            .fill(.black)
                            .frame(height: 18)
                        
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 15, height: 15)
                    }
                }
                .padding(.trailing, 10)
                Divider()
                ForEach(0...20, id: \.self) {_ in
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 60, height: 60)
                        Circle()
                            .fill(.black)
                            .frame(width: 55, height: 55)
                        Image("testUser1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 45, height: 45)
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
    }
}


#Preview {
    ChatView()
}
