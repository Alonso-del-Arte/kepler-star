//
//  StarSignTests.swift
//  KeplerStarTests
//
//  Created by Alonso del Arte on 3/21/24.
//

import XCTest

final class StarSignTests: XCTestCase {

    func testSymbol() {
        for sign in StarSign.allCases {
            let expected: Character = switch (sign) {
            case .aries: "\u{2648}"
            case .taurus: "\u{2649}"
            case .gemini: "\u{264a}"
            case .cancer: "\u{264b}"
            case .leo: "\u{264c}"
            case .virgo: "\u{264d}"
            case .libra: "\u{264e}"
            case .scorpio: "\u{264f}"
            case .saggitarius: "\u{2650}"
            case .capricorn: "\u{2651}"
            case .aquarius: "\u{2652}"
            case .pisces: "\u{2653}"
            }
            let actual = sign.rawValue
            XCTAssertEqual(expected, actual)
        }
    }
    
    func testMinimumDegree() {
        let signs: [StarSign] = StarSign.allCases
        let interval: Int16 = 30
        for j in 0 ... 11 {
            let sign = signs[j]
            let expected = Angle(degrees: interval * Int16(j))
            let actual = sign.minimumDegree()
            let msg = "Start for \(sign.description()) should be \(expected)"
            XCTAssertEqual(expected, actual, msg)
        }
    }
    
    func testDescription() {
        for sign in StarSign.allCases {
            let expected = "\(sign)".capitalized
            let actual = sign.description()
            XCTAssertEqual(expected, actual)
        }
    }
    
}
