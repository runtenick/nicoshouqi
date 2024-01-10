//
//  CellTypeExtension.swift
//  
//
//  Created by étudiant on 10/01/2024.
//

import Foundation

import model

public extension CellType {
    let symbol: String {
        switch self {
            case .unknown:
                return " "
            case .jungle:
                return "🌿"
            case .den:
                return "🪹"
            case .trap:
                return "🪤"
            case .water:
                return "💧"
        }
    }
}
