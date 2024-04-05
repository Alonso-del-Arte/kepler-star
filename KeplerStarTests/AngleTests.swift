//
//  AngleTests.swift
//  KeplerStarTests
//
//  Created by Alonso del Arte on 4/5/24.
//

import XCTest

final class AngleTests: XCTestCase {

    func testGetDegrees() {
        let expected = Int16.random(in: 0 ... 359)
        let angle = Angle(degrees: expected)
        let actual = angle.getDegrees()
        XCTAssertEqual(expected, actual)
    }
    
    func testGetMinutes() {
        let deg = Int16.random(in: 0 ... 359)
        let expected = UInt8.random(in: 0 ... 59)
        let angle = Angle(degrees: deg, minutes: expected)
        let actual = angle.getMinutes()
        XCTAssertEqual(expected, actual)
    }

    func testGetSeconds() {
        let deg = Int16.random(in: 0 ... 359)
        let min = UInt8.random(in: 0 ... 59)
        let expected = UInt8.random(in: 0 ... 59)
        let angle = Angle(degrees: deg, minutes: min, seconds: expected)
        let actual = angle.getSeconds()
        XCTAssertEqual(expected, actual)
    }

}
