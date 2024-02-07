//
//  GameError.swift
//  
//
//  Created by étudiant on 24/01/2024.
//

import Foundation

/// The game error enum
public enum GameError: Error {
    /// The move is invalid.
    case invalidMove
    ///  Removing a piece failed.
    case failedToRemovePiece
    ///  Inserting a piece failed.
    case failedToInsertPiece
    /// A wrong id was given to get the next player.
    case badPlayerError(badPlyaerId: String)
}
