//
//  File.swift
//  
//
//  Created by étudiant on 16/01/2024.
//

import Foundation
import XCTest
@testable import Models

class BoardTests : XCTestCase {
    
    // implicitly unwrapped optional
    var board: Board!
    
    // before each
    override func setUp() {
        super.setUp()
        
        // player 1
        let rat1 = Piece(owner: .player1, animal: .rat)
        let cat1 = Piece(owner: .player1, animal: .cat)
        let dog1 = Piece(owner: .player1, animal: .dog)
        let wolf1 = Piece(owner: .player1, animal: .wolf)
        let leopard1 = Piece(owner: .player1, animal: .leopard)
        let tiger1 = Piece(owner: .player1, animal: .tiger)
        let lion1 = Piece(owner: .player1, animal: .lion)
        let elephant1 = Piece(owner: .player1, animal: .elephant)

        // player 2
        let rat2 = Piece(owner: .player2, animal: .rat)
        let cat2 = Piece(owner: .player2, animal: .cat)
        let dog2 = Piece(owner: .player2, animal: .dog)
        let wolf2 = Piece(owner: .player2, animal: .wolf)
        let leopard2 = Piece(owner: .player2, animal: .leopard)
        let tiger2 = Piece(owner: .player2, animal: .tiger)
        let lion2 = Piece(owner: .player2, animal: .lion)
        let elephant2 = Piece(owner: .player2, animal: .elephant)

        // Board Cells
        let cell00 = Cell(cellType: .jungle, piece: lion1)
        let cell01 = Cell(cellType: .jungle)
        let cell02 = Cell(cellType: .trap)
        let cell03 = Cell(cellType: .den)
        let cell04 = Cell(cellType: .trap)
        let cell05 = Cell(cellType: .jungle)
        let cell06 = Cell(cellType: .jungle, piece: tiger1)
        let row1 = [cell00, cell01, cell02, cell03, cell04, cell05, cell06]

        let cell10 = Cell(cellType: .jungle)
        let cell11 = Cell(cellType: .jungle, piece: dog1)
        let cell12 = Cell(cellType: .jungle)
        let cell13 = Cell(cellType: .trap)
        let cell14 = Cell(cellType: .jungle)
        let cell15 = Cell(cellType: .jungle, piece: cat1)
        let cell16 = Cell(cellType: .jungle)
        let row2 = [cell10, cell11, cell12, cell13, cell14, cell15, cell16]


        let cell20 = Cell(cellType: .jungle, piece: rat1)
        let cell21 = Cell(cellType: .jungle)
        let cell22 = Cell(cellType: .jungle, piece: leopard1)
        let cell23 = Cell(cellType: .jungle)
        let cell24 = Cell(cellType: .jungle, piece: wolf1)
        let cell25 = Cell(cellType: .jungle)
        let cell26 = Cell(cellType: .jungle, piece: elephant1)
        let row3 = [cell20, cell21, cell22, cell23, cell24, cell25, cell26]


        let cell30 = Cell(cellType: .jungle)
        let cell31 = Cell(cellType: .water)
        let cell32 = Cell(cellType: .water)
        let cell33 = Cell(cellType: .jungle)
        let cell34 = Cell(cellType: .water)
        let cell35 = Cell(cellType: .water)
        let cell36 = Cell(cellType: .jungle)
        let row4 = [cell30, cell31, cell32, cell33, cell34, cell35, cell36]


        let cell40 = Cell(cellType: .jungle)
        let cell41 = Cell(cellType: .water)
        let cell42 = Cell(cellType: .water)
        let cell43 = Cell(cellType: .jungle)
        let cell44 = Cell(cellType: .water)
        let cell45 = Cell(cellType: .water)
        let cell46 = Cell(cellType: .jungle)
        let row5 = [cell40, cell41, cell42, cell43, cell44, cell45, cell46]


        let cell50 = Cell(cellType: .jungle)
        let cell51 = Cell(cellType: .water)
        let cell52 = Cell(cellType: .water)
        let cell53 = Cell(cellType: .jungle)
        let cell54 = Cell(cellType: .water)
        let cell55 = Cell(cellType: .water)
        let cell56 = Cell(cellType: .jungle)
        let row6 = [cell50, cell51, cell52, cell53, cell54, cell55, cell56]


        let cell60 = Cell(cellType: .jungle)
        let cell61 = Cell(cellType: .water)
        let cell62 = Cell(cellType: .water)
        let cell63 = Cell(cellType: .jungle)
        let cell64 = Cell(cellType: .water)
        let cell65 = Cell(cellType: .water)
        let cell66 = Cell(cellType: .jungle)
        let row7 = [cell60, cell61, cell62, cell63, cell64, cell65, cell66]


        let cell70 = Cell(cellType: .jungle, piece: elephant2)
        let cell71 = Cell(cellType: .jungle)
        let cell72 = Cell(cellType: .jungle, piece: wolf2)
        let cell73 = Cell(cellType: .jungle)
        let cell74 = Cell(cellType: .jungle, piece: leopard2)
        let cell75 = Cell(cellType: .jungle)
        let cell76 = Cell(cellType: .jungle, piece: rat2)
        let row8 = [cell70, cell71, cell72, cell73, cell74, cell75, cell76]


        let cell80 = Cell(cellType: .jungle)
        let cell81 = Cell(cellType: .jungle, piece: cat2)
        let cell82 = Cell(cellType: .jungle)
        let cell83 = Cell(cellType: .trap)
        let cell84 = Cell(cellType: .jungle)
        let cell85 = Cell(cellType: .jungle, piece: dog2)
        let cell86 = Cell(cellType: .jungle)
        let row9 = [cell80, cell81, cell82, cell83, cell84, cell85, cell86]


        let cell90 = Cell(cellType: .jungle, piece: tiger2)
        let cell91 = Cell(cellType: .jungle)
        let cell92 = Cell(cellType: .trap)
        let cell93 = Cell(cellType: .den)
        let cell94 = Cell(cellType: .trap)
        let cell95 = Cell(cellType: .jungle)
        let cell96 = Cell(cellType: .jungle, piece: lion2)
        let row10 = [cell90, cell91, cell92, cell93, cell94, cell95, cell96]

        let grid = [row1, row2, row3, row4, row5, row6, row7, row8, row9, row10]
        
        board = Board(grid: grid)
    }
    
