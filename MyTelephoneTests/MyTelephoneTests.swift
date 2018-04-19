//
//  MyTelephoneTests.swift
//  MyTelephoneTests
//
//  Created by Misael Pérez Chamorro on 4/16/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import XCTest
@testable import MyTelephone

class MyTelephoneTests: XCTestCase {
    
  override func setUp() {
    super.setUp()
    let session = Session.sharedInstance
    session.token = nil
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testCorrectUserLogin() {
    XCTAssertTrue(User.login(userName: "JohnAP", password: "223"))
  }
  
  func testWrongUserLogin() {
    XCTAssertFalse(User.login(userName: "User", password: "223"))
  }
  
  func testSessionNotPresent() {
    let session = Session.sharedInstance
    XCTAssertNil(session.token)
  }
  
  func testSessionPresent() {
    let _ = User.login(userName: "JohnAP", password: "223")
    let session = Session.sharedInstance
    XCTAssertNotNil(session.token)
  }
  
  func testIncorrectLogin() {
    let valid = User.login(userName: "User", password: "223")
    XCTAssertEqual(false, valid)
  }
  
  func testExpectedToken() {
    let _ = User.login(userName: "JohnAP", password: "223")
    let session = Session.sharedInstance
    XCTAssertEqual(session.token!, "04541adc-dabc-46cc-a467-191784d84582", "Token Should Match")
  }
  
  func testGetErrorWhenNoloogedIn() {
    XCTAssertThrowsError(try User.fetchSongs())
  }
  
  func testCorrectLogin() {
    let valid = User.login(userName: "JohnAP", password: "223")
    XCTAssertEqual(true, valid)
    let session = Session.sharedInstance
    XCTAssertEqual(true, session.logged)
  }
  
  
}
