//
//  Piece.swift
//  
//
//  Created by étudiant on 09/01/2024.
//

import Foundation

public struct Piece: CustomStringConvertible {
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
