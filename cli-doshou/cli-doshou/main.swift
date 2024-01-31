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





