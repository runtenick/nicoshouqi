//
//  Game.swift
//  
//
//  Created by étudiant on 04/02/2024.
//

import Foundation

/// The game structure.
public struct Game {
    public var rules : Rules
    public var theBoard : Board
    public let player1 : Player
    public let player2 : Player
    
    public var gameStartedNotification: ((Board) -> Void)? = nil
    public var nextPlayerNotification: ((Board, Player) -> Void)? = nil
    
    public init(withRules rules: Rules, andPlayer1 player1: Player, andPlayer2 player2: Player) {
        self.rules = rules
        self.player1 = player1
        self.player2 = player2
                
        self.theBoard = type(of: rules).createBoard()
    }
    
    public mutating func addGameStartedListener(callback: @escaping (Board) -> Void) {
        self.gameStartedNotification = callback
    }
    
    public mutating func addPlayerNotification(callback: @escaping (Board, Player) -> Void) {
        self.nextPlayerNotification = callback
    }
    
    /// The game loop starter function.
    public mutating func start() throws {
        // ! - Rework in progress - !
        
        // Game started notification
        if let gameStartedNotification {
            gameStartedNotification(self.theBoard)
        }
        
        // setup
        var currentPlayer: Player = self.player1 // the current player holder
        var nextPlayerId: Owner // the next player holder
        
        // to track the last cell
        var lastRow = 0
        var lastColumn = 0
        
        // the result holder
        var game_result: (Bool, Result) = (false, .notFinished)
        
        while game_result.0 == false {
            // Get the next player
            nextPlayerId = rules.getNextPlayer()
            currentPlayer = self.getPlayer(playerId: nextPlayerId)
            
            // Next player notification
            if let nextPlayerNotification {
                nextPlayerNotification(self.theBoard, currentPlayer)
            }
            
            guard let move = currentPlayer.chooseMove(in: theBoard, with: rules) else {
                // no moves were found, therefore the game is over
                game_result = rules.isGameOver(board: theBoard, lastRow: lastRow, lastColumn: lastColumn, currentPlayer: currentPlayer.id)
                break
            }
        
            // Keep asking for a move until valid
            while true {
                guard let move = currentPlayer.chooseMove(in: theBoard, with: rules) else {
                    // No moves were found therefore the game is over
                    game_result = rules.isGameOver(board: theBoard, lastRow: lastRow, lastColumn: lastColumn, currentPlayer: currentPlayer.id)
                    break
                }
                
                // Check if valid
                do {
                    let isMoveValid = try rules.isMoveValid(board: theBoard, move: move)
                    if isMoveValid {
                        // then play the move
                        let rowDest = move.rowDestination
                        let colDest = move.columnDestination
                        let rowOr = move.rowOrigin
                        let colOr = move.columnOrigin
                        
                        // save board
                        let board_before_move = self.theBoard
                        
                        // clear destination cell
                        if let _ = theBoard.grid[rowDest][colDest].piece {
                            // if there is a piece remove it
                            let remove_result = theBoard.removePiece(atRow: rowDest, andColumn: colDest)
                            guard remove_result == .ok else {
                                throw GameError.failedToRemovePiece
                            }
                        }
                        
                        // insert piece at new cell
                        let piece_to_move = theBoard.grid[rowOr][colOr].piece! // move is valid so there is a piece 100%
                        let insert_result = theBoard.insertPiece(piece: piece_to_move, atRow: rowDest, andColumn: colDest)
                        guard insert_result == .ok else {
                            throw GameError.failedToInsertPiece
                        }
                        
                        // remove piece on origin cell
                        let remove_result = theBoard.removePiece(atRow: rowOr, andColumn: colOr)
                        guard remove_result == .ok else {
                            throw GameError.failedToRemovePiece
                        }
                        
                        // officially play move
                        rules.playedMove(move: move, initialBoard: board_before_move, endingBoard: theBoard)
                        
                        // update last row/col indexes
                        lastRow = move.rowDestination
                        lastColumn = move.columnDestination
                        
                        // check if the game is over
                        game_result = rules.isGameOver(board: theBoard, lastRow: lastRow, lastColumn: lastColumn, currentPlayer: currentPlayer.id)
                    }
                } catch {
                    // invalid move so continue the loop
                }
            }
        }
    }
    
    private func getPlayer(playerId id: Owner) -> Player {
        return player1.id == id ? player1 : player2
    }
}
