//
//  Piece.swift
//  
//
//  Created by étudiant on 09/01/2024.
//

import Foundation

/// Represents a game piece.
// Only stored properties so automatic Hashable implementation used
public struct Piece: CustomStringConvertible, Hashable {
    /// The owner of the piece.
    public let owner: Owner
    
    /// The animal associated with the piece.
    public let animal: Animal
    
    /// Initializes a new instance of the `Piece` struct.
    ///
    /// - Parameters:
    ///   - owner: The owner of the piece.
    ///   - animal: The animal associated with the piece.
    public init(owner: Owner, animal: Animal) {
        self.owner = owner
        self.animal = animal
    }
    
    /// A textual representation of the piece.
    public var description: String {
        return "[\(owner):\(animal)]"
    }
}
