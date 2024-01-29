//
//  CellType.swift
//  
//
//  Created by étudiant on 09/01/2024.
//

import Foundation


/// The possible types of a cell on the game board.
public enum CellType {
    /// The type is unknown. Used as a default value and for debugging purposes.
    case unknown
    
    /// The cell represents a jungle.
    case jungle
    
    /// The cell represents water.
    case water
    
    /// The cell represents a trap.
    case trap
    
    /// The cell represents a den.
    case den
}

