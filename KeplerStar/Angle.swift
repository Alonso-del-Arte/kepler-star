//
//  Angle.swift
//  KeplerStar
//
//  Created by Alonso del Arte on 4/5/24.
//

import Foundation

struct Angle {
    
    private let deg: Int16
    
    private let min: UInt8
    
    func getDegrees() -> Int16 {
        self.deg
    }
    
    func getMinutes() -> UInt8 {
        self.min
    }
    
    func getSeconds() -> UInt8 {
        61
    }
    
    init(degrees: Int16, minutes: UInt8 = 0, seconds: UInt8 = 0) {
        self.deg = degrees
        self.min = minutes
    }
    
}
