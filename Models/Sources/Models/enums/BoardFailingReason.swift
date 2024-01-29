//
//  File.swift
//  
//
//  Created by étudiant on 16/01/2024.
//

import Foundation

/// The possible reasons for a board operation to fail.
public enum BoardFailingReason: Equatable {
    /// The reason is unknown.
    case unknown
    
    /// The operation is out of bounds.
    case outOfBounds
    
    /// The cell is not empty when it should be.
    case cellNotEmpty
    
    /// The cell is empty when it should not be.
    case cellEmpty
}
