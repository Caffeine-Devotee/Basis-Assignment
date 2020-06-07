//
//  HelperFunction.swift
//  Basis
//
//  Created by GAURAV NAYAK on 07/06/20.
//  Copyright © 2020 CaffeineDevotee. All rights reserved.
//

import Foundation
import UIKit

//Get random color
func getRandomColor() -> UIColor {
    let colorList : [UIColor] = [UIColor(red:0.47, green:0.59, blue:0.63, alpha:1.0),
                                 UIColor(red:0.73, green:0.81, blue:0.87, alpha:1.0),
                                 UIColor(red:0.63, green:0.77, blue:0.78, alpha:1.0),
                                 UIColor(red:0.76, green:0.78, blue:0.66, alpha:1.0),
                                 UIColor(red:0.82, green:0.87, blue:0.73, alpha:1.0),
                                 UIColor(red:0.68, green:0.74, blue:0.70, alpha:1.0),
                                 UIColor(red:1.00, green:0.70, blue:0.67, alpha:1.0),
                                 UIColor(red:0.90, green:0.73, blue:0.66, alpha:1.0)]
    return colorList[Int.random(in: 0..<7)]
}
