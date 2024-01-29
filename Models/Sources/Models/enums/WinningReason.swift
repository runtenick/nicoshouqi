//
//  WinningReason.swift
//  
//
//  Created by étudiant on 22/01/2024.
//

import Foundation

/// The winning reason enum.
public enum WinningReason {
    /// Indicates the den was reached.
    case denReached
    
    /// Indicates there are no more pieces left.
    case noMorePieces
    
    /// Indicates there are no more moves left.
    case noMovesLeft
    
    /// Indicates there are too many occurrences.
    case tooManyOcurrences
}
