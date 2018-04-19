//
//  TestExtension.swift
//  MyTelephoneUITests
//
//  Created by Misael Pérez Chamorro on 4/18/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//
import XCTest

extension XCUIApplication {
  var isDisplayingMusic: Bool {
    return otherElements["MusicTableView"].exists
  }
}
