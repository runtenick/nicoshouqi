//
//  VerySimpleRules.swift
//  
//
//  Created by étudiant on 22/01/2024.
//

import Foundation

public struct VerySimpleRules : Rules {
    
    public var ocurrences: [Board]
    
    public var historic: [Move]
    
    /// Creates a board for this ruleset.
    static public func createBoard() -> Board {
        var grid : [[Cell]] = [[]]
        
        let denRow = [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .den), Cell(cellType: .jungle), Cell(cellType: .jungle) ]
        
        // first row
        grid.append(denRow)
        
        // middle rows
        for _ in 1...3 {
            var row : [Cell] = []
            
            for _ in 1...5 {
                let cell = Cell(cellType: .jungle)
                row.append(cell)
            }
            
            grid.append(row)
        }
        
        // last row
        grid.append(denRow)
        
        // board creation
        let board = Board(grid: grid)!
        return board
    }
    
    /// Checks if the board is valid for this ruleset.
    public static func checkBoard(board: Board) -> Bool {
        
        /// Guards the number of rows and columns.
        guard board.nbRows == 5, board.nbColumns == 5 else {
            return false
        }
        
        /// Guards the presence of dens in the correct position
        guard board.grid[0][2].cellType == .den, board.grid[4][2].cellType == .den else {
            return false
        }
        
        /// Guards that there's no water on the board
        guard !board.grid.contains(where: { $0.contains { $0.cellType == .water } }) else {
            return false
        }
        
        /// Guards the number of pieces for each player
        guard board.countPieces(of: .player1) <= 5, board.countPieces(of: .player2) <= 5 else {
            return false
        }
        
        /// Guards that the player doesn't have any unallowed pieces
        guard !board.grid.contains(where: { $0.contains { $0.piece?.animal != .wolf && $0.piece?.animal != .dog && $0.piece?.animal != .leopard }}) else {
            return false
        }
        
        return true
    }
    
    /// Gets the next player
    public func getNextPlayer() -> Owner {
        if self.historic.last?.owner == .player1 {
            return .player2
        } else {
            return .player1
        }
    }
    
    ///
    public func getMoves(board: Board, owner: Owner) -> [Move] {
        let tab : [Move] = []
        return tab
    }
    
    public func getMoves(board: Board, owner: Owner, fromRow: Int, andColumn: Int) -> [Move] {
        let tab : [Move] = []
        return tab
        
    }
    
    /// Checks if a move is valid from one cell to another
    public func isMoveValid(board: Board, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) -> Bool {
        /// Insure that the move is within the board
        guard fromRow > 0, fromRow <= board.nbRows, fromColumn > 0, fromColumn <= board.nbColumns,
              toRow > 0, toRow <= board.nbRows, toColumn > 0, toColumn <= board.nbColumns else {
            return false;
        }
        
        /// Checks if the move is horizontal or vertical and of lenght
        guard abs(fromRow - toRow) + abs(fromColumn - toColumn) == 1 else {
            return false
        }
        
        /// Checks if the starting cell contains a piece
        let startingCell = board.grid[fromRow][fromColumn]
        guard let startingPiece = startingCell.piece else {
            return false
        }
        
        /// Checks if the destination cell is empty or contains opposing pieces with a lower / same rank
        let destinationCell = board.grid[toRow][toColumn]
        if let destinationPiece = destinationCell.piece {
            
            if destinationPiece.owner == startingPiece.owner ||
                startingPiece.animal.rawValue < destinationPiece.animal.rawValue {
                return false
            }
        }
        
        return true
    }
    
    /// Checks if a move is valid in a given board
    public func isMoveValid(board: Board, move: Move) -> Bool {
        return isMoveValid(board: board, fromRow: move.rowOrigin, fromColumn: move.columnOrigin, toRow: move.rowDestination, toColumn: move.columnDestination)
    }
    
    public func isGameOver(board: Board, lastRow: Int, lastColumn: Int) -> (Bool, Result) {
        return (true, .even)
    }
    
    public func playedMove(move: Move, initialBoard: Board, endingBoard: Board) {
        
    }
}
