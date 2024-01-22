//
//  Move.swift
//  
//
//  Created by étudiant on 22/01/2024.
//

import Foundation

/// Represents a move in the game.
public struct Move {
    public let owner : Owner
    public let rowOrigin : Int
    public let columnOrigin : Int
    public let rowDestination : Int
    public let columnDestination : Int
    
    init(owner: Owner, rowOrigin: Int, columnOrigin: Int, rowDestination: Int, columnDestination: Int) {
        self.owner = owner
        self.rowOrigin = rowOrigin
        self.columnOrigin = columnOrigin
        self.rowDestination = rowDestination
        self.columnDestination = columnDestination
    }
}
