//
//  HumanPlayer.swift
//  
//
//  Created by étudiant on 29/01/2024.
//

import Foundation

/// A human player in the game.
public class HumanPlayer: Player {
    public let inputMethod: (HumanPlayer) -> Move
    
    /// Initializes a new instance of the `HumanPlayer` class.
    /// - Parameters:
    ///   - id: The owner of the player.
    ///   - name: The name of the player.
    ///   - inputMethod: The input method for the player.
    public init?(withId id: Owner, andName name: String, andInputMethod inputMethod: @escaping (HumanPlayer) -> Move) {
        self.inputMethod = inputMethod
        super.init(withId: id, andName: name)
    }
    
    /// Chooses a move based on the current game board and rules.
    /// - Parameters:
    ///   - board: The game board.
    ///   - rules: The game rules.
    /// - Returns: The chosen move, or `nil` if the move is not valid.
    public override func chooseMove(in board: Board, with rules: Rules) -> Move? {
        let move = self.inputMethod(self)
        return move
    }
}
