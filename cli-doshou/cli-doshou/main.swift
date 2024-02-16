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

// ANIMAL
var testAnimal : Animal = .cat

let resultEnconded = try jsonEncoder.encode(testAnimal.rawValue)
print(testAnimal.rawValue)
print(String(data: resultEnconded, encoding: .utf8)!)

let resultDecoded = try jsonDecoder.decode(Animal.self, from: resultEnconded)
print(resultDecoded)

// OWNER
print("\n test owner")
var testOwner : Owner = .player1

let resultEnconded2 = try jsonEncoder.encode(testOwner)
print(testOwner)
print(String(data: resultEnconded2, encoding: .utf8)!)

let resultDecoded2 = try jsonDecoder.decode(Owner.self, from: resultEnconded2)
print(resultDecoded2)


// CELLTYPE
print("\n test cell type")
var testCellType : CellType = .den

let resultEnconded3 = try jsonEncoder.encode(testCellType)
print(testCellType)
print(String(data: resultEnconded3, encoding: .utf8)!)

let resultDecoded3 = try jsonDecoder.decode(CellType.self, from: resultEnconded3)
print(resultDecoded3)

// PIECE
print("\n test Piece type")
var testPiece : Piece = Piece(owner: .player1, animal: .elephant)

let resultEnconded4 = try jsonEncoder.encode(testPiece)
print(testPiece)
print(String(data: resultEnconded4, encoding: .utf8)!)

let resultDecoded4 = try jsonDecoder.decode(Piece.self, from: resultEnconded4)
print(resultDecoded4)

// MOVE
print("\n test Move type")
var testMove : Move = Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 1, columnDestination: 0)

let resultEnconded5 = try jsonEncoder.encode(testMove)
print(testMove)
print(String(data: resultEnconded5, encoding: .utf8)!)

let resultDecoded5 = try jsonDecoder.decode(Move.self, from: resultEnconded5)
print(resultDecoded5)

// CELL
print("\n test Cell type")
var testCell : Cell = Cell(cellType: .trap)

let resultEnconded6 = try jsonEncoder.encode(testMove)
print(testMove)
print(String(data: resultEnconded6, encoding: .utf8)!)

let resultDecoded6 = try jsonDecoder.decode(Move.self, from: resultEnconded6)
print(resultDecoded5)

// BOARD
print("\n test Board type")
var grid : [[Cell]] = []
var testBoard : Board = Board(grid: grid)!

let resultEnconded7 = try jsonEncoder.encode(testBoard)
print(testBoard)
print(String(data: resultEnconded7, encoding: .utf8)!)

let resultDecoded7 = try jsonDecoder.decode(Board.self, from: resultEnconded7)
print(resultDecoded7)

// RULES
print("\n test Rules type")
var testRules : Rules = VerySimpleRules()

/*
 let resultEnconded8 = try jsonEncoder.encode(testRules)
 print(testRules)
 print(String(data: resultEnconded8, encoding: .utf8)!)
 
 let resultDecoded8 = try jsonDecoder.decode(Rules.self, from: resultEnconded8)
 print(resultDecoded8)
 */
