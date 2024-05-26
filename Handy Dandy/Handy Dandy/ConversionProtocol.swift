//
//  ConversionProtocol.swift
//  Handy Dandy
//
//  Created by Joshua Austin on 5/24/24.
//

protocol Conversion {
    var convertingFrom: ConversionUnit { get set }
    var convertingTo: ConversionType { get set }
}

extension Conversion {
    func convert(conversion: Conversion) -> ConversionUnit {
        var converted: ConversionUnit
        switch (conversion.convertingFrom) {
            case .Hexadecimal(let hexadecimal):
                if conversion.convertingTo == .RGB {
                    converted = fromHexadecimal(hexadecimal: hexadecimal, convertTo: .RGB)
                    return converted
                } else {
                    converted = fromHexadecimal(hexadecimal: hexadecimal, convertTo: .RGBDecimal)
                    return converted
                }
            default:
                converted = .ConversionIssue(reason: "Incomplete implementation")
                return converted
        }
    }
    
    private func fromHexadecimal(hexadecimal: String, convertTo: ConversionType) -> ConversionUnit {
        // Ensure the hex string is 3 or 6 characters long
        guard hexadecimal.count == 3 || hexadecimal.count == 6 else {
            return .ConversionIssue(reason: "Hexadecimal string must be either 3 or 6 characters long.")
        }
        
        guard convertTo != .Hexadecimal else {
            return .ConversionIssue(reason: "There is no need to convert from hexadecimal to hexadecimal.")
        }
        
        // Expand 3-char hex to 6-char hex
        let fullHex: String
        if hexadecimal.count == 3 {
            fullHex = hexadecimal.map { "\($0)\($0)" }.joined()
        } else {
            fullHex = hexadecimal
        }
        
        // Convert the 6-char hex string to an RGB value
        guard let red = Int(fullHex.prefix(2), radix: 16),
              let green = Int(fullHex.dropFirst(2).prefix(2), radix: 16),
              let blue = Int(fullHex.dropFirst(4).prefix(2), radix: 16) else {
            return .ConversionIssue(reason: "Hexadecimal string contains invalid characters.")
        }
        
        if convertTo == .RGB {
            return .RGB(red: red, green: green, blue: blue)
        } else {
            return .RGBDecimal(red: Double(red) / 255.0, green: Double(green) / 255.0, blue: Double(blue) / 255.0)
        }
    }
}
