//
//  OwnerExtension.swift
//  
//
//  Created by étudiant on 12/02/2024.
//

import Foundation
import Models

extension Owner: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        

        switch rawValue {
            case "x":
                self = .noOne
            case "1":
                self = .player1
            case "2":
                self = .player2
            default:
                self = .noOne
        }
    }


    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
            case .noOne:
                try container.encode("x")
            case .player1:
                try container.encode("1")
            case .player2:
                try container.encode("2")
        }
    }
}


