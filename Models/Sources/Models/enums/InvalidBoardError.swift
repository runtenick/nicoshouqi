//
//  InvalidBoardError.swift
//  
//
//  Created by étudiant on 24/01/2024.
//

import Foundation

/// The invalid board error enum
public enum InvalidBoardError {
    case badDimensions(row: Int, column: Int)
    case badCellType(cellType: CellType, row: Int, column: Int)
    case multipleOccurencesOfSamePiece(piece: Piece)
    case pieceWithNoOwner(piece: Piece)
    case pieceNotAllowedOnThisCell(piece: Piece, cell: Cell)
}
