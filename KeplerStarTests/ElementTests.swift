//
//  ElementTests.swift
//  KeplerStarTests
//
//  Created by Alonso del Arte on 5/20/24.
//

import XCTest

final class ElementTests: XCTestCase {
    
    func testFireSigns() {
        let expected: [StarSign] = [.aries, .leo, .saggitarius]
        let actual = Element.fire.signs()
        XCTAssertEqual(expected, actual)
    }
    
}
