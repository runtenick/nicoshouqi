//
//  Result.swift
//  
//
//  Created by étudiant on 22/01/2024.
//

import Foundation

/// The game result enum.
public enum Result {
    case notFinished
    case even
    case winner(winningReason: WinningReason)
}
