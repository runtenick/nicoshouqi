//
//  File.swift
//  
//
//  Created by étudiant on 16/01/2024.
//

import Foundation

/// The possible board results.
public enum BoardResult : Equatable {
    /// The result is unknown.
    case unknown
    
    /// The result is ok.
    case ok
    
    /// The result failed.
    case failed(reason: BoardFailingReason)
}
