//
//  Move.swift
//  
//
//  Created by étudiant on 22/01/2024.
//

import Foundation

/// Represents a move in the game.
public struct Move : CustomStringConvertible {
    public var description: String {
        return "\(owner) played piece at row \(rowOrigin) and column \(columnOrigin) to row \(rowDestination) and column \(columnDestination)"
    }
    
    public let owner : Owner
    public let rowOrigin : Int
    public let columnOrigin : Int
    public let rowDestination : Int
    public let columnDestination : Int
    
    public init(owner: Owner, rowOrigin: Int, columnOrigin: Int, rowDestination: Int, columnDestination: Int) {
        self.owner = owner
        self.rowOrigin = rowOrigin
        self.columnOrigin = columnOrigin
        self.rowDestination = rowDestination
        self.columnDestination = columnDestination
    }
    
    
}
