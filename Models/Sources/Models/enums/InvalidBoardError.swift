//
//  InvalidBoardError.swift
//  
//
//  Created by étudiant on 24/01/2024.
//

import Foundation

/// The invalid board error enum
public enum InvalidBoardError : Error {
    case badDimensions(nbRows: Int, nbColumns: Int)
    case badCellType(cellType: CellType, row: Int, column: Int)
    case multipleOccurencesOfSamePiece(piece: Piece)
    case pieceWithNoOwner(piece: Piece)
    case pieceNotAllowedOnThisCell(piece: Piece, cell: Cell)
    case badNumberOfPieces
}
