//
//  Game.swift
//  
//
//  Created by étudiant on 04/02/2024.
//

import Foundation

/// The game structure.
public struct Game {
    public var rules : Rules
    public let player1 : Player
    public let player2 : Player
    
    public init(withRules rules: Rules, andPlayer1 player1: Player, andPlayer2 player2: Player) {
        self.rules = rules
        self.player1 = player1
        self.player2 = player2
    }
    
    /// The game loop starter function.
    public func start() {
        // Not implemented yet.
    }
}
