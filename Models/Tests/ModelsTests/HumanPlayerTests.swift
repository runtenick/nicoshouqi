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
        
        player = HumanPlayer(withId: .player1, andName: "Human", andInputMethod: {mockMove})
    }
    
    /// Tests the initializer
    func testInitializer() {
        let expectedId = Owner.player2
        let expectedName = "Human3000"
        let expectedMove = Move(owner: .player2, rowOrigin: 0, columnOrigin: 0, rowDestination: 0, columnDestination: 1)
        
        let human = HumanPlayer(withId: .player2, andName: "Human3000", andInputMethod: {expectedMove})
        
        XCTAssertEqual(human.id, expectedId)
        XCTAssertEqual(human.name, expectedName)
    }

}
