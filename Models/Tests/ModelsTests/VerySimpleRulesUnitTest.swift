//
//  VerySimpleRulesUnitTest.swift
//  
//
//  Created by étudiant on 24/01/2024.
//

import Foundation
import XCTest
import Models

final class VerySimpleRulesUnitTest: XCTestCase {
    
    var rules: VerySimpleRules!
    var board: Board! = VerySimpleRules.createBoard()
    
    override func setUp() {
        super.setUp()
        rules = VerySimpleRules()
    }
    
    func testCreateBoard() {
        // Act
        let board = VerySimpleRules.createBoard()
        
        // Assert
        XCTAssertEqual(board.nbRows, 5)
        XCTAssertEqual(board.nbColumns, 5)
        
        // Check the den positions
        XCTAssertEqual(board.grid[0][2].cellType, CellType.den)
        XCTAssertEqual(board.grid[4][2].cellType, CellType.den)
        
        // Check for water and trap cells
        XCTAssertFalse(board.grid.contains { $0.contains { $0.cellType == CellType.water } })
        XCTAssertFalse(board.grid.contains { $0.contains { $0.cellType == CellType.trap } })
    }
    
    /// Tests the check board function.
    func testCheckBoard() throws {
        // Arrange
        let validBoard = VerySimpleRules.createBoard()
        
        // Act & Assert
        XCTAssertTrue(try VerySimpleRules.checkBoard(board: validBoard))
    }
    
    /// Tests the getNextPlayer function.
    func testGetNextPlayer() {
        /// Arrange
        let lastPlay: Move = Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 0, columnDestination: 1)
        rules.historic.append(lastPlay)
        
        /// Act & Assert
        XCTAssertEqual(rules.getNextPlayer(), .player2)
    }
    
    /// Tests the getMoves function.
    func testGetAllMoves() {
        
    }
    
    /// Tests getMoves from cell.
    func testGetMovesFromCell() {
        
    }
    
    /// Tests if a move is valid.
    func testIsMoveValid_ValidMove() throws {
        /// Act & Assert
        XCTAssertTrue(try rules.isMoveValid(board: board, fromRow: 0, fromColumn: 1, toRow: 1, toColumn: 1))
    }
    
    func testIsMoveValidFromMove_ValidMove() throws {
        /// Arrange
        let validMove: Move = Move(owner: .player1, rowOrigin: 0, columnOrigin: 1, rowDestination: 1, columnDestination: 1)
        
        /// Act & Assert
        XCTAssertTrue(try rules.isMoveValid(board: board, move: validMove))
    }
    
    /// Tests isGameOver function when a game isn't over.
//    func testIsGameOver_GameNotFinished() {
//            // Arrange
//        let board = VerySimpleRules.createBoard()
//            let currentPlayer: Owner = .player1
//            
//            // Act & Assert
//            XCTAssertNoThrow(try {
//                let (gameOver, result) = try rules.isGameOver(board: board, lastRow: 1, lastColumn: 1, currentPlayer: currentPlayer)
//                XCTAssertFalse(gameOver)
//                XCTAssertEqual(result, .notFinished)
//            }())
//        }
    
//    private func createSampleBoard(boardType: String) -> Board {
//
//        switch boardType {
//            case "gameNotOver":
//            let grid: [[Cell]] = [
//                        [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .den), Cell(cellType: .jungle), Cell(cellType: .jungle)],
//                        [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle)],
//                        [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle)],
//                        [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle)],
//                        [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .den), Cell(cellType: .jungle), Cell(cellType: .jungle)]
//                    ]
//                    return Board(grid: grid)!
//        default :
//            return VerySimpleRules.createBoard()
//        }
//    }
}
