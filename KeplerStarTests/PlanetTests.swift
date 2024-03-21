//
//  PlanetTests.swift
//  KeplerStar
//
//  Created by Alonso del Arte on 3/21/24.
//

import XCTest

final class PlanetTests: XCTestCase {

    func testSymbol() {
        for planet in Planet.allCases {
            let expected: Character = switch (planet) {
            case .sun: "\u{2609}"
            case .moon: "\u{263e}"
            case .mercury: "\u{263f}"
            case .venus: "\u{2640}"
            case .mars: "\u{2642}"
            case .jupiter: "\u{2643}"
            case .saturn: "\u{2644}"
            case .uranus: "\u{2645}"
            case .neptune: "\u{2646}"
            case .pluto: "\u{2647}"
            }
            let actual = planet.rawValue
            XCTAssertEqual(expected, actual)
        }
    }

}
