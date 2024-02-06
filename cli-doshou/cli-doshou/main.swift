//
//  main.swift
//  cli-doshou
//
//  Created by étudiant on 10/01/2024.
//

import Models
import ModelExtensionEmoji
import Foundation

// board and rules
//let rules = VerySimpleRules()
//var board = VerySimpleRules.createBoard()
//
//print(board.classique)

func getUserInput(humanPlayer: HumanPlayer) -> Move {
    // Prompt the user for input and read the values
    print("Enter your move:")
    print("From row:")
    let fromRow = Int(readLine() ?? "") ?? 0
    
    print("From column:")
    let fromColumn = Int(readLine() ?? "") ?? 0
    
    print("To row:")
    let toRow = Int(readLine() ?? "") ?? 0
    
    print("To column:")
    let toColumn = Int(readLine() ?? "") ?? 0
    
    // Create and return the Move object
    return Move(owner: humanPlayer.id, rowOrigin: fromRow, columnOrigin: fromColumn, rowDestination: toRow, columnDestination: toColumn)
}

//if let player1 = HumanPlayer(withId: .player1, andName: "player one", andInputMethod: getUserInput) {
//    let move1 = player1.inputMethod(player1)
//    // check if move was properly created
//    print(move1)
//
//    // try choose move
//    if let move1 = player1.chooseMove(in: board, with: rules) {
//        print(move1)
//    }
//}
//
//// See how bot performs
//if let bot = RandomPlayer(withId: .player2, andName: "boto") {
//    if let move2 = bot.chooseMove(in: board, with: rules) {
//        // check if move was properly created
//        print(move2)
//    } else {
//        print("bot had no valid moves 😭")
//    }
//}


// SETUP GAME VARIABLES :
var rules = VerySimpleRules()
var theBoard = VerySimpleRules.createBoard()

print("starting board : ")
print(theBoard)

var lastRow: Int = 0
var lastColumn: Int = 0

var playerOne = RandomPlayer(withId: .player1, andName: "boto")!
var playerTwo = RandomPlayer(withId: .player2, andName: "bota")!

var currentPlayer: Player = playerOne
var nextPlayer: Owner

// Notifications test
func gameStarted() -> Void {
    print("**************************************")
    print("        ==>> GAME STARTS! <<==        ")
    print("**************************************")
}

var game = Game(withRules: rules, andPlayer1: playerOne, andPlayer2: playerTwo)
game.addGameStartedListener(listener: gameStarted)

try game.start()



//// - GAME LOOP -
//gameLoop: while(!rules.isGameOver(board: theBoard, lastRow: lastRow, lastColumn: lastColumn, currentPlayer: currentPlayer.id).0) {
//
//    // Get the next player
//    nextPlayer = rules.getNextPlayer()
//    currentPlayer = playerOne.id == nextPlayer ? playerOne : playerTwo
//
//    var isMoveValid = false // move is valid flag
//
//    // loop until move is valid or no moves left
//    while isMoveValid == false {
//        // Choose a move
//        if let move = currentPlayer.chooseMove(in: theBoard, with: rules) {
//            // A move was found
//            print("[a move was found] \n \(move) \n")
//
//            // Check if valid
//            do {
//                isMoveValid = try rules.isMoveValid(board: theBoard, move: move)
//
//                // move is valid since no error watch caught
//                print("\n [move valid] \n \(move) \n")
//
//                // save board
//                let board_before_move = theBoard
//
//                // play the move
//                let rowDest = move.rowDestination
//                let colDest = move.columnDestination
//                let rowOr = move.rowOrigin
//                let colOr = move.columnOrigin
//
//                print("origin cell \(theBoard.grid[rowOr][colOr])")
//                print("destination cell \(theBoard.grid[rowDest][colDest])")
//
//                // clear destination cell
//                if let _ = theBoard.grid[rowDest][colDest].piece {
//                    // if there is a piece remove it
//                    let remove_result = theBoard.removePiece(atRow: rowDest, andColumn: colDest)
//                    guard remove_result == .ok else {
//                        print("failed to remove a piece on destination cell, reason: \(remove_result)")
//                        print("row destination: \(rowDest)")
//                        print("column destination: \(colDest) \n")
//
//                        break gameLoop // stop game
//                    }
//                }
//
//                // insert piece at new cell
//                let piece_to_move = theBoard.grid[rowOr][colOr].piece! // move is valid so there is a piece 100%
//                let insert_result = theBoard.insertPiece(piece: piece_to_move, atRow: rowDest, andColumn: colDest)
//                guard insert_result == .ok else {
//                    print("failed to insert a piece at destination cell, reason: \(insert_result)")
//                    print("row destination: \(rowDest)")
//                    print("column destination: \(colDest) \n")
//
//                    break gameLoop // stop game
//                }
//
//                // remove piece on origin cell
//                let remove_result = theBoard.removePiece(atRow: rowOr, andColumn: colOr)
//                guard remove_result == .ok else {
//                    print("failed to remove a piece at origin cell, reason: \(remove_result) \n")
//                    print("row origin: \(rowOr)")
//                    print("column origin: \(colOr) \n")
//
//                    break gameLoop // stop game
//                }
//
//                // officially play move
//                rules.playedMove(move: move, initialBoard: board_before_move, endingBoard: theBoard)
//
//            } catch GameError.invalidMove {
//                print("Choosen move is not valid, try again.")
//                continue
//            }
//        } else {
//            // No move was found, therefore game is over with noMovesLeft as a reason
//            print("[move was nil]")
//        }
//
//        // a move was officially played
//        print("New Board")
//        print(theBoard)
//        print("\n")
//    }
//
//    print("next turn...")
    //sleep()
//}

print("GAME ENDED")
let result = rules.isGameOver(board: theBoard, lastRow: lastRow, lastColumn: lastColumn, currentPlayer: currentPlayer.id)
print(result.1)

// -- ------ --



