//
//  OwnerExtension.swift
//  
//
//  Created by étudiant on 10/01/2024.
//

import Foundation

import model

extension Owner {
    var symbol: String {
        switch self {
        case .noOne: return " "
        case .player1 return "🟡"
        case .player2 return "🔴"
        }
    }
}


