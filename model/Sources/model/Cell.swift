//
//  Cell.swift
//  
//
//  Created by étudiant on 09/01/2024.
//

import Foundation

public struct Cell: CustomStringConvertible {
    let cellType: CellType
    let initialOwner: Owner
    // piece is then optional so I might have to do
    // "if let ..." when using this attribute
    let piece: Piece?
    
    public init(cellType: CellType, initialOwner: Owner = .noOne, piece: Piece? = nil) {
        self.cellType = cellType
        self.initialOwner = initialOwner
        self.piece = piece
    }
    
    public var description: String {
        let str = "on \(self.cellType), \(self.initialOwner)"
        if let piece = self.piece {
            return "\(piece) \(str)"
        } else {
            return "ø \(str)"
        }
    }
}
