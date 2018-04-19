//
//  Session.swift
//  MyTelephone
//
//  Created by Misael Pérez Chamorro on 4/16/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import Foundation

class Session {
  var logged = false
  var token: String?
  static let sharedInstance = Session()
  
  func saveSession() {
    logged = true
    token = "04541adc-dabc-46cc-a467-191784d84582"
  }
  
}
