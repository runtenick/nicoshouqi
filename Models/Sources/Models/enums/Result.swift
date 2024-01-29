//
//  Result.swift
//  
//
//  Created by étudiant on 22/01/2024.
//

import Foundation

/// The game result enum.
public enum Result: Equatable {
    /// Indicates that the game isn't finished.
    case notFinished
    
    /// Indicates that the game is even.
    case even
    
    /// Indicates that the game has a winner
    case winner(winningReason: WinningReason)
}
