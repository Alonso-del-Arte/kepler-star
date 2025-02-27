//
//  ElementTests.swift
//  KeplerStarTests
//
//  Created by Alonso del Arte on 5/20/24.
//

import XCTest

final class ElementTests: XCTestCase {
    
    func testDescription() {
        for element in Element.allCases {
            let expected = "\(element)".capitalized
            let actual = element.description()
            XCTAssertEqual(expected, actual)
        }
    }
    
    func testFireSigns() {
        let expected: [StarSign] = [.aries, .leo, .saggitarius]
        let actual = Element.fire.signs()
        XCTAssertEqual(expected, actual)
    }
    
    func testEarthSigns() {
        let expected: [StarSign] = [.taurus, .virgo, .capricorn]
        let actual = Element.earth.signs()
        XCTAssertEqual(expected, actual)
    }
    
    func testAirSigns() {
        let expected: [StarSign] = [.gemini, .libra, .aquarius]
        let actual = Element.air.signs()
        XCTAssertEqual(expected, actual)
    }
    
    func testWaterSigns() {
        let expected: [StarSign] = [.cancer, .scorpio, .pisces]
        let actual = Element.water.signs()
        XCTAssertEqual(expected, actual)
    }
    
}
