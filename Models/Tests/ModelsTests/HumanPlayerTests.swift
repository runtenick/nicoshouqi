//
//  HumanPlayerTests.swift
//  
//
//  Created by étudiant on 29/01/2024.
//

import XCTest
@testable import Models

final class HumanPlayerTests: XCTestCase {

    var player: HumanPlayer!
    
    override func setUp() {
        let mockMove = Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 0, columnDestination: 1)
        
        player = HumanPlayer(withId: .player1, andName: "Human", andInputMethod: { _ in mockMove })
    }
    
    /// Tests the initializer
    func testInitializer() {
        let expectedId = Owner.player2
        let expectedName = "Human3000"
        let expectedMove = Move(owner: .player2, rowOrigin: 0, columnOrigin: 0, rowDestination: 0, columnDestination: 1)
        
        if let human = HumanPlayer(withId: .player2, andName: "Human3000", andInputMethod: { _ in expectedMove }) {
            XCTAssertEqual(human.id, expectedId)
            XCTAssertEqual(human.name, expectedName)
        }
    }
    
    /// Tests the choose move method.
    func testChooseMove_validMove() {
        // Arrange
        let grid = generateBoard()
        let board = Board(grid: grid)!
        let rules = VerySimpleRules()
        let validMove = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 1, columnDestination: 3)
        
        let humanPlayer = HumanPlayer(withId: .player1, andName: "human", andInputMethod: { _ in validMove })!
        
        // Act
        let result = humanPlayer.chooseMove(in: board, with: rules)
        
        // Assert
        XCTAssertEqual(result, validMove)

    }
    
    /// Tests the choose move method for an invalid move.
    func testChooseMove_invalidMove() {
        // Arrange
        let grid = generateBoard()
        let board = Board(grid: grid)!
        let rules = VerySimpleRules()
        let invalidMove = Move(owner: .player1, rowOrigin: 1, columnOrigin: 0, rowDestination: 1, columnDestination: 0)
        
        let humanPlayer = HumanPlayer(withId: .player1, andName: "human", andInputMethod: { _ in invalidMove })!

        // Act
        let result = humanPlayer.chooseMove(in: board, with: rules)
        
        // Assert
        XCTAssertNil(result)
    }
    
    private func generateBoard() -> [[Cell]] {
        let grid: [[Cell]] = [
            [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .den), Cell(cellType: .jungle), Cell(cellType: .jungle)],
            [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle, piece: Piece(owner: .player1, animal: .rat)), Cell(cellType: .jungle), Cell(cellType: .jungle)],
            [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle)],
            [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle)],
            [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .den), Cell(cellType: .jungle), Cell(cellType: .jungle)]
        ]
        return grid
    }

}
