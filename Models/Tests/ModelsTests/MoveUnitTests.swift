//
//  MoveUnitTest.swift
//  
//
//  Created by étudiant on 24/01/2024.
//

import Foundation
import XCTest
@testable import Models

/// The Move unit test class.
class MoveUnitTest: XCTestCase {
    
    var move : Move!
    
    override func setUp() {
        move = Move(owner: .player1, rowOrigin: 0, columnOrigin: 0, rowDestination: 1, columnDestination: 0)
    }
    
    /// Tests the initializer.
    func testMoveInitialization() {
        // Arrange
        let owner = Owner.player1
        let rowOrigin = 2
        let columnOrigin = 3
        let rowDestination = 4
        let columnDestination = 5
        
        // Act
        let move = Move(owner: owner, rowOrigin: rowOrigin, columnOrigin: columnOrigin, rowDestination: rowDestination, columnDestination: columnDestination)
        
        // Assert
        XCTAssertEqual(move.owner, owner)
        XCTAssertEqual(move.rowOrigin, rowOrigin)
        XCTAssertEqual(move.columnOrigin, columnOrigin)
        XCTAssertEqual(move.rowDestination, rowDestination)
        XCTAssertEqual(move.columnDestination, columnDestination)
    }
    
    /// Tests the description.
    func testDescription() {
        let expectedDescription = "1 played piece at row 0 and column 0 to row 1 and column 0"
        
        if let move = self.move {
            let description = "\(move)"
            XCTAssertEqual(expectedDescription, description)
        }
    }
}
