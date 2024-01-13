//
//  Cell.swift
//  
//
//  Created by étudiant on 09/01/2024.
//

import Foundation

public struct Cell: CustomStringConvertible {
    public let cellType: CellType
    public let initialOwner: Owner
    // piece is optional so I might have to do "if let ..." when using this attribute
    public let piece: Piece?
    
    public init(cellType: CellType, initialOwner: Owner = .noOne, piece: Piece? = nil) {
        self.cellType = cellType
        self.initialOwner = initialOwner
        self.piece = piece
    }
    
    public var description: String {
        if let piece = self.piece {
            // piece + real onwer
            return "\(piece) on \(self.cellType), \(piece.owner)"
        } else {
            return "ø on \(self.cellType), \(self.initialOwner)"
        }
    }
}
