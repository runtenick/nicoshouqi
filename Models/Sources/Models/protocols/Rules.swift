//
//  Rules.swift
//  
//
//  Created by étudiant on 22/01/2024.
//

import Foundation

/// The game rules protocol.
public protocol Rules {
    var ocurrences : [Board] { get }
    var historic : [Move] { get }
    
    static func createBoard() -> Board
    static func checkBoard(board: Board) throws -> Bool
    func getNextPlayer() -> Owner
    func getMoves(board: Board, owner: Owner) -> [Move]
    func getMoves(board: Board, owner: Owner, fromRow: Int, andColumn: Int) -> [Move]
    func isMoveValid(board: Board, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) throws -> Bool
    func isMoveValid(board: Board, move: Move) throws -> Bool
    func isGameOver(board: Board, lastRow: Int, lastColumn: Int, currentPlayer: Owner) -> (Bool, Result)
    mutating func playedMove(move: Move, initialBoard: Board, endingBoard: Board)
}
