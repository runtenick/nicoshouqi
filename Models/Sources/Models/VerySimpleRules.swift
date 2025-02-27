//
//  VerySimpleRules.swift
//  
//
//  Created by étudiant on 22/01/2024.
//

import Foundation

public struct VerySimpleRules : Rules {
    
    public var ocurrences: [Board:Int]
    public var historic: [Move]
    
    // constants
    private static let NB_ROWS = 5
    private static let NB_COLUMNS = 5
    private static let MAX_NB_PIECES = 5
    
    public init() {
        self.historic = []
        self.ocurrences = [:]
    }
    
    /// Creates a new game board.
    ///
    /// - Returns: A new instance of the game board.
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
        // last row
        grid.append(denRow)
        
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
        
        grid[4][3] = Cell(cellType: .jungle, initialOwner: .player2, piece: lion2)
        grid[4][1] = Cell(cellType: .jungle, initialOwner: .player2, piece: tiger2)
        grid[3][4] = Cell(cellType: .jungle, initialOwner: .player2, piece: rat2)
        grid[3][2] = Cell(cellType: .jungle, initialOwner: .player2, piece: cat2)
        grid[3][0] = Cell(cellType: .jungle, initialOwner: .player2, piece: elephant2)
        
        // setting den's initial owner
        grid[0][2] = Cell(cellType: .den, initialOwner: .player1)
        grid[4][2] = Cell(cellType: .den, initialOwner: .player2)
        
