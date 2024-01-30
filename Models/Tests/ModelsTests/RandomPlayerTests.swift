//
//  RandomPlayerTests.swift
//  
//
//  Created by étudiant on 29/01/2024.
//

import XCTest
@testable import Models

final class RandomPlayerTests: XCTestCase {

    var player: RandomPlayer!
    
    override func setUp() {
        player = RandomPlayer(withId: .player1, andName: "Bot")
    }
    
    /// Tests the initializer
    func testInitializer() {
        let expectedId = Owner.player2
        let expectedName = "Bot3000"
        
        if let player2 = RandomPlayer(withId: .player2, andName: "Bot3000") {
            XCTAssertEqual(player2.id, expectedId)
            XCTAssertEqual(player2.name, expectedName)
        }
        
    }
    
    /// Tests the chooseMove
    func testChooseMove() {
        // Arrange
        let grid: [[Cell]] = [
            [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .den), Cell(cellType: .jungle), Cell(cellType: .jungle)],
            [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle, piece: Piece(owner: .player1, animal: .rat)), Cell(cellType: .jungle), Cell(cellType: .jungle)],
            [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle)],
            [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle)],
            [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .den), Cell(cellType: .jungle), Cell(cellType: .jungle)]
        ]
        let board = Board(grid: grid)!
        let rules = VerySimpleRules()
        
        let move1 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 1, columnDestination: 3)
        let move2 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 1, columnDestination: 1)
        let move3 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 2, columnDestination: 2)
        let move4 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 0, columnDestination: 2)
        
        let possibleMoves = [move1, move2, move3, move4]
        
        // Act
        let randomMove = player.chooseMove(in: board, with: rules)!
        
        // Assert
        XCTAssertTrue(possibleMoves.contains(randomMove), "The chosen move should be one of the possible moves")
    }
    
    /// Tests choose move when returns an empty array
    func testChooseMoveEmpty() {
        // Arrange
        let rules = VerySimpleRules()
        let emptyGrid: [[Cell]] = [[]]
        let board = Board(grid: emptyGrid)!
                
        // Act
        let randomMove = player.chooseMove(in: board, with: rules)
        
        // Assert
        XCTAssertNil(randomMove)
    }
}
