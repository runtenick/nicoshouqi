//
//  main.swift
//  cli-doshou
//
//  Created by étudiant on 10/01/2024.
//

import Models
import ModelExtensionEmoji

// board and rules
let rules = VerySimpleRules()
var board = VerySimpleRules.createBoard()

print(board.classique)

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

if let player1 = HumanPlayer(withId: .player1, andName: "player one", andInputMethod: getUserInput) {
    let move1 = player1.inputMethod(player1)
    // check if move was properly created
    print(move1)
    
    // try choose move
    if let move1 = player1.chooseMove(in: board, with: rules) {
        print(move1)
    }
}

// See how bot performs
if let bot = RandomPlayer(withId: .player2, andName: "boto") {
    if let move2 = bot.chooseMove(in: board, with: rules) {
        // check if move was properly created
        print(move2)
    } else {
        print("bot had no valid moves 😭")
    }
}

var lastRow: Int = 0
var lastColumn: Int = 0

var playerOne = RandomPlayer(withId: .player1, andName: "boto")!
var playerTwo = RandomPlayer(withId: .player2, andName: "bota")!
var currentPlayer: Player = playerOne
var nextPlayer: Owner


// - GAME LOOP -
while(!rules.isGameOver(board: board, lastRow: lastRow, lastColumn: lastColumn, currentPlayer: currentPlayer.id).0) {
    
    // Get the next player
    nextPlayer = rules.getNextPlayer()
    currentPlayer = playerOne.id == nextPlayer ? playerOne : playerTwo
    
    // Choose a move
    var moveValidFlag = false
    if var move = currentPlayer.chooseMove(in: board, with: rules) {
        print("Move was choosen: \(move)")
        while(moveValidFlag == false) {
            do {
                var moveValidFlag = try rules.isMoveValid(board: board, move: move)
                
            } catch {
                print("Chosen move was not valid. Trying again...")
            }
        }
        
    } else {
        // if move is nil it means there are no moves avaible (since we are using bots)
        var res = rules.isGameOver(board: board, lastRow: lastRow, lastColumn: lastColumn, currentPlayer: currentPlayer.id)
    }
    
    
    
}

// -- ------ --



