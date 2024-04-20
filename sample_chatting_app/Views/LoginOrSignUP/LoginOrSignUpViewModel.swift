//
//  LoginOrSignUpViewModel.swift
//  sample_chatting_app
//
//  Created by Ratnakar on 13/03/24.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

final class LoginOrSignUpViewModel: ObservableObject {
    let db = Firestore.firestore()
    
    func validateCreditinals(email: String, pass: String, completionHandler: @escaping (_ result: Bool, _ errorMessage: String) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: pass) { authResult, error in
            if let error = error {
                completionHandler(false, error.localizedDescription)
                print("Sign-in error:", error.localizedDescription)
            } else if let user = authResult?.user {
                AiChatUserDefaults.setUserUid(uid: user.uid)
                AiChatUserDefaults.setUserEmail(email: email)
                completionHandler(true, "Welcome")
                print("User signed in:", user.uid)
            }
        }
    }
    
    func createNewUser(name: String, email: String, pass: String,confirmPass: String, completionHandler: @escaping (_ result: Bool, _ errorMessage: String) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
            do {
                if let error = error {
                    throw error
                }
                guard let user = authResult?.user else {
                    throw NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "User not found"])
                }
                
                try self.db.collection("users").document(user.uid).setData([
                    "userId": user.uid,
                    "fullName": name,
                    "email": email
                ])
                completionHandler(true, "Signup is successful")
            } catch {
                completionHandler(false, error.localizedDescription)
            }
        }
    }
    
    func validateDetails(email: String, password: String, name: String, confirmPass: String, isLogin: Bool) -> ValidationError {
        if !email.isValidEmail() {
            return .invalidEmail
        } else if !password.isValidPassword() {
            return .invalidPasswordLength
        } else if name.isEmpty, !isLogin {
            return .emptyName
        } else if password != confirmPass, !isLogin {
            return .passwordMismatch
        } else {
            return .none
        }
    }
    
    func loginByFacebook() {
        print("facebook")
    }
    
    func loginByGoogle() {
        
    }
    
    func loginByApple() {
        
    }
}


enum ValidationError {
    case invalidEmail
    case invalidPasswordLength
    case emptyName
    case passwordMismatch
    case none
}
