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
    
    public func getNextPlayer() -> Owner {
        if self.historic.last?.owner == .player1 {
            return .player2
        } else {
            return .player1
        }
    }
    
    public func getMoves(board: Board, owner: Owner) -> [Move] {
        let tab : [Move] = []
        return tab
    }
    
    public func getMoves(board: Board, owner: Owner, fromRow: Int, andColumn: Int) -> [Move] {
        let tab : [Move] = []
        return tab
        
    }
    
    public func isMoveValid(board: Board, fromRown: Int, fromColumn: Int, toRow: Int, toColumn: Int) -> Bool {
        return true
    }
    
    public func isMoveValid(board: Board, move: Move) -> Bool {
        return true
    }
    
    public func isGameOver(board: Board, lastRow: Int, lastColumn: Int) -> (Bool, Result) {
        return (true, .even)
    }
    
    public func playedMove(move: Move, initialBoard: Board, endingBoard: Board) {
        
    }
}
