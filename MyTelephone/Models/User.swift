//
//  User.swift
//  MyTelephone
//
//  Created by Misael Pérez Chamorro on 4/16/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import Foundation

class User {
  static let userName = "JohnAP"
  static let password = "VerySecurePassword"
  
  static func login(userName: String, password: String) -> Bool {
    if self.userName == userName {
      Session.sharedInstance.saveSession()
      return true
    }
    return false
  }
  
  static func fetchSongs() throws {
    guard let token = Session.sharedInstance.token else {
      throw UserError.notSessionAvailable
    }
    debugPrint(token)
  }
}
