//
//  AnimalExtension.swift
//  
//
//  Created by étudiant on 12/02/2024.
//

import Foundation
import Models

extension Animal: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(Int.self)
        
        guard let animal = Animal(rawValue: rawValue) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "This is not a known animal value")
        }
        self = animal
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
