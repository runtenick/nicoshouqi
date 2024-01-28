//
//  Piece.swift
//  
//
//  Created by étudiant on 09/01/2024.
//

import Foundation

// Only stored properties so automatic implementation is used
public struct Piece: CustomStringConvertible, Hashable {
    public let owner: Owner
    public let animal: Animal
    
    public init(owner: Owner, animal: Animal) {
        self.owner = owner
        self.animal = animal
    }
    
    public var description: String {
        return "[\(owner):\(animal)]"
    }
}
