//
//  Owner.swift
//  
//
//  Created by étudiant on 09/01/2024.
//

import Foundation

enum Owner : CustomStringConvertible {
    case noOne // for the empty cells
    case player1
    case player2
    
    var description: String {
        switch self {
            case .noOne:
                return "x"
            case .player1:
                return "1"
            case .player2:
                return "2"
        }
    }
}
