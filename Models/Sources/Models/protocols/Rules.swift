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
    static func checkBoard(board: Board) -> Bool
    func getNextPlayer() -> Owner
    func getMoves(board: Board, owner: Owner) -> [Move]
    func getMoves(board: Board, owner: Owner, fromRow: Int, andColumn: Int) -> [Move]
    func isMoveValid(board: Board, fromRow: Int, fromColumn: Int, toRow: Int, toColumn: Int) -> Bool
    func isMoveValid(board: Board, move: Move) -> Bool
    func isGameOver(board: Board, lastRow: Int, lastColumn: Int) -> (Bool, Result)
    func playedMove(move: Move, initialBoard: Board, endingBoard: Board)
}
