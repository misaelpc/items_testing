//
//  MyTelephoneUITests.swift
//  MyTelephoneUITests
//
//  Created by Misael Pérez Chamorro on 4/16/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import XCTest
//@testable import MyTelephone

class MyTelephoneUITests: XCTestCase {
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    XCUIApplication().launch()
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
    
  func testSuccessLogin() {
    let app = XCUIApplication()
    let nameTextField = app.textFields["username"]
    let passwordTextField = app.textFields["password"]
    let loginButton = app.buttons["loginButton"]
    
    nameTextField.tap()
    nameTextField.typeText("JohnAP")
    
    passwordTextField.tap()
    passwordTextField.typeText("JohnAP")
    
    loginButton.tap()
    
    XCTAssertTrue(app.isDisplayingMusic)
  }
  
  func testWrongLogin() {
    let app = XCUIApplication()
    let nameTextField = app.textFields["username"]
    let passwordTextField = app.textFields["password"]
    let loginButton = app.buttons["loginButton"]
    
    nameTextField.tap()
    nameTextField.typeText("User")
    
    passwordTextField.tap()
    passwordTextField.typeText("JohnAP")
    
    loginButton.tap()
    
    XCTAssertFalse(app.isDisplayingMusic)
  }
    
}
