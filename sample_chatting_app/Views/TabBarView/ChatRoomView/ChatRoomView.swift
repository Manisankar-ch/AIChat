//
//  ChatRoomView.swift
//  sample_chatting_app
//
//  Created by Ratnakar on 14/03/24.
//

import Foundation
import SwiftUI

struct ChatRoomView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var text: String
    @State private var tabBar: UITabBar! = nil
    
    var body: some View {
        NavigationView {
            Text(text)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image(.backIcon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                            .onTapGesture {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                    }
                }
        }
    }
}

#Preview {
    ChatRoomView(text: "")
}
