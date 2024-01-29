//
//  Board.swift
//  
//
//  Created by étudiant on 09/01/2024.
//

import Foundation

/// Represents a game board.
public struct Board : Hashable {
    
    // == so that we know when 2 boards are the same => same hash when used as key
    public static func == (lboard: Board, rboard: Board) -> Bool {
        return lboard.nbRows == rboard.nbRows &&
        lboard.nbColumns == rboard.nbColumns &&
        lboard.grid == rboard.grid
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(nbRows)
        hasher.combine(nbColumns)
        hasher.combine(grid)
    }
    
    public let nbRows: Int
    public let nbColumns: Int
    public private(set) var grid : [[Cell]]
    
    /// Initializes a board with the given grid.
    ///
    /// - Parameter grid: The grid representing the cells of the board.
    public init?(grid: [[Cell]]) {
        let rowSize = grid.first?.count ?? 0
        
        for row in grid {
            if row.count != rowSize {
                return nil
            }
        }
        
        self.nbRows = grid.count
        self.nbColumns = rowSize
        self.grid = grid
    }
    
    
    /// Counts the pieces of a player.
    ///
    /// - Parameter player: The player whose pieces are to be counted.
    /// - Returns: The number of pieces owned by the player.
    public func countPieces(of player: Owner) -> Int {
        // flatMap returns me a 1 dimensional array,
        // the closure here specifies that no transformation is needed
        let onedGrid = grid.flatMap { $0 }
        
        // if piece is nil -> false
        let playerPieces = onedGrid.filter { $0.piece?.owner == player }
        
        return playerPieces.count
    }
    
    /// Counts the pieces of both players.
    ///
    /// - Returns: A tuple containing the number of pieces owned by player one and player two respectively.
    public func countPieces() -> (playerOneCount: Int, playerTwoCount: Int) {
        let playerOneCount = self.countPieces(of: .player1)
        let playerTwoCount = self.countPieces(of: .player2)
        
        return (playerOneCount: playerOneCount, playerTwoCount: playerTwoCount)
    }
    
    // [TODO] unknown check ?
    /// Inserts a piece into the specified cell.
    ///
    /// - Parameters:
    ///   - piece: The piece to be inserted.
    ///   - atRow: The row index of the cell.
    ///   - andColumn: The column index of the cell.
    /// - Returns: A `BoardResult` indicating the success or failure of the operation.
    public mutating func insertPiece(piece: Piece, atRow: Int, andColumn: Int) -> BoardResult {
        // Check if out of bounds
        /*if atRow < 0 || atRow >= nbRows || andColumn < 0 || andColumn >= nbColumns {
            return .failed(reason: .outOfBounds)
        }*/
        
        guard atRow >= 0, atRow < nbRows, andColumn >= 0, andColumn < nbColumns else {
            return .failed(reason: .outOfBounds)
        }
        
        // Check if cell not empty
        // if != nil or guard ==
        guard grid[atRow][andColumn].piece == nil else {
            return .failed(reason: .cellNotEmpty)
        }
        
        // Insert the piece
        let currentCell = grid[atRow][andColumn]
        grid[atRow][andColumn] = Cell(cellType: currentCell.cellType, piece: piece)
        
        return .ok
    }
    
    /// Removes the piece from the specified cell.
    ///
    /// - Parameters:
    ///   - atRow: The row index of the cell.
    ///   - andColumn: The column index of the cell.
    /// - Returns: A `BoardResult` indicating the success or failure of the operation.
    public mutating func removePiece(atRow: Int, andColumn: Int) -> BoardResult {
        // check if out of bounds
        if atRow < 0 || atRow >= nbRows || andColumn < 0 || andColumn >= nbColumns {
            return .failed(reason: .outOfBounds)
        }
        
        // check if cell empty
        if grid[atRow][andColumn].piece == nil {
            return .failed(reason: .cellEmpty)
        }
        
        // remove piece from cell
        let currentCell = grid[atRow][andColumn]
        grid[atRow][andColumn] = Cell(cellType: currentCell.cellType)
        
        return .ok
    }
}
