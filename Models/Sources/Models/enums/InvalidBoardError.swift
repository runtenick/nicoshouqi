//
//  InvalidBoardError.swift
//  
//
//  Created by étudiant on 24/01/2024.
//

import Foundation

/// The errors related to an invalid game board.
public enum InvalidBoardError: Error {
    /// Indicates that the dimensions of the board are invalid.
    case badDimensions(nbRows: Int, nbColumns: Int)
    
    /// Indicates that a cell on the board has an invalid cell type at a specific row and column.
    case badCellType(cellType: CellType, row: Int, column: Int)
    
    /// Indicates that there are multiple occurrences of the same piece on the board, which is not allowed.
    case multipleOccurrencesOfSamePiece(piece: Piece)
    
    /// Indicates that a piece on the board does not have an owner assigned to it.
    case pieceWithNoOwner(piece: Piece)
    
    /// Indicates that a specific piece is not allowed on a particular type of cell.
    case pieceNotAllowedOnThisCell(piece: Piece, cell: Cell)
    
    /// Indicates that the number of pieces on the board is invalid.
    case badNumberOfPieces
}
