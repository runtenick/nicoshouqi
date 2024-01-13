//
//  CellTypeExtension.swift
//  
//
//  Created by étudiant on 10/01/2024.
//

import Foundation
import Models

public extension CellType {
    var symbol: String {
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

