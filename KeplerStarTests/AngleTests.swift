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

}
