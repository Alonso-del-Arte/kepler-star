//
//  StarSign.swift
//  KeplerStar
//
//  Created by Alonso del Arte on 3/20/24.
//

import Foundation
import SwiftUI

enum StarSign : Character, CaseIterable {
    
    case aries = "\u{2648}"
    
    case taurus = "\u{2649}"
    
    case gemini = "\u{264a}"
    
    case cancer = "\u{264b}"
    
    case leo = "\u{264c}"
    
    case virgo = "\u{264d}"
    
    case libra = "\u{264e}"
    
    case scorpio = "\u{264f}"
    
    case saggitarius = "\u{2650}"
    
    case capricorn = "\u{2651}"
    
    case aquarius = "\u{2652}"
    
    case pisces = "\u{2653}"
    
    func minimumDegree() -> Angle {
        switch self {
        case .aries: Angle(degrees: 0)
        case .taurus: Angle(degrees: 30)
        case .gemini: Angle(degrees: 60)
        case .cancer: Angle(degrees: 90)
        case .leo: Angle(degrees: 120)
        case .virgo: Angle(degrees: 150)
        case .libra: Angle(degrees: 180)
        case .scorpio: Angle(degrees: 210)
        case .saggitarius: Angle(degrees: 240)
        case .capricorn: Angle(degrees: 270)
        case .aquarius: Angle(degrees: 300)
        case .pisces: Angle(degrees: 330)
        }
    }
    
    func description() -> String {
        "\(self)".capitalized
    }
        
}
