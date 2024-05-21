//
//  Element.swift
//  KeplerStar
//
//  Created by Alonso del Arte on 5/20/24.
//

import Foundation

enum Element {
    
    case fire
    
    case earth
    
    case air
    
    case water
    
    // TODO: Write tests for this
    func signs() -> [StarSign] {
        switch self {
        case .fire: [.aries, .leo, .saggitarius]
        case .earth: [.taurus, .virgo, .capricorn]
        case .air: [.gemini, .libra, .aquarius]
        case .water: [.cancer, .scorpio, .pisces]
        }
    }
    
}
