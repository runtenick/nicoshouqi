//
//  File.swift
//  
//
//  Created by étudiant on 16/02/2024.
//

import Foundation
import Models

extension CellType: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        

        switch rawValue {
            case "jungle":
                self = .jungle
            case "water":
                self = .water
            case "trap":
                self = .trap
            case "den":
                self = .den
            default:
                self = .unknown
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
            case .den:
                try container.encode("den")
            case .jungle:
                try container.encode("jungle")
            case .trap:
                try container.encode("trap")
            case .water:
                try container.encode("water")
            case .unknown:
                try container.encode("unknown")
        }
    }
    
}
