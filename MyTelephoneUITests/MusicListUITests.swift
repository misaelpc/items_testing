//
//  MusicListUITests.swift
//  MyTelephoneUITests
//
//  Created by Misael Pérez Chamorro on 4/19/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import XCTest
@testable import MyTelephone

class MusicListUITests: XCTestCase {
  
  var musicViewController: MusicViewController!
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    XCUIApplication().launch()
    
    
    let app = XCUIApplication()
    let nameTextField = app.textFields["username"]
    let passwordTextField = app.textFields["password"]
    let loginButton = app.buttons["loginButton"]

    nameTextField.tap()
    nameTextField.typeText("JohnAP")

    passwordTextField.tap()
    passwordTextField.typeText("JohnAP")

    loginButton.tap()
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testMusicList() {
    //XCUIApplication()/*@START_MENU_TOKEN@*/.tables["MusicTableView"]/*[[".otherElements[\"musicView\"]",".tables[\"Dancing Queen, ABBA, Take a Chance On Me, ABBA, Waterloo, ABBA, Mamma Mia, ABBA, S.O.S., ABBA, Fernando, ABBA, Knowing Me, Knowing You, ABBA, The Winner Takes It All, ABBA, Chiquitita, ABBA, I Have a Dream, ABBA\"]",".tables[\"MusicTableView\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.cells["Waterloo, ABBA"].children(matching: .other).element(boundBy: 0).tap()
    
    let app = XCUIApplication()
    print(app.debugDescription)
    let table = app.tables["MusicTableView"]
    let label = app.staticTexts["Music"]
    print(label)
    print(table)
    XCTAssertTrue(table.exists)
    print(table)
    table.tap()
    let cell = table.cells.element(boundBy: 2)
    waitForElementToAppear(cell)
    
    
//
//    let cell = table.cells.element(boundBy: 2)
//    XCTAssertTrue(cell.exists)
//    let indexedText = cell.staticTexts.element
//    XCTAssertTrue(indexedText.exists)
  }
  
  func waitForElementToAppear(_ element: XCUIElement) {
    let existsPredicate = NSPredicate(format: "exists == true")
    expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
    waitForExpectations(timeout: 20, handler: nil)
  }
}




