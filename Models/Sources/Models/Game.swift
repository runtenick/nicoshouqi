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
    
    public let gameStartedNotification: (() -> Void)?
    
    public init(withRules rules: Rules, andPlayer1 player1: Player, andPlayer2 player2: Player,
                gameStartedNotif: (() -> Void)? = nil) {
        self.rules = rules
        self.player1 = player1
        self.player2 = player2
        
        // callbacks if given
        gameStartedNotification = gameStartedNotif
        
        self.theBoard = type(of: rules).createBoard()
    }
    
    /// The game loop starter function.
    public mutating func start() throws {
        // Copy pasted my cli main loop
        // ! - Rework in progress - !
        
        // setup
        var currentPlayer: Player = self.player1 // the current player holder
        var nextPlayerId: Owner // the next player holder
        
        // to track the last cell
        var lastRow = 0
        var lastColumn = 0
        
        // the result holder
        var game_result: (Bool, Result) = (false, .notFinished)
        
        // Game started notification
        if let gameStartedNotification {
            gameStartedNotification()
        }
        
        gameLoop: while game_result.0 == false {
            
            // Get the next player
            nextPlayerId = rules.getNextPlayer()
            currentPlayer = self.getPlayer(playerId: nextPlayerId)
            
            var isMoveValid = false // move is valid flag
            
            // loop until move is valid or no moves left
            while isMoveValid == false {
                // Choose a move
                if let move = currentPlayer.chooseMove(in: theBoard, with: rules) {
                    // A move was found
                    print("[a move was found] \n \(move) \n")
                    
                    // Check if valid
                    do {
                        isMoveValid = try rules.isMoveValid(board: theBoard, move: move)
                        
                        // move is valid since no error watch caught
                        print("\n [move valid] \n \(move) \n")
                        
                        // save board
                        let board_before_move = theBoard
                        
                        // play the move
                        let rowDest = move.rowDestination
                        let colDest = move.columnDestination
                        let rowOr = move.rowOrigin
                        let colOr = move.columnOrigin
                        
                        print("origin cell \(theBoard.grid[rowOr][colOr])")
                        print("destination cell \(theBoard.grid[rowDest][colDest])")
                        
                        // clear destination cell
                        if let _ = theBoard.grid[rowDest][colDest].piece {
                            // if there is a piece remove it
                            let remove_result = theBoard.removePiece(atRow: rowDest, andColumn: colDest)
                            guard remove_result == .ok else {
                                print("failed to remove a piece on destination cell, reason: \(remove_result)")
                                print("row destination: \(rowDest)")
                                print("column destination: \(colDest) \n")
                                
                                break gameLoop // stop game
                            }
                        }
                        
                        // insert piece at new cell
                        let piece_to_move = theBoard.grid[rowOr][colOr].piece! // move is valid so there is a piece 100%
                        let insert_result = theBoard.insertPiece(piece: piece_to_move, atRow: rowDest, andColumn: colDest)
                        guard insert_result == .ok else {
                            print("failed to insert a piece at destination cell, reason: \(insert_result)")
                            print("row destination: \(rowDest)")
                            print("column destination: \(colDest) \n")
                            
                            break gameLoop // stop game
                        }
                        
                        // remove piece on origin cell
                        let remove_result = theBoard.removePiece(atRow: rowOr, andColumn: colOr)
                        guard remove_result == .ok else {
                            print("failed to remove a piece at origin cell, reason: \(remove_result) \n")
                            print("row origin: \(rowOr)")
                            print("column origin: \(colOr) \n")
                            
                            break gameLoop // stop game
                        }
                        
                        // officially play move
                        rules.playedMove(move: move, initialBoard: board_before_move, endingBoard: theBoard)
                        
                        // update last row/col indexes
                        lastRow = move.rowDestination
                        lastColumn = move.columnDestination
                        
                    } catch {
                        print("Choosen move is not valid, try again.")
                        isMoveValid = false
                    }
                } else {
                    // No move was found, therefore game is over with noMovesLeft as a reason
                    print("[move was nil]")
                    print("GAME ENDED")
                    game_result = rules.isGameOver(board: theBoard, lastRow: lastRow, lastColumn: lastColumn, currentPlayer: currentPlayer.id)
                    print(game_result.1)
                    break gameLoop
                }
                
                // a move was officially played
                print("New Board")
                print(theBoard)
                print("\n")
            }
            
            print("next turn...")
            //sleep(1)
        }

        print("GAME ENDED")
        game_result = rules.isGameOver(board: theBoard, lastRow: lastRow, lastColumn: lastColumn, currentPlayer: currentPlayer.id)
        print(game_result.1)
    }
    
    private func getPlayer(playerId id: Owner) -> Player {
        return player1.id == id ? player1 : player2
    }
}
