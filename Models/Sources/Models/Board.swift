//
//  Board.swift
//  
//
//  Created by étudiant on 09/01/2024.
//

import Foundation

public struct Board {
    let nbRows: Int
    let nbColumns: Int
    public private(set) var grid : [[Cell]]
    
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
    public func countPieces(of player: Owner) -> Int {
        // flatMap returns me a 1 dimensional array,
        // the closure here specifies that no transformation is needed
        let onedGrid = grid.flatMap { $0 }
        
        // if piece is nil -> false
        let playerPieces = onedGrid.filter { $0.piece?.owner == player }
        
        return playerPieces.count
    }
    
    /// Counts the pieces of both players.
    public func countPieces() -> (playerOneCount: Int, playerTwoCount: Int) {
        let playerOneCount = self.countPieces(of: .player1)
        let playerTwoCount = self.countPieces(of: .player2)
        
        return (playerOneCount: playerOneCount, playerTwoCount: playerTwoCount)
    }
    
    // [TODO] unknown check ?
    ///  Inserts a piece into a given cell.
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
