//
//  ConversionUnit.swift
//  Handy Dandy
//
//  Created by Joshua Austin on 5/24/24.
//

import Foundation

enum ConversionUnit {
    case Hexadecimal(hexadecimal: String),
         RGB(red: Int, green: Int, blue: Int),
         RGBDecimal(red: Double, green: Double, blue: Double),
         ConversionIssue(reason: String)
}
