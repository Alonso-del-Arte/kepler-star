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
    
    private let sec: UInt8
    
    func getDegrees() -> Int16 {
        self.deg
    }
    
    func getMinutes() -> UInt8 {
        self.min
    }
    
    func getSeconds() -> UInt8 {
        self.sec
    }
    
    func description() -> String {
        "\(self.deg)\u{00B0} \(self.min)' \(self.sec)\""
    }
    
    init(degrees: Int16, minutes: UInt8 = 0, seconds: UInt8 = 0) {
        let adjust: Int16 = if degrees < 0 {
            360
        } else if degrees > 359 {
            -360
        } else {
            0
        }
        self.deg = degrees + adjust
        self.min = minutes
        self.sec = seconds
    }
    
}
