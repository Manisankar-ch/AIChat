//
//  SingUp.swift
//  sample_chatting_app
//
//  Created by Mani on 06/04/24.
//

import Foundation


struct SignUp {
    let uid: String
    let email: String
    let fullName: String
    // Add more properties as needed
    
    init(uid: String, email: String, fullName: String) {
        self.uid = uid
        self.email = email
        self.fullName = fullName
    }
}
