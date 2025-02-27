//
//  RandomPlayer.swift
// 
//
//  Created by étudiant on 29/01/2024.
//

import Foundation

/// A non human player that makes random moves.
public class RandomPlayer: Player {
    
    /// Initializes a new instance of the `RandomPlayer` class.
    /// - Parameters:
    ///   - id: The owner of the player.
    ///   - name: The name of the player.
    public override init?(withId id: Owner, andName name: String) {
        super.init(withId: id, andName: name)
    }
    
    /// Chooses a random move from the available moves on the board.
    /// - Parameters:
    ///   - board: The game board.
    ///   - rules: The game rules.
    /// - Returns: A randomly chosen move.
    public override func chooseMove(in board: Board, with rules: Rules) -> Move? {
        // Get all possible moves
        let possibleMoves = rules.getMoves(board: board, owner: self.id)
       
        // If there are no valid moves, possibleMoves might be empty
        if possibleMoves.isEmpty {
            return nil
        } else {
            // Return a random move
            return possibleMoves.randomElement()
        }
    }
}
