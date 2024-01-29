//
//  Owner.swift
//  
//
//  Created by étudiant on 09/01/2024.
//

import Foundation

/// Represents the owner of a cell in a game.
public enum Owner: CustomStringConvertible {
    /// Represents an empty cell.
    case noOne
    
    /// Represents player 1.
    case player1
    
    /// Represents player 2.
    case player2
    
    /// A textual representation of the owner.
    public var description: String {
        switch self {
        case .noOne:
            return "x"
        case .player1:
            return "1"
        case .player2:
            return "2"
        }
    }
}
