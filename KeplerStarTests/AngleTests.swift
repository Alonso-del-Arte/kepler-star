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
    
    func testDescription() {
        let deg = Int16.random(in: 0 ... 359)
        let min = UInt8.random(in: 1 ... 59)
        let sec = UInt8.random(in: 1 ... 59)
        let angle = Angle(degrees: deg, minutes: min, seconds: sec)
        let expected = "\(deg)\u{00B0} \(min)' \(sec)\""
        let actual = angle.description()
        XCTAssertEqual(expected, actual)
    }
    
    func testDescriptionOmitsZeroSeconds() {
        let deg = Int16.random(in: 0 ... 359)
        let min = UInt8.random(in: 1 ... 59)
        let angle = Angle(degrees: deg, minutes: min, seconds: 0)
        let expected = "\(deg)\u{00B0} \(min)'"
        let actual = angle.description()
        XCTAssertEqual(expected, actual)
    }
    
    func testDescriptionOmitsZeroMinutesAndZeroSeconds() {
        let deg = Int16.random(in: 0 ... 359)
        let angle = Angle(degrees: deg, minutes: 0, seconds: 0)
        let expected = "\(deg)\u{00B0}"
        let actual = angle.description()
        XCTAssertEqual(expected, actual)
    }
    
    func testDescriptionDoesNotOmitZeroMinutesIfNonZeroSeconds() {
        let deg = Int16.random(in: 0 ... 359)
        let sec = UInt8.random(in: 1 ... 59)
        let angle = Angle(degrees: deg, minutes: 0, seconds: sec)
        let expected = "\(deg)\u{00B0} 0' \(sec)\""
        let actual = angle.description()
        XCTAssertEqual(expected, actual)
    }
    
    func testEquals() {
        let deg = Int16.random(in: 0 ... 359)
        let min = UInt8.random(in: 0 ... 59)
        let sec = UInt8.random(in: 0 ... 59)
        let someAngle = Angle(degrees: deg, minutes: min, seconds: sec)
        let sameAngle = Angle(degrees: deg, minutes: min, seconds: sec)
        XCTAssertEqual(someAngle, sameAngle)
    }
    
    func testNotEqualsDiffDegree() {
        let degA = Int16.random(in: 0 ... 359)
        let min = UInt8.random(in: 0 ... 59)
        let sec = UInt8.random(in: 0 ... 59)
        let angleA = Angle(degrees: degA, minutes: min, seconds: sec)
        var propDegB = Int16.random(in: 0 ... 359)
        if degA == propDegB {
            propDegB += 1
        }
        let degB: Int16 = (propDegB == 360) ? 0 : propDegB
        let angleB = Angle(degrees: degB, minutes: min, seconds: sec)
        XCTAssertNotEqual(angleA, angleB)
    }
    
    private static func chooseDiffMinOrSec(_ n: UInt8) -> UInt8 {
        var proposed = UInt8.random(in: 0 ... 59)
        if proposed == 0 && n == 0 {
            proposed = 59
        }
        if proposed == n {
            proposed -= 1
        }
        return proposed
    }
    
    func testNotEqualsDiffMin() {
        let deg = Int16.random(in: 0 ... 359)
        let minA = UInt8.random(in: 0 ... 59)
        let sec = UInt8.random(in: 0 ... 59)
        let angleA = Angle(degrees: deg, minutes: minA, seconds: sec)
        let minB = AngleTests.chooseDiffMinOrSec(minA)
        let angleB = Angle(degrees: deg, minutes: minB, seconds: sec)
        XCTAssertNotEqual(angleA, angleB)
    }
    
    func testNotEqualsDiffSec() {
        let deg = Int16.random(in: 0 ... 359)
        let min = UInt8.random(in: 0 ... 59)
        let secA = UInt8.random(in: 0 ... 59)
        let angleA = Angle(degrees: deg, minutes: min, seconds: secA)
        let secB = AngleTests.chooseDiffMinOrSec(secA)
        let angleB = Angle(degrees: deg, minutes: min, seconds: secB)
        XCTAssertNotEqual(angleA, angleB)
    }
    
    func testZero() {
        let expected = Angle(degrees: 0, minutes: 0, seconds: 0)
        let actual = Angle.zero
        XCTAssertEqual(expected, actual)
    }
    
    func testPlus() {
        let degA = Int16.random(in: 0 ... 180)
        let minA = UInt8.random(in: 0 ... 30)
        let secA = UInt8.random(in: 0 ... 30)
        let addendA = Angle(degrees: degA, minutes: minA, seconds: secA)
        let degB = Int16.random(in: 0 ... 179)
        let minB = UInt8.random(in: 0 ... 29)
        let secB = UInt8.random(in: 0 ... 29)
        let addendB = Angle(degrees: degB, minutes: minB, seconds: secB)
        let expected = Angle(degrees: degA + degB, minutes: minA + minB,
                             seconds: secA + secB)
        let actual = addendA + addendB
        let message = "\(addendA.description()) + \(addendB.description())"
        XCTAssertEqual(expected, actual, message)
    }

    func testConstructorTurnsNegativeDegreesToRange0To359() {
        let deg = Int16.random(in: -360 ... -1)
        let angle = Angle(degrees: deg)
        let expected = deg + 360
        let actual = angle.getDegrees()
        XCTAssertEqual(expected, actual)
    }

    func testConstructorTurnsExcessiveDegreesToRange0To359() {
        let deg = Int16.random(in: 360 ... 719)
        let angle = Angle(degrees: deg)
        let expected = deg - 360
        let actual = angle.getDegrees()
        XCTAssertEqual(expected, actual)
    }

}
