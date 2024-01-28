//
//  Rules.swift
//  
//
//  Created by étudiant on 22/01/2024.
//

import Foundation

/// The game rules protocol.
public protocol Rules {
    // Board needs hashable so that Board instances can be used as a key in a dico
    var ocurrences : [Board:Int] { get }
    var historic : [Move] { get }
    
    static func createBoard() -> Board
    static func checkBoard(board: Board) throws -> Bool
    func getNextPlayer() -> Owner
    func getMoves(board: Board, owner: Owner) throws -> [Move]
    func getMoves(board: Board, owner: Owner, fromRow: Int, andColumn: Int) throws -> [Move]
    func isMoveValid(board: Board, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) throws -> Bool
    func isMoveValid(board: Board, move: Move) throws -> Bool
    func isGameOver(board: Board, lastRow: Int, lastColumn: Int, currentPlayer: Owner) throws -> (Bool, Result)
    mutating func playedMove(move: Move, initialBoard: Board, endingBoard: Board)
}
