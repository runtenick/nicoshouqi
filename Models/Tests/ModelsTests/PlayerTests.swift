//
//  PlayerTests.swift
//  
//
//  Created by étudiant on 30/01/2024.
//

import XCTest
@testable import Models

final class PlayerTests: XCTestCase {

    var player: Player!
    
    override func setUp() {
        player = Player(withId: .player1, andName: "player")
    }
    
    /// Tests the player initializer.
    func testInitializer() {
        // Arrange & Act
        let player = Player(withId: .player1, andName: "Player")
        
        // Assert plyaer not nil, id and name match
        XCTAssertNotNil(player, "Player should be initialized")
        XCTAssertEqual(player?.id, .player1, "Player id should match")
        XCTAssertEqual(player?.name, "Player", "Player name should match")
    }
    
    /// Tests the player initilizer when noOne is the  id.
    func testInitializerNoOne() {
        // Arrange & Act
        let player = Player(withId: .noOne, andName: "noOne")
        
        // Assert
        XCTAssertNil(player)
        
    }
    
    /// Tests the choose move function.
    func testChooseMove() {
        // Arrange
        let rules = VerySimpleRules()
        let board = Board(grid: [[]])!
                
        // Act
        let result = player.chooseMove(in: board, with: rules)
        
        // Assert
        XCTAssertNil(result)
    }
    
    
}
