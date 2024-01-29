//
//  Player.swift
//  
//
//  Created by étudiant on 29/01/2024.
//

import Foundation

/// A player in the game.
public class Player {
    let id: Owner
    let name: String
    
    /// Initializes a new instance of the `Player` class.
    /// - Parameters:
    ///   - id: The owner of the player.
    ///   - name: The name of the player.
    public init(withId id: Owner, andName name: String) {
        self.id = id
        self.name = name
    }
    
    /// Chooses a move based on the current game board and rules.
    /// - Parameters:
    ///   - board: The game board.
    ///   - rules: The game rules.
    /// - Returns: The chosen move, or `nil` if no move is chosen.
    public func chooseMove(in board: Board, with rules: Rules) -> Move? {
        return nil
    }
}