    // after each
    override func tearDown() {
        board = nil
        super.tearDown()
    }
    
    /// Tests the board initializer.
    func testBoardInitilizerValidGrid(){
        XCTAssertNotNil(board)
        
        XCTAssertEqual(board.nbColumns, 7)
        XCTAssertEqual(board.nbRows, 10)
    }
    
    /// Tests the board initializer with an invalid grid.
    func testBoardInitializerInvalidGrid() {
        /// Arrange
        let cell = Cell(cellType: .jungle)
        let invalidGrid = [[cell, cell], [cell, cell, cell]]
        
        /// Act
        let board = Board(grid: invalidGrid)
        
        /// Assert
        XCTAssertNil(board)
    }
    
    /// Tests the board initializer with an empty grid.
    func testBoardInitializerEmptyGrid(){
        /// Arrange
        let emptyGrid: [[Cell]] = []
        
        /// Act
        let board = Board(grid: emptyGrid)
        
        /// Assert
        XCTAssertNotNil(board)
        XCTAssertEqual(board?.nbRows, 0)
        XCTAssertEqual(board?.nbColumns, 0)
    }
    
    /// Tests the count pieces method.
    func testCountPieces() {
        let player1PieceCount = board.countPieces(of: .player1)
        let player2PieceCount = board.countPieces(of: .player2)
        
        XCTAssertEqual(player1PieceCount, 8, "Expected player1 count to be 8, but got \(player1PieceCount)")
        XCTAssertEqual(player1PieceCount, 8, "Expected player2 count to be 8, but got \(player2PieceCount)")
    }
    
    /// Tests the count pieces method, returning a tuple.
    func testCountPiecesWithTuple() {
        
        /// Arrange
        let expectedTuple = (playerOneCount:8, playerTwoCount: 8)
        
        /// Act
        let returnedTuple = board.countPieces()

        /// Assert
        XCTAssertEqual(expectedTuple.playerOneCount, returnedTuple.playerOneCount)
        XCTAssertEqual(expectedTuple.playerTwoCount, returnedTuple.playerTwoCount)
    }
    
    /// Tests inserting a piece on a empty cell.
    func testInsertPieceEmptyCell() {
        /// Arrange
        let pieceToInsert = Piece(owner: .player1, animal: .rat)
        
        /// Act
        let result = board.insertPiece(piece: pieceToInsert, atRow: 0, andColumn: 1)

        /// Assert
        XCTAssertEqual(result, .ok)
        XCTAssertEqual(board.grid[0][1].piece, pieceToInsert)
    }
    
    /// Tests inserting a piece on a occupied cell
    func testInsertPieceNotEmptyCell() {
        /// Arrange
        let pieceToInsert = Piece(owner: .player1, animal: .cat)
        
        /// Act
        let result = board.insertPiece(piece: pieceToInsert, atRow: 0, andColumn: 0)

        /// Assert
        XCTAssertEqual(result, .failed(reason: .cellNotEmpty))
    }
    
    /// Tests inserting a piece out of bounds.
    func testInsertPieceOutOfBounds(){
        /// Arrange
        let pieceToInsert = Piece(owner: .player2, animal: .elephant)
        
        /// Act
        let result = board.insertPiece(piece: pieceToInsert, atRow: 11, andColumn: -1)
        
        /// Assert
        XCTAssertEqual(result, .failed(reason: .outOfBounds))
    }
    
    /// Tests removing a piece from a occupied cell.
    func testRemovePieceNotEmptyCell() {
        
        /// Act
        let result = board.removePiece(atRow: 0, andColumn: 0)

        /// Assert
        XCTAssertEqual(result, .ok)
    }
    
    /// Tests removing a piece from an empty cell.
    func testRemovePieceEmptyCell(){
        /// Act
        let result = board.removePiece(atRow: 0, andColumn: 1)
        
        /// Assert
        XCTAssertEqual(result, .failed(reason: .cellEmpty))
    }
    
    /// Tests removing a piece out of bounds.
    func testRemovePieceOutOfBounds(){
        /// Act
        let result = board.removePiece(atRow: -1, andColumn: 8)
        
        /// Assert
        XCTAssertEqual(result, .failed(reason: .outOfBounds))
    }
}
