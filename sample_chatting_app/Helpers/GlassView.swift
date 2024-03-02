//
//  GlassView.swift
//  sample_chatting_app
//
//  Created by Ratnakar on 28/02/24.
//

import Foundation
import SwiftUI

struct GlassView: View {
    
    var corners: CGFloat = 0.0
    var height: CGFloat = 0
    
    var body: some View {
        RoundedRectangle(cornerRadius: corners)
            .fill(.white)
            .opacity(0.25)
            .shadow(radius: 8)
            .frame(height: height, alignment: .center)
    }
}
