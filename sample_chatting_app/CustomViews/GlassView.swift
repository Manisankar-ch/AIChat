//
//  GlassView.swift
//  sample_chatting_app
//
//  Created by Ratnakar on 28/02/24.
//

import Foundation
import SwiftUI

struct GlassView: View {
    
    var corners: CGFloat
    var height: CGFloat
    var width: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: corners)
            .fill(.white)
            .opacity(0.25)
            .shadow(radius: 8)
            .frame(width: width, height: height, alignment: .center)
    }
}