        // board creation
        board = Board(grid: grid)!
        return board
    }
    
    /// Checks if the given board is valid according to the game rules.
    ///
    /// - Parameter board: The board to be checked.
    /// - Returns: A boolean value indicating whether the board is valid or not.
    public static func checkBoard(board: Board) throws -> Bool {
        
        // Check for bad dimensions
        guard board.nbRows == NB_ROWS, board.nbColumns == NB_COLUMNS else {
            throw InvalidBoardError.badDimensions(nbRows: board.nbRows, nbColumns: board.nbColumns)
        }
        
        // Check for bad cell type: den cells
        let den1 = board.grid[0][2].cellType
        let den2 = board.grid[4][2].cellType

        guard den1 == .den else { throw InvalidBoardError.badCellType(cellType: den1, row: 0, column: 2) }
        guard den2 == .den else { throw InvalidBoardError.badCellType(cellType: den2, row: 4, column: 2) }
        
        var piecesCount: [Piece: Int] = [:]
        
        for row in 0..<board.grid.count {
            for column in 0..<board.grid[row].count {
                
                let cell = board.grid[row][column]
                
                // Check for bad cell type: water and trap cells
                if cell.cellType == .water {
                    throw InvalidBoardError.badCellType(cellType: .water, row: row, column: column)
                }
                if cell.cellType == .trap {
                    throw InvalidBoardError.badCellType(cellType: .trap, row: row, column: column)
                }
                
                if let piece = cell.piece {
                    piecesCount[piece, default: 0] += 1
                    
                    // Check for multiple ocurrences of the same piece
                    guard piecesCount[piece]! <= 1 else {
                        throw InvalidBoardError.multipleOccurrencesOfSamePiece(piece: piece)
                    }
                    
                    // Check for pieces with no owner
                    guard piece.owner != .noOne else {
                        throw InvalidBoardError.pieceWithNoOwner(piece: piece)
                    }
                }
            }
        }
        // Check for a bad number of pieces
        guard board.countPieces(of: .player1) <= MAX_NB_PIECES, board.countPieces(of: .player2) <= MAX_NB_PIECES else {
            throw InvalidBoardError.badNumberOfPieces
        }
        
        return true
    }
    
    /// Gets the next player to make a move.
    ///
    /// - Returns: The owner of the next move.
    public func getNextPlayer() -> Owner {
        if self.historic.last?.owner == .player1 {
            return .player2
        } else {
            return .player1
        }
    }
    
    /// Gets all possible moves for the specified owner on the given board.
    ///
    /// - Parameters:
    ///   - board: The game board.
    ///   - owner: The owner of the pieces.
    /// - Returns: An array of possible moves.
    public func getMoves(board: Board, owner: Owner) -> [Move] {
            var moves: [Move] = []
            
            // for every cell
            for row in 0..<board.nbRows {
                for column in 0..<board.nbColumns {
                    if let piece = board.grid[row][column].piece, piece.owner == owner {
                        let pieceMoves = getMoves(board: board, owner: owner, fromRow: row, andColumn: column)
                        moves.append(contentsOf: pieceMoves)
                    }
                }
            }
            
            return moves
        }
    
    /// Gets all possible moves for the specified owner from the specified cell on the given board.
    ///
    /// - Parameters:
    ///   - board: The game board.
    ///   - owner: The owner of the pieces.
    ///   - fromRow: The row index of the cell.
    ///   - andColumn: The column index of the cell.
    /// - Returns: An array of possible moves.
    public func getMoves(board: Board, owner: Owner, fromRow: Int, andColumn: Int) -> [Move] {
            var moves: [Move] = []
            
            // right, left, up, down
            let possibleDirections: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
            
            for direction in possibleDirections {
                let newRow = fromRow + direction.0
                let newColumn = andColumn + direction.1
                
                if newRow >= VerySimpleRules.NB_ROWS || newColumn >= VerySimpleRules.NB_COLUMNS {
                    continue
                }
                
                 do {
                    if try isMoveValid(board: board, fromRow: fromRow, fromColumn: andColumn, toRow: newRow, toColumn: newColumn, withOwner: owner) {
                        let move = Move(owner: owner, rowOrigin: fromRow, columnOrigin: andColumn, rowDestination: newRow, columnDestination: newColumn)
                        moves.append(move)
                    }
                } catch {
                    // Ignore the error and continue with the loop
                }
            }
            
            return moves
        }
    
    /// Checks if a move from one cell to another is valid on the given board.
    ///
    /// - Parameters:
    ///   - board: The game board.
    ///   - fromRow: The row index of the source cell.
    ///   - fromColumn: The column index of the source cell.
    ///   - toRow: The row index of the destination cell.
    ///   - toColumn: The column index of the destination cell.
    /// - Returns: A boolean value indicating whether the move is valid or not.
    public func isMoveValid(board: Board, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int, withOwner: Owner) throws -> Bool {
        /// Ensure that the move is within the board
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
        
        /// Ensure the player is owner of the piece he is trying to move
        guard board.grid[fromRow][fromColumn].piece?.owner == withOwner else {
            throw GameError.invalidMove
        }
        
        return true
    }
    
    /// Checks if a move is valid on the given board.
    ///
    /// - Parameters:
    ///   - board: The game board.
    ///   - move: The move to be checked.
    /// - Returns: A boolean value indicating whether the move is valid or not.
    public func isMoveValid(board: Board, move: Move) throws -> Bool {
        return try isMoveValid(board: board, fromRow: move.rowOrigin, fromColumn: move.columnOrigin, toRow: move.rowDestination, toColumn: move.columnDestination, withOwner: move.owner)
    }
    
    /// Checks if a move is valid on the given board.
    ///
    /// - Parameters:
    ///   - board: The game board.
    ///   - move: The move to be checked.
    /// - Returns: A boolean value indicating whether the move is valid or not.
    public func isGameOver(board: Board, lastRow: Int, lastColumn: Int, currentPlayer: Owner) -> (Bool, Result) {
        let lastCell = board.grid[lastRow][lastColumn]
        let opponent : Owner = currentPlayer == .player1 ? .player2 : .player1
        
        // Check if the last moved piece reached the opponent's den
        if lastCell.cellType == .den && lastCell.initialOwner == opponent {
            return (true, .winner(winningReason: .denReached))
        }
        
        // Check if oponent has any pieces left
        let opPieces = board.countPieces(of: opponent)
        if opPieces == 0 { return (true, .winner(winningReason: .noMorePieces)) }
        
        // Check if oponent has any moves left
        let oponentMoves: [Move] = getMoves(board: board, owner: opponent)
        if oponentMoves.isEmpty { return (true, .winner(winningReason: .noMovesLeft))}
                
        // The game is not over
        return (false, .notFinished)
    }
    
    public mutating func playedMove(move: Move, initialBoard: Board, endingBoard: Board) {
        // if key exists +1 else new key, value: 0
        ocurrences[endingBoard, default: 0] += 1
        historic.append(move)
    }
}
