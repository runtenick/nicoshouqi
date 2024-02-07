//
//  Rules.swift
//  
//
//  Created by étudiant on 22/01/2024.
//

import Foundation

/// The game rules protocol.
public protocol Rules {
    /// A dictionary that stores the occurrences of each board configuration.
    // Board needs hashable so that Board instances can be used as a key in a dico
    var ocurrences : [Board:Int] { get }
    
    /// An array that stores the historic moves.
    var historic : [Move] { get }
    
    /// Creates a new game board.
    ///
    /// - Returns: A new instance of the game board.
    static func createBoard() -> Board
    
    /// Checks if the given board is valid according to the game rules.
    ///
    /// - Parameter board: The board to be checked.
    /// - Returns: A boolean value indicating whether the board is valid or not.
    static func checkBoard(board: Board) throws -> Bool
    
    /// Gets the next player to make a move.
    ///
    /// - Returns: The owner of the next move.
    func getNextPlayer() -> Owner
    
    /// Gets all possible moves for the specified owner on the given board.
    ///
    /// - Parameters:
    ///   - board: The game board.
    ///   - owner: The owner of the pieces.
    /// - Returns: An array of possible moves.
    func getMoves(board: Board, owner: Owner) -> [Move]
    
    /// Gets all possible moves for the specified owner from the specified cell on the given board.
    ///
    /// - Parameters:
    ///   - board: The game board.
    ///   - owner: The owner of the pieces.
    ///   - fromRow: The row index of the cell.
    ///   - andColumn: The column index of the cell.
    /// - Returns: An array of possible moves.
    func getMoves(board: Board, owner: Owner, fromRow: Int, andColumn: Int) -> [Move]
    
    /// Checks if a move from one cell to another is valid on the given board.
    ///
    /// - Parameters:
    ///   - board: The game board.
    ///   - fromRow: The row index of the source cell.
    ///   - fromColumn: The column index of the source cell.
    ///   - toRow: The row index of the destination cell.
    ///   - toColumn: The column index of the destination cell.
    /// - Returns: A boolean value indicating whether the move is valid or not.
    func isMoveValid(board: Board, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int, withOwner: Owner) throws -> Bool
    
    /// Checks if a move is valid on the given board.
    ///
    /// - Parameters:
    ///   - board: The game board.
    ///   - move: The move to be checked.
    /// - Returns: A boolean value indicating whether the move is valid or not.
    func isMoveValid(board: Board, move: Move) throws -> Bool
    
    /// Checks if the game is over on the given board after the last move.
    ///
    /// - Parameters:
    ///   - board: The game board.
    ///   - lastRow: The row index of the last move.
    ///   - lastColumn: The column index of the last move.
    ///   - currentPlayer: The owner of the last move.
    /// - Returns: A tuple containing a boolean value indicating whether the game is over or not, and the result of the game.
    func isGameOver(board: Board, lastRow: Int, lastColumn: Int, currentPlayer: Owner) -> (Bool, Result)
    
    /// Updates the game state after a move has been played.
    ///
    /// - Parameters:
    ///   - move: The move that was played.
    ///   - initialBoard: The initial game board.
    ///   - endingBoard: The game board after the move.
    mutating func playedMove(move: Move, initialBoard: Board, endingBoard: Board)
}
