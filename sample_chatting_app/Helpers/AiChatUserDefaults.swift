//
//  AiChatUserDefaults.swift
//  sample_chatting_app
//
//  Created by Ratnakar on 20/04/24.
//

import Foundation

class AiChatUserDefaults: NSObject {
    
    static let USER_EMAIL = "UserEmail"
    static let USER_NAME = "UserName"
    static let DEVICE_TOKEN = "DeviceToken"
    static let USER_UID = "UserUid"
    
    static func getShareUserDefaults() -> UserDefaults {
        return UserDefaults()
    }
    
    static func setDeviceToken(token: String) {
        getShareUserDefaults().set(token, forKey: DEVICE_TOKEN)
        getShareUserDefaults().synchronize()
    }
    
    static func getDeviceToken() -> String {
        return getShareUserDefaults().string(forKey: DEVICE_TOKEN) ?? ""
    }
    
    static func setUserUid(uid: String) {
        getShareUserDefaults().set(uid, forKey: USER_UID)
        getShareUserDefaults().synchronize()
    }
    
    static func getUserUid() -> String {
        return getShareUserDefaults().string(forKey: USER_UID) ?? ""
    }
    
    static func setUserName(name: String) {
        getShareUserDefaults().set(name, forKey: USER_NAME)
        getShareUserDefaults().synchronize()
    }
    
    static func getUserName() -> String {
        return getShareUserDefaults().string(forKey: USER_NAME) ?? ""
    }
    
    static func setUserEmail(email: String) {
        getShareUserDefaults().set(email, forKey: USER_EMAIL)
        getShareUserDefaults().synchronize()
    }
    
    static func getUserEmail() -> String {
        return getShareUserDefaults().string(forKey: USER_EMAIL) ?? ""
    }
    
}
