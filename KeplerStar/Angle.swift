//
//  Angle.swift
//  KeplerStar
//
//  Created by Alonso del Arte on 4/5/24.
//

import Foundation

struct Angle : AdditiveArithmetic {

    private let deg: Int16
    
    private let min: UInt8
    
    private let sec: UInt8
    
    static var zero: Angle = Angle(degrees: 0)
    
    func getDegrees() -> Int16 {
        self.deg
    }
    
    func getMinutes() -> UInt8 {
        self.min
    }
    
    func getSeconds() -> UInt8 {
        self.sec
    }
    
    /// Adds two angles.
    /// - Parameters:
    ///   - lhs: One of the angles to add. For example, 20 degrees, 41 minutes,
    ///   22 seconds.
    ///   - rhs: One of the angles to add. For example, 95 degrees, 28 minutes,
    ///   20 seconds.
    /// - Returns: The sum of the two angles. In the example, this would be 116
    /// degrees, 9 minutes, 42 seconds.
    static func + (lhs: Angle, rhs: Angle) -> Angle {
        var deg = lhs.deg + rhs.deg
        var min = lhs.min + rhs.min
        var sec = lhs.sec + rhs.sec
        if (sec > 59) {
            min += 1
            sec -= 60
        }
        if (min > 59) {
            deg += 1
            min -= 60
        }
        return Angle(degrees: deg, minutes: min, seconds: sec)
    }
    
    // TODO: Write tests for this
    static func - (lhs: Angle, rhs: Angle) -> Angle {
        Angle(degrees: lhs.deg - rhs.deg, minutes: lhs.min - rhs.min,
              seconds: lhs.sec - rhs.sec)
    }
    
    func description() -> String {
        var intermediate = "\(self.deg)\u{00B0}"
        if self.min > 0 || (self.min == 0 && self.sec > 0) {
            intermediate += " \(self.min)'"
            if self.sec > 0 {
                intermediate += " \(self.sec)\""
            }
        }
        return intermediate
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
