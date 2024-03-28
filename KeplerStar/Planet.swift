//
//  Planet.swift
//  KeplerStar
//
//  Created by Alonso del Arte on 3/20/24.
//

import Foundation

enum Planet : Character, CaseIterable {
    
    case sun = "\u{2609}"
    
    case moon = "\u{263e}"
    
    case mercury = "\u{263f}"
    
    case venus = "\u{2640}"
    
    case mars = "\u{2642}"
    
    case jupiter = "\u{2643}"
    
    case saturn = "\u{2644}"
    
    case uranus = "\u{2645}"
    
    case neptune = "\u{2646}"
    
    case pluto = "\u{2647}"
    
    func description() -> String {
        "\(self)".capitalized
    }
    
}
