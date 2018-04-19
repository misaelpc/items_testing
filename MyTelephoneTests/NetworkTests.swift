//
//  NetworkTests.swift
//  MyTelephoneTests
//
//  Created by Misael Pérez Chamorro on 4/18/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

import XCTest
@testable import MyTelephone

var sessionUnderTest: URLSession!

class NetworkTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    sessionUnderTest = nil
    super.tearDown()
  }
  
  func testSlowValidCallToiTunesGetsHTTPStatusCode200() {
    let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
    let promise = expectation(description: "Status code: 200")
    let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
      if let error = error {
        XCTFail("Error: \(error.localizedDescription)")
        return
      } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
        if statusCode == 200 {
          promise.fulfill()
        } else {
          XCTFail("Status code: \(statusCode)")
        }
      }
    }
    dataTask.resume()
    waitForExpectations(timeout: 5, handler: nil)
  }
  
  
  func testCallToiTunesCompletes() {
    let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
    let promise = expectation(description: "Completion handler invoked")
    var statusCode: Int?
    var responseError: Error?
    
    let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
      statusCode = (response as? HTTPURLResponse)?.statusCode
      responseError = error
      promise.fulfill()
    }
    dataTask.resume()
    waitForExpectations(timeout: 5, handler: nil)
    XCTAssertNil(responseError)
    XCTAssertEqual(statusCode, 200)
  }
}
