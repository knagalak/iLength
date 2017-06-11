//
//  Double+DegreesRadians.swift
//  iLength
//
//  Created by Kavya Nagalakunta on 6/6/17.
//  Copyright © 2017 Kavya Nagalakunta. All rights reserved.
//

import Foundation

extension Double {
    func toRadians() ->Double {
        let PI : Double = 3.141592653589793
        return self * PI / 180.0
    }
    func toDegrees() -> Double {
        return self * 180.0 / .pi
    }
}
