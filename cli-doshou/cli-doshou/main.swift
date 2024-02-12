//
//  main.swift
//  cli-doshou
//
//  Created by étudiant on 10/01/2024.
//

import Models
import ModelExtensionEmoji
import Persistance
import Foundation

// board and rules
//let rules = VerySimpleRules()
//var board = VerySimpleRules.createBoard()
//
//print(board.classique)

//func getUserInput(humanPlayer: HumanPlayer) -> Move {
//    // Prompt the user for input and read the values
//    print("Choosing move...")
//    print("From row:")
//    let fromRow = Int(readLine() ?? "") ?? 0
//
//    print("From column:")
//    let fromColumn = Int(readLine() ?? "") ?? 0
//
//    print("To row:")
//    let toRow = Int(readLine() ?? "") ?? 0
//
//    print("To column:")
//    let toColumn = Int(readLine() ?? "") ?? 0
//
//    // Create and return the Move object
//    return Move(owner: humanPlayer.id, rowOrigin: fromRow, columnOrigin: fromColumn, rowDestination: toRow, columnDestination: toColumn)
//}
//
////if let player1 = HumanPlayer(withId: .player1, andName: "player one", andInputMethod: getUserInput) {
////    let move1 = player1.inputMethod(player1)
////    // check if move was properly created
////    print(move1)
////
////    // try choose move
////    if let move1 = player1.chooseMove(in: board, with: rules) {
////        print(move1)
////    }
////}
////
////// See how bot performs
////if let bot = RandomPlayer(withId: .player2, andName: "boto") {
////    if let move2 = bot.chooseMove(in: board, with: rules) {
////        // check if move was properly created
////        print(move2)
////    } else {
////        print("bot had no valid moves 😭")
////    }
////}
//
//
//// SETUP GAME VARIABLES :
//var rules = VerySimpleRules()
//var theBoard = VerySimpleRules.createBoard()
//
//var lastRow: Int = 0
//var lastColumn: Int = 0
//
//var playerOne = RandomPlayer(withId: .player1, andName: "boto")!
////var playerTwo = RandomPlayer(withId: .player2, andName: "bota")!
//var playerTwo = HumanPlayer(withId: .player2, andName: "nico", andInputMethod: getUserInput)!
//
//var currentPlayer: Player = playerOne
//var nextPlayer: Owner
//
//// Notifications test
//var game = Game(withRules: rules, andPlayer1: playerOne, andPlayer2: playerTwo)
//
//// GAME STARTED
//func gameStarted(board: Board) -> Void {
//    print(board)
//
//    print("**************************************")
//    print("        ==>> GAME STARTS! <<==        ")
//    print("**************************************\n")
//}
//
//game.addGameStartedNotification(callback: gameStarted)
//
//// NEXT PLAYER
//func nextPlayer(board: Board, player: Player) {
//    print(board)
//    print("**************************************")
//    print("Player \(player.id) - \(player.name), it's your turn!")
//    print("**************************************\n")
//}
//game.addPlayerNotification(callback: nextPlayer)
//
//// IS GAME OVER ?
//func isGameOverNotif(board: Board, player: Player, result: (Bool, Result)) {
//    if result.0 == false {
//        print("**************************************")
//        print("Game is not over yet !")
//        print("**************************************\n")
//    } else {
//        print("**************************************")
//        print("Game Over !!!")
//        print("and the winner is...\(player.name)!")
//        print("\(result.1)")
//        print("**************************************\n")
//    }
//}
//game.addIsGameOverNotification(callback: isGameOverNotif)
//
//// BOARD CHANGED
//func boardChangedNotif(newBoard board: Board) {
//    print("**************************************")
//    print("The board has changed.")
//    print(board)
//    print("**************************************\n")
//}
//game.addboardChangedNotification(callback: boardChangedNotif)
//
//// MOVE WAS CHOSEN
//func moveWasChosenNotif(chosenMove move: Move) {
//    print("**************************************")
//    print("A new move was chosen.")
//    print("Player \(move).")
//    print("**************************************\n")
//}
//game.addMoveWasChosenNotification(callback: moveWasChosenNotif)
//
//// MOVE WAS NOT VALID
//func moveNotValidNotif(badMove move: Move) {
//    print("**************************************")
//    print("(Player \(move.owner) tried to play piece at row \(move.rowOrigin) and column \(move.columnOrigin), to row \(move.rowDestination) and column \(move.columnDestination))")
//    print("This move is not valid !")
//    print("Choose again.")
//    print("**************************************\n")
//}
//game.addMoveNotValidNotification(callback: moveNotValidNotif)
//
//try game.start()

var jsonEncoder = JSONEncoder()
var jsonDecoder = JSONDecoder()

var testAnimal : Animal = .cat

let resultEnconded = try jsonEncoder.encode(testAnimal.rawValue)
print(testAnimal.rawValue)
print(String(data: resultEnconded, encoding: .utf8)!)

let resultDecoded = try jsonDecoder.decode(Animal.self, from: resultEnconded)
print(resultDecoded)

