//
//  Move.swift
//  
//
//  Created by étudiant on 22/01/2024.
//

import Foundation

/// Represents a move in the game.
public struct Move : CustomStringConvertible, Equatable {
    public var description: String {
        return "\(owner) played piece at row \(rowOrigin) and column \(columnOrigin) to row \(rowDestination) and column \(columnDestination)"
    }
    
    public let owner : Owner
    public let rowOrigin : Int
    public let columnOrigin : Int
    public let rowDestination : Int
    public let columnDestination : Int
    
    /// Initializes a new instance of the `Move` struct.
    ///
    /// - Parameters:
    ///   - owner: The owner of the move.
    ///   - rowOrigin: The row index of the source cell.
    ///   - columnOrigin: The column index of the source cell.
    ///   - rowDestination: The row index of the destination cell.
    ///   - columnDestination: The column index of the destination cell.
    public init(owner: Owner, rowOrigin: Int, columnOrigin: Int, rowDestination: Int, columnDestination: Int) {
        self.owner = owner
        self.rowOrigin = rowOrigin
        self.columnOrigin = columnOrigin
        self.rowDestination = rowDestination
        self.columnDestination = columnDestination
    }
    
    
}
