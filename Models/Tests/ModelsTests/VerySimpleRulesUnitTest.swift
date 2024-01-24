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
    
    override func setUp() {
        super.setUp()
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

}
