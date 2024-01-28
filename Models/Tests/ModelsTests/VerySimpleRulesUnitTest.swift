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
    func testGetAllMoves() throws {
        // Arrange
        let board = self.createSampleBoard(boardType: "onePieceGrid")
        let rules = VerySimpleRules()
        let move1 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 1, columnDestination: 3)
        let move2 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 1, columnDestination: 1)
        let move3 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 2, columnDestination: 2)
        let move4 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 0, columnDestination: 2)
        
        let movesExpected = [move1, move2, move3, move4]
        
        // Act
        let movesResult = try rules.getMoves(board: board, owner: .player1)
        
        // Assert
        XCTAssertEqual(movesResult.count, 4)
        XCTAssertEqual(movesResult, movesExpected)
        
    }
    
    /// Tests getMoves from cell.
    func testGetMovesFromCell() {
        // Create a sample board
        let board = createSampleBoard(boardType: "onePieceGrid")
            
        let rules = VerySimpleRules()
        let move1 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 1, columnDestination: 3)
        let move2 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 1, columnDestination: 1)
        let move3 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 2, columnDestination: 2)
        let move4 = Move(owner: .player1, rowOrigin: 1, columnOrigin: 2, rowDestination: 0, columnDestination: 2)
        
        let movesExpected = [move1, move2, move3, move4]
        
        do {
            let moves = try rules.getMoves(board: board, owner: .player1, fromRow: 1, andColumn: 2)
            
            // Assert the expected number of moves
            XCTAssertEqual(moves.count, 4)
            XCTAssertEqual(moves, movesExpected)
            
            
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
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
    
    private func createSampleBoard(boardType: String) -> Board {

        switch boardType {
            case "emptyValidGrid":
                let grid: [[Cell]] = [
                    [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .den), Cell(cellType: .jungle), Cell(cellType: .jungle)],
                    [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle)],
                    [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle)],
                    [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle)],
                    [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .den), Cell(cellType: .jungle), Cell(cellType: .jungle)]
                ]
                return Board(grid: grid)!
            case "onePieceGrid" :
                let grid: [[Cell]] = [
                    [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .den), Cell(cellType: .jungle), Cell(cellType: .jungle)],
                    [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle, piece: Piece(owner: .player1, animal: .rat)), Cell(cellType: .jungle), Cell(cellType: .jungle)],
                    [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle)],
                    [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .jungle)],
                    [Cell(cellType: .jungle), Cell(cellType: .jungle), Cell(cellType: .den), Cell(cellType: .jungle), Cell(cellType: .jungle)]
                ]
                return Board(grid: grid)!
        default :
            return VerySimpleRules.createBoard()
        }
    }
}
