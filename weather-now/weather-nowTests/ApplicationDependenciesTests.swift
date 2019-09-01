//
//  ApplicationDependenciesTests.swift
//  weather-nowTests
//
//  Created by Vitalii Kuznetsov on 01/09/2019.
//  Copyright © 2019 Vitalii Kuznetsov. All rights reserved.
//

import Foundation
import XCTest

class ApplicationDependenciesTests: XCTestCase {
    
    func testConfigurationAttributes(){
        let url = Bundle.main.object(forInfoDictionaryKey: "DARK_SKY_BASE_URL") as? String
        XCTAssertNotNil(url, "Dark Sky domain api base url is not provided")
        XCTAssert(!(url?.isEmpty ?? true), "Dark Sky domain api base url is empty")
        let token = Bundle.main.object(forInfoDictionaryKey: "DARK_SKY_API_TOKEN") as? String
        XCTAssertNotNil(token, "Dark Sky domain api token is not provided")
        XCTAssert(!(token?.isEmpty ?? true), "Dark Sky domain api token is empty")
    }
}
