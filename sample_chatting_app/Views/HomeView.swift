//
//  HomeView.swift
//  sample_chatting_app
//
//  Created by Ratnakar on 29/02/24.
//

import Foundation
import SwiftUI


struct HomeView: View {
    @State var search: String = ""
    var body: some View {
        ZStack {
            VStack {
               
                HStack {
                    Image(systemName: "magnifyingglass.circle.fill")
                    TextField("EnterText", text: $search)
                    Image(systemName: "person.circle")
                }
                .padding()
                .frame(height: 50)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0...25, id: \.self) { item in
                            Image(systemName: "person.circle.fill")
                                .font(.title)
                        }
                    }
                }
                .padding()
                
                ScrollView(.vertical) {
                    VStack {
                        ForEach(0...25, id: \.self) { item in
                            HStack(alignment: .center) {
                                Image(systemName: "person.circle.fill")
                                    .font(.title)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Text("Name")
                                    .font(.title)
                                   .frame(maxWidth: .infinity,alignment: .leading)
                                
                                VStack {
                                    Text("time")
                                    Text("msg status")
                                }
                                
                            }
                            .frame(height: 50)
                            .padding()
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    HomeView()
}
