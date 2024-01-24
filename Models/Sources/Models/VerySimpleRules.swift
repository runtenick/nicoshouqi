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
    
    public init() {
        self.historic = []
        self.ocurrences = []
    }
    
    /// Creates a board for this ruleset.
    static public func createBoard() -> Board {
        var grid : [[Cell]] = []
        var board : Board
        
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
        // add animals
        // player 1
        let lion1 = Piece(owner: .player1, animal: .lion)
        let tiger1 = Piece(owner: .player1, animal: .tiger)
        let rat1 = Piece(owner: .player1, animal: .rat)
        let cat1 = Piece(owner: .player1, animal: .cat)
        let elephant1 = Piece(owner: .player1, animal: .elephant)
        
        grid[0][1] = Cell(cellType: .jungle, initialOwner: .player1, piece: lion1)
        grid[0][3] = Cell(cellType: .jungle, initialOwner: .player1, piece: tiger1)
        grid[1][0] = Cell(cellType: .jungle, initialOwner: .player1, piece: rat1)
        grid[1][2] = Cell(cellType: .jungle, initialOwner: .player1, piece: cat1)
        grid[1][4] = Cell(cellType: .jungle, initialOwner: .player1, piece: elephant1)
        
        // player 2
        let lion2 = Piece(owner: .player2, animal: .lion)
        let tiger2 = Piece(owner: .player2, animal: .tiger)
        let rat2 = Piece(owner: .player2, animal: .rat)
        let cat2 = Piece(owner: .player2, animal: .cat)
        let elephant2 = Piece(owner: .player2, animal: .elephant)
        
        grid[3][0] = Cell(cellType: .jungle, initialOwner: .player2, piece: lion2)
        grid[3][2] = Cell(cellType: .jungle, initialOwner: .player2, piece: tiger2)
        grid[3][4] = Cell(cellType: .jungle, initialOwner: .player2, piece: rat2)
        grid[1][2] = Cell(cellType: .jungle, initialOwner: .player2, piece: cat2)
        grid[1][4] = Cell(cellType: .jungle, initialOwner: .player2, piece: elephant2)
        
        // last row
        grid.append(denRow)
        
        // board creation
        board = Board(grid: grid)!
        return board
    }
    
    /// Checks if the board is valid for this ruleset.
    public static func checkBoard(board: Board) throws -> Bool {
        
        /// Guards the number of rows and columns.
        guard board.nbRows == 5, board.nbColumns == 5 else {
            throw InvalidBoardError.badDimensions(nbRows: board.nbRows, nbColumns: board.nbColumns)
        }
        
        /// Guards the presence of dens in the correct position
        let den1 = board.grid[0][2].cellType
        let den2 = board.grid[4][2].cellType

        guard den1 == .den else { throw InvalidBoardError.badCellType(cellType: den1, row: 0, column: 2) }
        guard den2 == .den else { throw InvalidBoardError.badCellType(cellType: den2, row: 4, column: 2) }
        
        /// Guards that there's no water or traps on the board
        for row in 0..<board.grid.count {
            for column in 0..<board.grid[row].count {
                let cell = board.grid[row][column]
                if cell.cellType == .water {
                    throw InvalidBoardError.badCellType(cellType: .water, row: row, column: column)
                }
                if cell.cellType == .trap {
                    throw InvalidBoardError.badCellType(cellType: .trap, row: row, column: column)
                }
            }
        }
        
        /// Guards the number of pieces for each player
        guard board.countPieces(of: .player1) <= 5, board.countPieces(of: .player2) <= 5 else {
            throw InvalidBoardError.badNumberOfPieces
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
    
    /// Returns the list of valid moves for a given player on a given board
    public func getMoves(board: Board, owner: Owner) throws -> [Move] {
            var moves: [Move] = []
            
            // for every cell
            for row in 0..<board.nbRows {
                for column in 0..<board.nbColumns {
                    
                    if let piece = board.grid[row][column].piece, piece.owner == owner {
                        let pieceMoves = try getMoves(board: board, owner: owner, fromRow: row, andColumn: column)
                        moves.append(contentsOf: pieceMoves)
                    }
                }
            }
            
            return moves
        }
    
    /// Returns the list of valid moves for a given player, on a given board, starting at a given cell.
    public func getMoves(board: Board, owner: Owner, fromRow: Int, andColumn: Int) throws -> [Move] {
            var moves: [Move] = []
            
            // right, left, up, down
            let possibleDirections: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
            
            for direction in possibleDirections {
                let newRow = fromRow + direction.0
                let newColumn = andColumn + direction.1
                
                if newRow >= 5 || newColumn >= 5 {
                    continue
                }
                
                // if move is valid append to list
                if try isMoveValid(board: board, fromRow: fromRow, fromColumn: andColumn, toRow: newRow, toColumn: newColumn) {
                    let move = Move(owner: owner, rowOrigin: fromRow, columnOrigin: andColumn, rowDestination: newRow, columnDestination: newColumn)
                    moves.append(move)
                }
            }
            
            return moves
        }
    
    /// Checks if a move is valid from one cell to another
    public func isMoveValid(board: Board, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) throws -> Bool {
        /// Insure that the move is within the board
        guard fromRow >= 0, fromRow <= board.nbRows, fromColumn >= 0, fromColumn <= board.nbColumns,
              toRow >= 0, toRow <= board.nbRows, toColumn >= 0, toColumn <= board.nbColumns else {
            throw GameError.invalidMove
        }
        
        /// Checks if the move is horizontal or vertical and of lenght
        guard abs(fromRow - toRow) + abs(fromColumn - toColumn) == 1 else {
            throw GameError.invalidMove
        }
        
        /// Checks if the starting cell contains a piece
        let startingCell = board.grid[fromRow][fromColumn]
        guard let startingPiece = startingCell.piece else {
            throw GameError.invalidMove
        }
        
        /// Checks if the destination cell is empty or contains opposing pieces with a lower / same rank
        let destinationCell = board.grid[toRow][toColumn]
        if let destinationPiece = destinationCell.piece {
            
            if destinationPiece.owner == startingPiece.owner ||
                startingPiece.animal.rawValue < destinationPiece.animal.rawValue {
                throw GameError.invalidMove
            }
        }
        return true
    }
    
    /// Checks if a move is valid in a given board
    public func isMoveValid(board: Board, move: Move) throws -> Bool {
        return try isMoveValid(board: board, fromRow: move.rowOrigin, fromColumn: move.columnOrigin, toRow: move.rowDestination, toColumn: move.columnDestination)
    }
    
    public func isGameOver(board: Board, lastRow: Int, lastColumn: Int, currentPlayer: Owner) throws -> (Bool, Result) {
        let lastCell = board.grid[lastRow][lastColumn]
        let opponent : Owner = currentPlayer == .player1 ? .player2 : .player1
        
        // Check if the last moved piece reached the opponent's den
        if lastCell.cellType == .den && lastCell.piece?.owner != currentPlayer {
            return (true, .winner(winningReason: .denReached))
        }
        
        // Check if oponent has any pieces left
        let opPieces = board.countPieces(of: opponent)
        if opPieces == 0 { return (true, .winner(winningReason: .noMorePieces)) }
        
        // Check if oponent has any moves left
        let oponentMoves: [Move] = try getMoves(board: board, owner: opponent)
        if oponentMoves.isEmpty { return (true, .winner(winningReason: .noMovesLeft))}
                
        // The game is not over
        return (false, .notFinished)
    }
    
    public mutating func playedMove(move: Move, initialBoard: Board, endingBoard: Board) {
        ocurrences.append(endingBoard)
        historic.append(move)
    }
}
